import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'value_objects/task_value_objects.dart';
import 'value_objects/json_converters.dart';
import 'task_comment.dart';
import 'task_attachment.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum TaskStatus { active, inProgress, done, archived }

@freezed
class Task with _$Task {
  const factory Task({
    @TaskIdConverter() required TaskId id,
    @TaskTitleConverter() required TaskTitle title,
    @TaskDescriptionConverter() TaskDescription? description,
    DateTime? dueDate,
    // Duration - how long the task is active for
    TaskDuration? duration,
    CustomDuration? customDuration, // When duration == TaskDuration.custom
    // Recurrence - when/how the task repeats (RFC 5545 RRULE)
    String? rrule, // e.g., "FREQ=WEEKLY;BYDAY=MO,WE,FR"
    DateTime? recurrenceEnd, // When to stop repeating
    @Default([]) List<Reminder> reminders,
    @Default([]) List<Subtask> subtasks,
    @Default([]) @TaskTagConverter() List<TaskTag> tags,
    @ProjectIdConverter() ProjectId? projectId,
    @Default(TaskStatus.active) TaskStatus status,
    @Default(TaskPriority.medium) @TaskPriorityConverter() TaskPriority priority,
    @Default([]) List<TaskComment> comments,
    @Default([]) List<TaskAttachment> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? completedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);


  factory Task.create({
    required String title,
    String? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    List<TaskTag>? tags,
    String? projectId,
    TaskPriority? priority,
  }) {
    if (duration == TaskDuration.custom && customDuration == null) {
      throw ArgumentError('Custom duration requires customDuration parameter');
    }

    if (dueDate != null && dueDate.isBefore(DateTime.now())) {
      throw ArgumentError('Due date cannot be in the past');
    }

    final now = DateTime.now();
    return Task(
      id: TaskId.generate(),
      title: TaskTitle(title),
      description: description != null ? TaskDescription(description) : null,
      dueDate: dueDate,
      duration: duration,
      customDuration: customDuration,
      rrule: rrule,
      recurrenceEnd: recurrenceEnd,
      tags: tags ?? const [],
      projectId: projectId != null ? ProjectId(projectId) : null,
      priority: priority ?? TaskPriority.medium,
      createdAt: now,
      updatedAt: now,
      comments: const [],
      attachments: const [],
    );
  }

}

@freezed
class Subtask with _$Subtask {
  const factory Subtask({
    @TaskIdConverter() required TaskId id,
    @TaskTitleConverter() required TaskTitle title,
    @Default(false) bool isDone,
  }) = _Subtask;

  factory Subtask.fromJson(Map<String, dynamic> json) => _$SubtaskFromJson(json);


  factory Subtask.create({required String title}) {
    return Subtask(
      id: TaskId(const Uuid().v4()),
      title: TaskTitle(title), // TaskTitle constructor will validate title
    );
  }

}

@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    @TaskIdConverter() required TaskId id,
    required DateTime time,
    @Default(false) bool isTriggered,
    @Default(ReminderRepeat.none) @ReminderRepeatConverter() ReminderRepeat repeat,
    int? notificationId,
  }) = _Reminder;

  factory Reminder.create({
    required DateTime time,
    ReminderRepeat repeat = ReminderRepeat.none,
    int? notificationId,
  }) {
    if (time.isBefore(DateTime.now())) {
      throw ArgumentError('Reminder time cannot be in the past');
    }

    return Reminder(
      id: TaskId.generate(),
      time: time,
      repeat: repeat,
      notificationId: notificationId,
    );
  }

  factory Reminder.fromJson(Map<String, dynamic> json) => _$ReminderFromJson(json);
}
