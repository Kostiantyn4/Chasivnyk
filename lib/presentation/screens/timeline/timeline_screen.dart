import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/localization/app_localizations_helper.dart';
import '../../../core/di/providers.dart';
import '../../../data/repositories/task_order_repository.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/entities/value_objects/task_value_objects.dart';
import '../../models/project_context.dart';
import 'modes/task_list_mode.dart';
import 'widgets/task_calendar_overlay.dart';
import '../task_creation/create_task_screen.dart';
import '../../widgets/buttons/primary_fab.dart';

class TimelineScreen extends ConsumerStatefulWidget {
  final TaskListMode mode;

  const TimelineScreen({
    super.key,
    TaskListMode? mode,
  }) : mode = mode ?? const TodayTaskListMode();

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  late final TaskListMode _mode;

  bool _isCalendarVisible = false;
  DateTime _selectedDate = DateTime.now();
  bool _isQuickAddExpanded = false;
  bool _isQuickAddSaving = false;
  final TextEditingController _quickAddController = TextEditingController();
  final FocusNode _quickAddFocusNode = FocusNode();
  final GlobalKey _quickAddKey = GlobalKey();
  final TaskOrderRepository _taskOrderRepository = TaskOrderRepository();
  List<String> _storedOrder = [];

  ProjectContext? get _projectContext => _mode.projectContext;
  String? get _projectId => _mode.projectId;
  bool get _usesDateFilter => _mode.usesDateFilter;
  bool get _showsCalendarOverlay => _mode.showsCalendarOverlay;

  void _initState() {
    _mode = widget.mode;
    _selectedDate = DateTime.now();
    _isCalendarVisible = false;
    _loadOrderForSelectedDate();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _initState();
  }
  
  void _invalidateTasksSource() {
    final projectId = _projectId;
    if (projectId == null) {
      ref.invalidate(tasksProvider);
    } else {
      ref.invalidate(projectTasksProvider(projectId));
    }
  }

