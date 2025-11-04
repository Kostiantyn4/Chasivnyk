import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../data/repositories/task_draft_repository.dart';
import '../../../domain/entities/task.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  // Draft keys constants
  static const String _draftKeyTitle = 'title';
  static const String _draftKeyDescription = 'description';
  static const String _draftKeyTimestamp = 'timestamp';
  
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _draftRepository = TaskDraftRepository();
  
  Timer? _autoSaveTimer;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadDraft();
    _startAutoSave();
    
    // Listen to changes
    _titleController.addListener(_onFieldChanged);
    _descriptionController.addListener(_onFieldChanged);
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
    _autoSaveTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _saveDraft(),
    );
  }

  void _onFieldChanged() {
    // Auto-save will handle this
  }

  Future<void> _loadDraft() async {
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

  Future<void> _saveDraft() async {
    if (!_hasContent) return;
    
    final draft = {
      _draftKeyTitle: _titleController.text,
      _draftKeyDescription: _descriptionController.text,
      _draftKeyTimestamp: DateTime.now().toIso8601String(),
    };
    
    await _draftRepository.saveDraft(draft);
  }

  Future<void> _clearDraft() async {
    await _draftRepository.clearDraft();
  }

  bool get _hasContent {
    return _titleController.text.trim().isNotEmpty ||
           _descriptionController.text.trim().isNotEmpty;
  }

  Future<bool> _handleClose() async {
    if (!_hasContent) {
      await _clearDraft();
      return true;
    }
    
    final l10n = AppLocalizations.of(context)!;
    final shouldClose = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.accentColor,
        title: Text(
          l10n.discardChangesTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.discardChangesMessage,
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              l10n.continueEditing,
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.discard,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
    
    return shouldClose ?? false;
  }

  Future<void> _handleSave() async {
    final l10n = AppLocalizations.of(context)!;
    
    // Validate
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.taskNameRequired),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    
    setState(() => _isSaving = true);
    
    try {
      // Create task
      final task = Task.create(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );
      
      // Clear draft
      await _clearDraft();
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.taskCreated),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
        
        // Return task to previous screen
        Navigator.of(context).pop(task);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.errorPrefix}: $e'),
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
    final l10n = AppLocalizations.of(context)!;
    
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        
        final navigator = Navigator.of(context);
        final shouldClose = await _handleClose();
        if (shouldClose && mounted) {
          navigator.pop();
        }
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
            final navigator = Navigator.of(context);
            final shouldClose = await _handleClose();
            if (shouldClose && mounted) {
              navigator.pop();
            }
          },
        ),
        title: Text(
          l10n.newTask,
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
                  _buildLabel(l10n.taskNameLabel),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _titleController,
                    hint: l10n.taskNameHint,
                  ),
                  const SizedBox(height: 24),

                  // Description field
                  _buildLabel(l10n.taskDetailsLabel),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _descriptionController,
                    hint: l10n.taskDetailsHint,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 24),

                  // Options section
                  _buildOptionCard(
                    icon: Icons.calendar_today,
                    title: l10n.dueTimeOption,
                    value: l10n.dueTimeNotSet,
                    onTap: () {
                      // TODO: Navigate to date picker
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.notifications,
                    title: l10n.remindersOption,
                    value: l10n.remindersNone,
                    onTap: () {
                      // TODO: Navigate to reminders
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.playlist_add_check,
                    title: l10n.subtasksOption,
                    value: l10n.subtasksNone,
                    onTap: () {
                      // TODO: Navigate to subtasks
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.label,
                    title: l10n.tagsOption,
                    value: l10n.tagsNone,
                    onTap: () {
                      // TODO: Navigate to tags
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildOptionCard(
                    icon: Icons.topic,
                    title: l10n.projectOption,
                    value: l10n.projectNotSelected,
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
              child: SizedBox(
                width: double.infinity,
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
                    disabledBackgroundColor: AppColors.primaryColor.withValues(alpha: 0.5),
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
                          l10n.saveButton,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
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
