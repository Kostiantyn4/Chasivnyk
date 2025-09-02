import 'package:meta/meta.dart';
import '../entities/value_objects/task_value_objects.dart';

/// Base class for all domain events
@immutable
abstract class DomainEvent {
  final DateTime occurredAt;
  final String eventId;

  const DomainEvent({
    required this.occurredAt,
    required this.eventId,
  });

  /// Event type identifier for serialization and handling
  String get eventType;
}

/// Event fired when a task is completed
@immutable
class TaskCompletedEvent extends DomainEvent {
  final TaskId taskId;
  final TaskTitle taskTitle;
  final DateTime completedAt;
  final String? userId;

  const TaskCompletedEvent({
    required this.taskId,
    required this.taskTitle,
    required this.completedAt,
    this.userId,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'TaskCompleted';

  @override
  String toString() => 'TaskCompletedEvent(taskId: ${taskId.value}, title: ${taskTitle.value})';
}

/// Event fired when a task is archived
@immutable
class TaskArchivedEvent extends DomainEvent {
  final TaskId taskId;
  final TaskTitle taskTitle;
  final String? userId;

  const TaskArchivedEvent({
    required this.taskId,
    required this.taskTitle,
    this.userId,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'TaskArchived';

  @override
  String toString() => 'TaskArchivedEvent(taskId: ${taskId.value}, title: ${taskTitle.value})';
}

/// Event fired when a task is restored from archive
@immutable
class TaskRestoredEvent extends DomainEvent {
  final TaskId taskId;
  final TaskTitle taskTitle;
  final String? userId;

  const TaskRestoredEvent({
    required this.taskId,
    required this.taskTitle,
    this.userId,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'TaskRestored';

  @override
  String toString() => 'TaskRestoredEvent(taskId: ${taskId.value}, title: ${taskTitle.value})';
}

/// Event fired when a reminder is triggered
@immutable
class ReminderTriggeredEvent extends DomainEvent {
  final TaskId reminderId;
  final TaskId taskId;
  final TaskTitle taskTitle;
  final DateTime reminderTime;

  const ReminderTriggeredEvent({
    required this.reminderId,
    required this.taskId,
    required this.taskTitle,
    required this.reminderTime,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'ReminderTriggered';

  @override
  String toString() => 'ReminderTriggeredEvent(taskId: ${taskId.value}, reminderTime: $reminderTime)';
}

/// Event fired when a task is created
@immutable
class TaskCreatedEvent extends DomainEvent {
  final TaskId taskId;
  final TaskTitle taskTitle;
  final TaskPriority priority;
  final String? userId;

  const TaskCreatedEvent({
    required this.taskId,
    required this.taskTitle,
    required this.priority,
    this.userId,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'TaskCreated';

  @override
  String toString() => 'TaskCreatedEvent(taskId: ${taskId.value}, title: ${taskTitle.value})';
}

/// Event fired when task priority is escalated to critical
@immutable
class TaskEscalatedToCriticalEvent extends DomainEvent {
  final TaskId taskId;
  final TaskTitle taskTitle;
  final TaskPriority previousPriority;
  final String? userId;

  const TaskEscalatedToCriticalEvent({
    required this.taskId,
    required this.taskTitle,
    required this.previousPriority,
    this.userId,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'TaskEscalatedToCritical';

  @override
  String toString() => 'TaskEscalatedToCriticalEvent(taskId: ${taskId.value}, from: ${previousPriority.name})';
}

/// Event fired when a task becomes overdue
@immutable
class TaskOverdueEvent extends DomainEvent {
  final TaskId taskId;
  final TaskTitle taskTitle;
  final DateTime dueDate;

  const TaskOverdueEvent({
    required this.taskId,
    required this.taskTitle,
    required this.dueDate,
    required super.occurredAt,
    required super.eventId,
  });

  @override
  String get eventType => 'TaskOverdue';

  @override
  String toString() => 'TaskOverdueEvent(taskId: ${taskId.value}, dueDate: $dueDate)';
}