  @override
  void dispose() {
    _quickAddController.dispose();
    _quickAddFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectId = _projectId;
    final tasksAsync = projectId == null
        ? ref.watch(tasksProvider)
        : ref.watch(projectTasksProvider(projectId));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: PrimaryFab(
          onPressed: () async {
            if (_isQuickAddExpanded) {
              _collapseQuickAdd();
              return;
            }
            final task = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateTaskScreen(
                  enableDraftPersistence: false,
                  projectContext: _projectContext,
                ),
              ),
            );
            if (task != null) {
              _invalidateTasksSource();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: () {
                bool needsSetState = false;
                if (_isCalendarVisible) {
                  _isCalendarVisible = false;
                  needsSetState = true;
                }
                if (_isQuickAddExpanded) {
                  _collapseQuickAdd();
                  needsSetState = true;
                }
                if (needsSetState) {
                  setState(() {});
                }
              },
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: tasksAsync.when(
                      data: (tasks) => _buildTasksContent(tasks),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, _) => Center(
                        child: Text(
                          error.toString(),
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showsCalendarOverlay)
              TaskCalendarOverlay(
                isCalendarVisible: _isCalendarVisible,
                selectedDate: _selectedDate,
                onShowRequest: () {
                  setState(() {
                    _isCalendarVisible = true;
                  });
                },
                onDateSelected: (date) {
                  setState(() {
                    _collapseQuickAdd();
                    _selectedDate = date;
                  });
                  _isCalendarVisible = false;
                  _loadOrderForSelectedDate();
                },
                onToggleVisibility: () {
                  setState(() {
                    _collapseQuickAdd();
                    _isCalendarVisible = !_isCalendarVisible;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return _mode.buildHeader(
      context,
      () => Navigator.of(context).maybePop(),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mode.buildTitle(context, _selectedDate),
        if (_usesDateFilter) ...[
          const SizedBox(height: 2),
          Text(
            DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString()).format(_selectedDate),
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTasksContent(List<Task> tasks) {
    final filtered = _tasksForSelectedDate(tasks);
    final activeTasks = filtered.where((task) => task.status != TaskStatus.done).toList();
    final completedTasks = filtered.where((task) => task.status == TaskStatus.done).toList();
    final orderedActive = _applyOrder(activeTasks);

    final slivers = <Widget>[
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        sliver: SliverToBoxAdapter(child: _buildTitle()),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
    ];

    if (filtered.isEmpty) {
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(child: _buildEmptyState()),
        ),
      );
    } else {
      if (orderedActive.isNotEmpty) {
        slivers.add(
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverReorderableList(
              itemBuilder: (context, index) {
                final task = orderedActive[index];
                return ReorderableDelayedDragStartListener(
                  key: ValueKey(task.id.value),
                  index: index,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildTaskItem(task),
                  ),
                );
              },
              itemCount: orderedActive.length,
              onReorder: (oldIndex, newIndex) =>
                  _onReorderActiveTasks(orderedActive, oldIndex, newIndex),
            ),
          ),
        );
      } else {
        slivers.add(
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  Localization.current.addTaskButton,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      if (completedTasks.isNotEmpty) {
        slivers.add(
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                Localization.current.completedTasksTitle,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
        slivers.add(
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildTaskItem(task),
                );
              },
            ),
          ),
        );
      }
    }

    slivers.add(
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 200),
        sliver: SliverToBoxAdapter(child: _buildQuickAddSection()),
      ),
    );

    return CustomScrollView(slivers: slivers);
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Localization.current.addTaskButton,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Localization.current.taskDetailsHint,
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem(Task task) {
    final isCompleted = task.status == TaskStatus.done;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _openTaskEditor(task),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCompleted ? AppColors.primaryColor : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 48,
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.successColor : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title.value,
                    style: TextStyle(
                      color:
                          isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTaskTime(task),
                    style: TextStyle(
                      color: isCompleted
                          ? AppColors.textSecondary.withValues(alpha: 0.7)
                          : AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => _toggleTaskStatus(task),
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? AppColors.primaryColor : Colors.transparent,
                  border: Border.all(
                    color: isCompleted ? Colors.transparent : AppColors.textSecondary,
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
  String _formatTaskTime(Task task) {
    if (task.dueDate == null) {
      return Localization.current.dueTimeNotSet;
    }
    return DateFormat.yMMMd(Localizations.localeOf(context).toString())
        .add_Hm()
        .format(task.dueDate!);
  }

  Widget _buildQuickAddSection() {
    return AnimatedCrossFade(
      crossFadeState:
          _isQuickAddExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
      firstChild: _buildQuickAddCollapsed(),
      secondChild: KeyedSubtree(
        key: _quickAddKey,
        child: _buildQuickAddExpanded(),
      ),
    );
  }

  Widget _buildQuickAddCollapsed() {
    return InkWell(
      onTap: _expandQuickAdd,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.textSecondary.withAlpha(77),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: AppColors.textPrimary,
            ),
            const SizedBox(width: 8),
            Text(
              Localization.current.addTaskButton,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAddExpanded() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Localization.current.addTaskButton,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _quickAddController,
                  focusNode: _quickAddFocusNode,
                  maxLines: 1,
                  enabled: !_isQuickAddSaving,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: Localization.current.taskNameHint,
                    hintStyle: TextStyle(
                      color: AppColors.textSecondary,
                    ),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _isQuickAddSaving ? null : _handleQuickAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: _isQuickAddSaving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(Localization.current.saveButton),
                ),
              ),
              IconButton(
                onPressed: _isQuickAddSaving
                    ? null
                    : () {
                        _collapseQuickAdd(clearText: true);
                      },
                icon: const Icon(Icons.close),
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleQuickAdd() async {
    final text = _quickAddController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Localization.current.taskNameRequired),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isQuickAddSaving = true);

    try {
      final service = await ref.read(taskServiceProvider.future);
      final targetDay = _selectedDate;
      DateTime dueDate = DateTime(
        targetDay.year,
        targetDay.month,
        targetDay.day,
        23,
        59,
        59,
      );
      final now = DateTime.now();
      if (dueDate.isBefore(now)) {
        dueDate = now.add(const Duration(minutes: 5));
      }

      await service.createTask(
        text,
        dueDate: dueDate,
        duration: TaskDuration.day,
        projectId: _projectId,
      );

      _collapseQuickAdd(clearText: true);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(Localization.current.taskCreated),
            backgroundColor: Colors.green,
          ),
        );
      }

      _invalidateTasksSource();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${Localization.current.errorPrefix}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isQuickAddSaving = false);
      }
    }
  }

  void _expandQuickAdd() {
    if (_isQuickAddExpanded) return;
    setState(() {
      _isQuickAddExpanded = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FocusScope.of(context).requestFocus(_quickAddFocusNode);
        final quickAddContext = _quickAddKey.currentContext;
        if (quickAddContext != null) {
          Scrollable.ensureVisible(
            quickAddContext,
            duration: const Duration(milliseconds: 300),
            alignment: 0.4,
          );
        }
      }
    });
  }

