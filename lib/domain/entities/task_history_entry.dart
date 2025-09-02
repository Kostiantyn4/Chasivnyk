import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects/task_value_objects.dart';
import 'value_objects/json_converters.dart';

part 'task_history_entry.freezed.dart';
part 'task_history_entry.g.dart';

enum TaskHistoryAction {
  created,
  statusChanged,
  priorityChanged,
  dueDateUpdated,
  titleUpdated,
  descriptionUpdated,
  subtaskAdded,
  subtaskRemoved,
  subtaskToggled,
  reminderAdded,
  reminderRemoved,
  tagAdded,
  tagRemoved,
  attachmentAdded,
  attachmentRemoved,
  commentAdded,
  archived,
  restored,
}

@freezed
class TaskHistoryEntry with _$TaskHistoryEntry {
  const factory TaskHistoryEntry({
    @TaskIdConverter() required TaskId id,
    @TaskIdConverter() required TaskId taskId,
    required TaskHistoryAction action,
    String? oldValue,
    String? newValue,
    String? description,
    required DateTime timestamp,
    String? userId, // Who made the change
  }) = _TaskHistoryEntry;

  factory TaskHistoryEntry.fromJson(Map<String, dynamic> json) => 
      _$TaskHistoryEntryFromJson(json);

  factory TaskHistoryEntry.create({
    required TaskId taskId,
    required TaskHistoryAction action,
    String? oldValue,
    String? newValue,
    String? description,
    String? userId,
  }) {
    return TaskHistoryEntry(
      id: TaskId.generate(),
      taskId: taskId,
      action: action,
      oldValue: oldValue,
      newValue: newValue,
      description: description,
      timestamp: DateTime.now(),
      userId: userId,
    );
  }
}

extension TaskHistoryEntryX on TaskHistoryEntry {
  /// Returns a human-readable description of the change
  String get humanReadableDescription {
    switch (action) {
      case TaskHistoryAction.created:
        return 'Task created';
      case TaskHistoryAction.statusChanged:
        return 'Status changed from "$oldValue" to "$newValue"';
      case TaskHistoryAction.priorityChanged:
        return 'Priority changed from "$oldValue" to "$newValue"';
      case TaskHistoryAction.dueDateUpdated:
        return oldValue == null 
            ? 'Due date set to "$newValue"'
            : 'Due date changed from "$oldValue" to "$newValue"';
      case TaskHistoryAction.titleUpdated:
        return 'Title changed from "$oldValue" to "$newValue"';
      case TaskHistoryAction.descriptionUpdated:
        return oldValue == null
            ? 'Description added'
            : 'Description updated';
      case TaskHistoryAction.subtaskAdded:
        return 'Subtask added: "$newValue"';
      case TaskHistoryAction.subtaskRemoved:
        return 'Subtask removed: "$oldValue"';
      case TaskHistoryAction.subtaskToggled:
        return 'Subtask "$oldValue" marked as ${newValue == "true" ? "completed" : "incomplete"}';
      case TaskHistoryAction.reminderAdded:
        return 'Reminder added for $newValue';
      case TaskHistoryAction.reminderRemoved:
        return 'Reminder removed';
      case TaskHistoryAction.tagAdded:
        return 'Tag added: "$newValue"';
      case TaskHistoryAction.tagRemoved:
        return 'Tag removed: "$oldValue"';
      case TaskHistoryAction.attachmentAdded:
        return 'Attachment added: "$newValue"';
      case TaskHistoryAction.attachmentRemoved:
        return 'Attachment removed: "$oldValue"';
      case TaskHistoryAction.commentAdded:
        return 'Comment added';
      case TaskHistoryAction.archived:
        return 'Task archived';
      case TaskHistoryAction.restored:
        return 'Task restored from archive';
    }
  }

  /// Returns true if this is a significant change that should be highlighted
  bool get isSignificantChange {
    return [
      TaskHistoryAction.created,
      TaskHistoryAction.statusChanged,
      TaskHistoryAction.priorityChanged,
      TaskHistoryAction.dueDateUpdated,
      TaskHistoryAction.archived,
      TaskHistoryAction.restored,
    ].contains(action);
  }
}
