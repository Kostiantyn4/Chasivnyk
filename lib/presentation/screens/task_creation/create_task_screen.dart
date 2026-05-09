import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../data/repositories/task_draft_repository.dart';
import '../../../core/di/providers.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/entities/value_objects/task_value_objects.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  final Task? initialTask;
  final String? taskId;
  final bool enableDraftPersistence;
  final String? projectId;
  final DateTime? initialDueDate;

  const CreateTaskScreen({
    super.key,
    this.initialTask,
    this.taskId,
    this.enableDraftPersistence = true,
    this.projectId,
    this.initialDueDate,
  });

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  // Draft keys constants
  static const String _draftKeyTitle = 'title';
  static const String _draftKeyDescription = 'description';
  static const String _draftKeyTimestamp = 'timestamp';
  
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _draftRepository = TaskDraftRepository();
  
  Timer? _autoSaveTimer;
  bool _isSaving = false;
  bool _isLoadingInitialTask = false;
  Task? _loadedTask;
  late bool _isEditing;
  late final bool _useDraftPersistence;
  String? _selectedProjectId;
  String? _selectedProjectTitle;
  String? _editingInitialProjectId;
  bool _projectChanged = false;
  DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.initialTask != null || widget.taskId != null;
    _useDraftPersistence = widget.enableDraftPersistence && !_isEditing;

    if (widget.initialTask != null) {
      final task = widget.initialTask!;
      _titleController.text = task.title.value;
      _descriptionController.text = task.description?.value ?? '';
    } else if (widget.taskId != null) {
      _isLoadingInitialTask = true;
      Future.microtask(_loadInitialTask);
    } else if (_useDraftPersistence) {
      _loadDraft();
      _startAutoSave();
    } else {
      _titleController.clear();
      _descriptionController.clear();
    }

    _selectedProjectId =
        widget.initialTask?.projectId?.value ?? widget.projectId;
    _editingInitialProjectId = widget.initialTask?.projectId?.value;
    _selectedDueDate = widget.initialTask?.dueDate ?? widget.initialDueDate;
    
    if (widget.taskId == null && _selectedProjectId != null) {
      Future.microtask(_loadProjectTitle);
    }
    
    // Listen to changes
    _titleController.addListener(_onFieldChanged);
    _descriptionController.addListener(_onFieldChanged);
  }

  Future<void> _loadProjectTitle() async {
    final projectId = _selectedProjectId;
    if (projectId == null) return;
    try {
      final service = ref.read(projectServiceProvider);
      final project = await service.findById(projectId);
      if (!mounted) return;
      if (project == null) {
        _updateProjectSelection(null, null);
      } else {
        _updateProjectSelection(project.id.value, project.title.value, notify: false);
      }
    } catch (_) {
      // Ignore errors silently; UI will keep previous selection
    }
  }

  void _updateProjectSelection(
    String? projectId,
    String? projectTitle, {
    bool notify = true,
  }) {
    void apply() {
      _selectedProjectId = projectId;
      _selectedProjectTitle = projectTitle;
      if (_isEditing) {
        _projectChanged =
            (_selectedProjectId ?? '') != (_editingInitialProjectId ?? '');
      }
    }

    if (notify) {
      setState(apply);
    } else {
      apply();
    }
  }

  Future<void> _loadInitialTask() async {
    final repository = await ref.read(taskRepositoryProvider.future);
    final task = await repository.findById(TaskId(widget.taskId!));
    if (task != null && mounted) {
      setState(() {
        _loadedTask = task;
        _titleController.text = task.title.value;
        _descriptionController.text = task.description?.value ?? '';
        _selectedProjectId = task.projectId?.value;
        _editingInitialProjectId = task.projectId?.value;
        _selectedDueDate = task.dueDate;
        _isLoadingInitialTask = false;
      });
      if (_selectedProjectId != null) {
        await _loadProjectTitle();
      }
    } else if (mounted) {
      setState(() => _isLoadingInitialTask = false);
    }
  }

  Future<void> _handleDelete() async {
    if (!_isEditing) return;
    final localization = AppLocalizations.of(context)!;
    final taskToDelete = widget.initialTask ?? _loadedTask;
    if (taskToDelete == null) return;

    bool proceed = true;
    if (taskToDelete.subtasks.isNotEmpty) {
      proceed = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.accentColor,
              title: Text(
                localization.deleteButton,
                style: TextStyle(color: AppColors.textPrimary),
              ),
              content: Text(
                localization.deleteTaskConfirmation,
                style: TextStyle(color: AppColors.textSecondary),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(localization.discard),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    localization.deleteButton,
                    style: TextStyle(color: Colors.red.shade300),
                  ),
                ),
              ],
            ),
          ) ??
          false;
    }

    if (!proceed) return;

    setState(() => _isSaving = true);

    try {
      final taskService = await ref.read(taskServiceProvider.future);
      await taskService.deleteTask(taskToDelete);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(localization.taskDeleted),
            backgroundColor: Colors.green,
          ),
        );
        _invalidateTaskProviders();
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${localization.errorPrefix}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    _titleController.removeListener(_onFieldChanged);
    _descriptionController.removeListener(_onFieldChanged);
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _startAutoSave() {
    if (!_useDraftPersistence) return;
    _autoSaveTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _saveDraft(),
    );
  }

  void _onFieldChanged() {
    // Auto-save will handle this
  }

  Future<void> _loadDraft() async {
    if (!_useDraftPersistence) return;
    final draft = await _draftRepository.loadDraft();
    if (draft != null && mounted) {
      setState(() {
        _titleController.text = draft[_draftKeyTitle] ?? '';
        _descriptionController.text = draft[_draftKeyDescription] ?? '';
      });
      
      if (_hasContent) {
        _showDraftRestoredMessage();
      }
    }
  }

  void _showDraftRestoredMessage() {
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.draftRestored),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  String _formatDueDate(DateTime date) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.yMMMMd(locale).format(date);
  }

  Future<void> _saveDraft() async {
    if (!_useDraftPersistence) return;
    if (!_hasContent) return;
    
    final draft = {
      _draftKeyTitle: _titleController.text,
      _draftKeyDescription: _descriptionController.text,
      _draftKeyTimestamp: DateTime.now().toIso8601String(),
    };
    
    await _draftRepository.saveDraft(draft);
  }

  Future<void> _clearDraft() async {
    if (!_useDraftPersistence) return;
    await _draftRepository.clearDraft();
  }

  void _invalidateTaskProviders() {
    if (_editingInitialProjectId != null) {
      ref.invalidate(projectTasksProvider(_editingInitialProjectId!));
    }
    if (_selectedProjectId != null &&
        _selectedProjectId != _editingInitialProjectId) {
      ref.invalidate(projectTasksProvider(_selectedProjectId!));
    }
    if (widget.taskId != null) {
      ref.invalidate(singleTaskProvider(widget.taskId!));
    }
    ref.invalidate(tasksProvider);
  }

  bool get _hasContent {
    return _titleController.text.trim().isNotEmpty ||
           _descriptionController.text.trim().isNotEmpty;
  }

  bool get _hasChanges {
    if (_isEditing) {
      final task = widget.initialTask ?? _loadedTask;
      if (task == null) return false;
      return _titleController.text.trim() != task.title.value ||
             _descriptionController.text.trim() != (task.description?.value ?? '') ||
             _selectedDueDate != task.dueDate ||
             _selectedProjectId != task.projectId?.value;
    } else {
      return _hasContent;
    }
  }

  Future<bool> _handleClose() async {
    if (!_hasChanges) {
      await _clearDraft();
      return true;
    }
    
    final localization = AppLocalizations.of(context)!;
    final shouldClose = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.accentColor,
        title: Text(
          localization.discardChangesTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          _useDraftPersistence
              ? localization.discardChangesMessage
              : localization.discardChangesMessageNoSave,
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              localization.continueEditing,
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              localization.discard,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
    
    return shouldClose ?? false;
  }

  Future<void> _handleSave() async {
    final localization = AppLocalizations.of(context)!;
    
    // Validate
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(localization.taskNameRequired),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    
    setState(() => _isSaving = true);
    
    try {
      final taskService = await ref.read(taskServiceProvider.future);

      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim();

      if (_isEditing) {
        await taskService.updateTask(
            widget.initialTask ?? _loadedTask!,
            title: title,
            description: description,
            dueDate: _selectedDueDate,
            projectId: _selectedProjectId,
            changeProject: _projectChanged,
          );
      } else {
        await taskService.createTask(
            title,
            description: description,
            dueDate: _selectedDueDate,
            projectId: _selectedProjectId,
          );
      }
      
      // Clear draft
      await _clearDraft();
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? localization.taskUpdated : localization.taskCreated),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
        
        _invalidateTaskProviders();
        if (mounted) context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${localization.errorPrefix}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    if (_isLoadingInitialTask) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        
        final shouldClose = await _handleClose();
        if (shouldClose && mounted) context.pop();
      },
      child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: AppColors.textPrimary,
          onPressed: () async {
            final shouldClose = await _handleClose();
            if (shouldClose && mounted) context.pop();
          },
        ),
        title: Text(
          _isEditing ? localization.editTaskTitle : localization.newTask,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title field
                  _buildLabel(localization.taskNameLabel),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _titleController,
                    hint: localization.taskNameHint,
                  ),
                  const SizedBox(height: 24),

                  // Description field
                  _buildLabel(localization.taskDetailsLabel),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _descriptionController,
                    hint: localization.taskDetailsHint,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 24),

                  // Options section
                  _buildOptionCard(
                    icon: Icons.calendar_today,
                    title: localization.dueTimeOption,
                    value: _selectedDueDate != null
                        ? _formatDueDate(_selectedDueDate!)
                        : localization.dueTimeNotSet,
                    onTap: () {
                      // TODO: Navigate to date picker
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.notifications,
                    title: localization.remindersOption,
                    value: localization.remindersNone,
                    onTap: () {
                      // TODO: Navigate to reminders
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.playlist_add_check,
                    title: localization.subtasksOption,
                    value: localization.subtasksNone,
                    onTap: () {
                      // TODO: Navigate to subtasks
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.label,
                    title: localization.tagsOption,
                    value: localization.tagsNone,
                    onTap: () {
                      // TODO: Navigate to tags
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.topic,
                    title: localization.projectOption,
                    value: _selectedProjectTitle ?? localization.projectNotSelected,
                    onTap: () {
                      // TODO: Navigate to project picker
                    },
                  ),
                ],
              ),
            ),
          ),

          // Save button (sticky footer)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border(
                top: BorderSide(
                  color: AppColors.secondaryColor,
                  width: 1,
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  if (_isEditing) ...[
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                        onPressed: _isSaving ? null : _handleDelete,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                            disabledBackgroundColor: Colors.red.shade200,
                        ),
                        child: _isSaving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text(
                                localization.deleteButton,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _handleSave,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          disabledBackgroundColor:
                              AppColors.primaryColor.withValues(alpha: 0.5),
                        ),
                        child: _isSaving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text(
                                localization.saveButton,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
        filled: true,
        fillColor: AppColors.accentColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

}
