import 'package:isar_community/isar.dart';

part 'task_entity.g.dart';

@collection
class TaskEntity {
  Id id = Isar.autoIncrement;

  @Index()
  late String taskId; // UUID from domain

  @Index(type: IndexType.value)
  late String title;

  String? description;

  @Index()
  late int status; // 0=pending, 1=in_progress, 2=completed, 3=cancelled

  @Index()
  int? dueDate; // DateTime as milliseconds since epoch

  // Duration - how long the task is active for
  @Index()
  int? duration; // 0=day, 1=week, 2=month, 3=quarter, 4=year, 5=custom
  String? customDurationJson; // JSON for CustomDuration when duration == 5

  // Recurrence - when/how the task repeats (RFC 5545 RRULE)
  String? rrule; // e.g., "FREQ=WEEKLY;BYDAY=MO,WE,FR"
  int? recurrenceEnd; // DateTime as milliseconds - when to stop repeating

  @Index()
  late int priority; // 1=low, 2=medium, 3=high, 4=critical

  @Index()
  String? projectId;

  late int createdAt; // DateTime as milliseconds
  late int updatedAt; // DateTime as milliseconds

  // JSON fields for complex data
  String? subtasksJson; // List<Subtask> as JSON
  String? tagsJson; // List<String> as JSON
  String? remindersJson; // List<Reminder> as JSON
  String? commentsJson; // List<TaskComment> as JSON
  String? attachmentsJson; // List<TaskAttachment> as JSON
}
