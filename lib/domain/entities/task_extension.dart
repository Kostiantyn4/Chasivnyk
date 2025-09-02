import 'task.dart';
import 'value_objects/task_value_objects.dart';

extension TaskX on Task {
  bool get isOverdue =>
      dueDate != null && dueDate!.isBefore(DateTime.now()) && 
      (status == TaskStatus.active || status == TaskStatus.inProgress);

  bool get isDone => status == TaskStatus.done;
  bool get isArchived => status == TaskStatus.archived;
  bool get isInProgress => status == TaskStatus.inProgress;
  bool get isActive => status == TaskStatus.active;

  bool get isCritical => priority == TaskPriority.critical;
  bool get isHighPriority => priority == TaskPriority.high;
  bool get isMediumPriority => priority == TaskPriority.medium;
  bool get isLowPriority => priority == TaskPriority.low;

  /// Calculates progress based on completed subtasks
  /// Returns 1.0 if task is done or has no subtasks
  /// Returns percentage of completed subtasks otherwise
  double get progress {
    if (isDone) return 1.0;
    if (subtasks.isEmpty) return 0.0;
    
    final completedSubtasks = subtasks.where((s) => s.isDone).length;
    return completedSubtasks / subtasks.length;
  }

  /// Returns true if all subtasks are completed
  bool get allSubtasksCompleted => 
      subtasks.isNotEmpty && subtasks.every((s) => s.isDone);

  /// Validates that completedAt is set when status is done
  bool get isValidCompletionState {
    if (status == TaskStatus.done) {
      return completedAt != null;
    }
    return true; // Other statuses don't require completedAt
  }

  /// Generates searchable text for indexing and search functionality
  /// Combines title, description, tags, and subtask titles
  String get searchableText {
    final buffer = StringBuffer();
    
    // Add title
    buffer.write(title.value.toLowerCase());
    
    // Add description if exists
    if (description != null && description!.value.isNotEmpty) {
      buffer.write(' ${description!.value.toLowerCase()}');
    }
    
    // Add tags
    if (tags.isNotEmpty) {
      buffer.write(' ${tags.map((t) => t.value).join(' ')}');
    }
    
    // Add subtask titles
    if (subtasks.isNotEmpty) {
      buffer.write(' ${subtasks.map((s) => s.title.value.toLowerCase()).join(' ')}');
    }
    
    return buffer.toString().trim();
  }

  Task markAsDone() {
    if (isDone) throw StateError('Task is already done');
    if (isArchived) throw StateError('Cannot mark archived task as done');
    final now = DateTime.now();
    return copyWith(
      status: TaskStatus.done,
      updatedAt: now,
      completedAt: now,
    );
  }

  Task startProgress() {
    if (isInProgress) throw StateError('Task is already in progress');
    if (isDone) throw StateError('Cannot start completed task');
    if (isArchived) throw StateError('Cannot start archived task');
    return copyWith(
      status: TaskStatus.inProgress,
      updatedAt: DateTime.now(),
      completedAt: null,
    );
  }

  Task markAsActive() {
    if (isActive) throw StateError('Task is already active');
    if (isArchived) throw StateError('Cannot activate archived task');
    return copyWith(
      status: TaskStatus.active,
      updatedAt: DateTime.now(),
      completedAt: null,
    );
  }

  /// Updates task status and ensures completedAt is properly set/cleared
  Task updateStatus(TaskStatus newStatus) {
    if (status == newStatus) throw StateError('Task already has this status');
    if (isArchived && newStatus != TaskStatus.archived) {
      throw StateError('Cannot change status of archived task');
    }
    
    final now = DateTime.now();
    return copyWith(
      status: newStatus,
      updatedAt: now,
      completedAt: newStatus == TaskStatus.done ? (completedAt ?? now) : null,
    );
  }

  Task archive() {
    if (isArchived) throw StateError('Task is already archived');
    return copyWith(
      status: TaskStatus.archived,
      updatedAt: DateTime.now(),
    );
  }