  void _collapseQuickAdd({bool clearText = false}) {
    if (!_isQuickAddExpanded && !clearText) {
      return;
    }
    if (clearText) {
      _quickAddController.clear();
    }
    _quickAddFocusNode.unfocus();
    setState(() {
      _isQuickAddExpanded = false;
    });
  }

  List<Task> _tasksForSelectedDate(List<Task> tasks) {
    if (!_usesDateFilter) {
      return tasks;
    }
    return tasks.where((task) {
      if (task.dueDate == null) return false;
      return DateUtils.isSameDay(task.dueDate, _selectedDate);
    }).toList();
  }

  Future<void> _openTaskEditor(Task task) async {
    _collapseQuickAdd();
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateTaskScreen(initialTask: task),
      ),
    );
    if (result != null && mounted) {
      _invalidateTasksSource();
    }
  }

  Future<void> _toggleTaskStatus(Task task) async {
    final service = await ref.read(taskServiceProvider.future);
    final newStatus =
        task.status == TaskStatus.done ? TaskStatus.active : TaskStatus.done;
    await service.updateStatus(task, newStatus);
    if (newStatus == TaskStatus.done) {
      setState(() {
        _storedOrder.remove(task.id.value);
      });
      await _taskOrderRepository.saveOrder(_selectedDate, _storedOrder, projectId: _projectId);
    } else {
      setState(() {
        if (!_storedOrder.contains(task.id.value)) {
          _storedOrder.add(task.id.value);
        }
      });
      await _taskOrderRepository.saveOrder(_selectedDate, _storedOrder, projectId: _projectId);
    }
    if (mounted) {
      _invalidateTasksSource();
    }
  }

  List<Task> _applyOrder(List<Task> tasks) {
    if (_storedOrder.isEmpty) return tasks;
    final remaining = {for (final task in tasks) task.id.value: task};
    final ordered = <Task>[];
    for (final id in _storedOrder) {
      final task = remaining.remove(id);
      if (task != null) {
        ordered.add(task);
      }
    }
    ordered.addAll(remaining.values);
    return ordered;
  }

  Future<void> _loadOrderForSelectedDate() async {
    final order = await _taskOrderRepository.loadOrder(_selectedDate, projectId: _projectId);
    if (mounted) {
      setState(() {
        _storedOrder = order;
      });
    }
  }

  void _onReorderActiveTasks(List<Task> tasks, int oldIndex, int newIndex) {
    setState(() {
      final reordered = List<Task>.from(tasks);
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final task = reordered.removeAt(oldIndex);
      reordered.insert(newIndex, task);
      _storedOrder = reordered.map((task) => task.id.value).toList();
    });
    _taskOrderRepository.saveOrder(_selectedDate, _storedOrder, projectId: _projectId);
  }
}