  Task addSubtask(String title) {
    final newSubtask = Subtask.create(title: title);
    if (subtasks.any((s) => s.id == newSubtask.id)) {
      throw ArgumentError('Subtask with this ID already exists');
    }
    return copyWith(
      subtasks: [...subtasks, newSubtask],
      updatedAt: DateTime.now(),
    );
  }

  Task removeSubtask(TaskId subtaskId) {
    final index = subtasks.indexWhere((s) => s.id == subtaskId);
    if (index == -1) throw StateError('Subtask not found');
    
    final newSubtasks = List<Subtask>.from(subtasks);
    newSubtasks.removeAt(index);
    
    return copyWith(
      subtasks: newSubtasks,
      updatedAt: DateTime.now(),
    );
  }

  Task toggleSubtask(TaskId subtaskId) {
    final index = subtasks.indexWhere((s) => s.id == subtaskId);
    if (index == -1) throw StateError('Subtask not found');
    
    final newSubtasks = List<Subtask>.from(subtasks);
    newSubtasks[index] = newSubtasks[index].copyWith(isDone: !newSubtasks[index].isDone);
    
    return copyWith(
      subtasks: newSubtasks,
      updatedAt: DateTime.now(),
    );
  }

  Task addReminder(DateTime time) {
    final newReminder = Reminder.create(time: time);
    if (reminders.any((r) => r.id == newReminder.id)) {
      throw ArgumentError('Reminder with this ID already exists');
    }
    return copyWith(
      reminders: [...reminders, newReminder],
      updatedAt: DateTime.now(),
    );
  }

  Task removeReminder(TaskId reminderId) {
    final index = reminders.indexWhere((r) => r.id == reminderId);
    if (index == -1) throw ArgumentError('Reminder not found');
    
    final newReminders = List<Reminder>.from(reminders);
    newReminders.removeAt(index);
    
    return copyWith(
      reminders: newReminders,
      updatedAt: DateTime.now(),
    );
  }

  Task addTag(String tag) {
    if (tag.trim().isEmpty) throw ArgumentError('Tag cannot be empty');
    if (tag.length > 50) throw ArgumentError('Tag length cannot exceed 50 characters');
    final taskTag = TaskTag(tag);
    if (tags.contains(taskTag)) throw ArgumentError('Tag already exists');
    
    return copyWith(
      tags: [...tags, taskTag],
      updatedAt: DateTime.now(),
    );
  }

  Task removeTag(String tag) {
    final taskTag = TaskTag(tag);
    if (!tags.contains(taskTag)) throw ArgumentError('Tag not found');
    
    final newTags = List<TaskTag>.from(tags);
    newTags.remove(taskTag);
    
    return copyWith(
      tags: newTags,
      updatedAt: DateTime.now(),
    );
  }

  Task updatePriority(TaskPriority newPriority) {
    if (priority == newPriority) throw StateError('Task already has this priority');
    if (isArchived) throw StateError('Cannot update priority of archived task');
    
    return copyWith(
      priority: newPriority,
      updatedAt: DateTime.now(),
    );
  }

  Task escalate() {
    switch (priority) {
      case TaskPriority.low:
        return updatePriority(TaskPriority.medium);
      case TaskPriority.medium:
        return updatePriority(TaskPriority.high);
      case TaskPriority.high:
        return updatePriority(TaskPriority.critical);
      case TaskPriority.critical:
        throw StateError('Cannot escalate critical priority');
    }
  }

  Task deescalate() {
    switch (priority) {
      case TaskPriority.critical:
        return updatePriority(TaskPriority.high);
      case TaskPriority.high:
        return updatePriority(TaskPriority.medium);
      case TaskPriority.medium:
        return updatePriority(TaskPriority.low);
      case TaskPriority.low:
        throw StateError('Cannot deescalate low priority');
    }
  }
}
