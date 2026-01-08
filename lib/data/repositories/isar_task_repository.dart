import 'dart:convert';
import 'package:isar_community/isar.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/task_comment.dart';
import '../../domain/entities/task_attachment.dart';
import '../../domain/entities/value_objects/task_value_objects.dart';
import '../../domain/repositories/task_repository.dart';
import '../database/app_database.dart';
import '../database/entities/task_entity.dart';

class IsarTaskRepository implements ITaskRepository {
  final Isar _isar;

  IsarTaskRepository(this._isar);

  static Future<IsarTaskRepository> create() async {
    final isar = await AppDatabase.getInstance();
    return IsarTaskRepository(isar);
  }

  @override
  Future<Task?> findById(TaskId id) async {
    final entity = await _isar.taskEntitys
        .filter()
        .taskIdEqualTo(id.value)
        .findFirst();

    return entity != null ? _mapToDomain(entity) : null;
  }

  @override
  Future<List<Task>> findAll() async {
    final entities = await _isar.taskEntitys.where().findAll();
    return entities.map(_mapToDomain).toList();
  }

  @override
  Future<List<Task>> findAllSortedByPriority() async {
    final entities = await _isar.taskEntitys
        .where()
        .sortByPriorityDesc()
        .findAll();
    return entities.map(_mapToDomain).toList();
  }

  @override
  Future<void> save(Task task) async {
    await _isar.writeTxn(() async {
      final existing = await _isar.taskEntitys
          .filter()
          .taskIdEqualTo(task.id.value)
          .findFirst();
      final entity = _mapToEntity(task);
      if (existing != null) {
        entity.id = existing.id;
      }
      await _isar.taskEntitys.put(entity);
    });
  }

  @override
  Future<void> delete(TaskId id) async {
    await _isar.writeTxn(() async {
      final entity = await _isar.taskEntitys
          .filter()
          .taskIdEqualTo(id.value)
          .findFirst();
      if (entity != null) {
        await _isar.taskEntitys.delete(entity.id);
      }
    });
  }

  // Mapping methods
  Task _mapToDomain(TaskEntity entity) {
    return Task(
      id: TaskId(entity.taskId),
      title: TaskTitle(entity.title),
      description: entity.description != null 
          ? TaskDescription(entity.description!)
          : null,
      status: _mapStatus(entity.status),
      dueDate: entity.dueDate != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.dueDate!)
          : null,
      duration: entity.duration != null ? _mapDuration(entity.duration!) : null,
      customDuration: entity.customDurationJson != null
          ? CustomDuration.fromJson(jsonDecode(entity.customDurationJson!))
          : null,
      rrule: entity.rrule,
      recurrenceEnd: entity.recurrenceEnd != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.recurrenceEnd!)
          : null,
      priority: _mapPriority(entity.priority),
      subtasks: entity.subtasksJson != null
          ? (jsonDecode(entity.subtasksJson!) as List)
              .map((e) => Subtask.fromJson(e))
              .toList()
          : [],
      tags: entity.tagsJson != null
          ? (jsonDecode(entity.tagsJson!) as List<dynamic>)
              .map((e) => TaskTag(e as String))
              .toList()
          : [],
      reminders: entity.remindersJson != null
          ? (jsonDecode(entity.remindersJson!) as List)
              .map((e) => Reminder.fromJson(e))
              .toList()
          : [],
      comments: entity.commentsJson != null
          ? (jsonDecode(entity.commentsJson!) as List)
              .map((e) => TaskComment.fromJson(e))
              .toList()
          : [],
      attachments: entity.attachmentsJson != null
          ? (jsonDecode(entity.attachmentsJson!) as List)
              .map((e) => TaskAttachment.fromJson(e))
              .toList()
          : [],
      createdAt: DateTime.fromMillisecondsSinceEpoch(entity.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(entity.updatedAt),
    );
  }

  TaskEntity _mapToEntity(Task task) {
    return TaskEntity()
      ..taskId = task.id.value
      ..title = task.title.value
      ..description = task.description?.value
      ..status = _mapStatusToInt(task.status)
      ..dueDate = task.dueDate?.millisecondsSinceEpoch
      ..duration = task.duration != null ? _mapDurationToInt(task.duration!) : null
      ..customDurationJson = task.customDuration != null
          ? jsonEncode(task.customDuration!.toJson())
          : null
      ..rrule = task.rrule
      ..recurrenceEnd = task.recurrenceEnd?.millisecondsSinceEpoch
      ..priority = _mapPriorityToInt(task.priority)
      ..subtasksJson = task.subtasks.isNotEmpty
          ? jsonEncode(task.subtasks.map((e) => e.toJson()).toList())
          : null
      ..tagsJson = task.tags.isNotEmpty
          ? jsonEncode(task.tags.map((e) => e.value).toList())
          : null
      ..remindersJson = task.reminders.isNotEmpty
          ? jsonEncode(task.reminders.map((e) => e.toJson()).toList())
          : null
      ..commentsJson = task.comments.isNotEmpty
          ? jsonEncode(task.comments.map((e) => e.toJson()).toList())
          : null
      ..attachmentsJson = task.attachments.isNotEmpty
          ? jsonEncode(task.attachments.map((e) => e.toJson()).toList())
          : null
      ..createdAt = task.createdAt.millisecondsSinceEpoch
      ..updatedAt = task.updatedAt.millisecondsSinceEpoch;
  }

  TaskStatus _mapStatus(int status) {
    switch (status) {
      case 0:
        return TaskStatus.active;
      case 1:
        return TaskStatus.inProgress;
      case 2:
        return TaskStatus.done;
      case 3:
        return TaskStatus.archived;
      default:
        return TaskStatus.active;
    }
  }

  int _mapStatusToInt(TaskStatus status) {
    switch (status) {
      case TaskStatus.active:
        return 0;
      case TaskStatus.inProgress:
        return 1;
      case TaskStatus.done:
        return 2;
      case TaskStatus.archived:
        return 3;
    }
  }

  TaskDuration _mapDuration(int duration) {
    switch (duration) {
      case 0:
        return TaskDuration.day;
      case 1:
        return TaskDuration.week;
      case 2:
        return TaskDuration.month;
      case 3:
        return TaskDuration.quarter;
      case 4:
        return TaskDuration.year;
      case 5:
        return TaskDuration.custom;
      default:
        return TaskDuration.day;
    }
  }

  int _mapDurationToInt(TaskDuration duration) {
    switch (duration) {
      case TaskDuration.day:
        return 0;
      case TaskDuration.week:
        return 1;
      case TaskDuration.month:
        return 2;
      case TaskDuration.quarter:
        return 3;
      case TaskDuration.year:
        return 4;
      case TaskDuration.custom:
        return 5;
    }
  }

  TaskPriority _mapPriority(int priority) {
    switch (priority) {
      case 1:
        return TaskPriority.low;
      case 2:
        return TaskPriority.medium;
      case 3:
        return TaskPriority.high;
      case 4:
        return TaskPriority.critical;
      default:
        return TaskPriority.medium;
    }
  }

  int _mapPriorityToInt(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return 1;
      case TaskPriority.medium:
        return 2;
      case TaskPriority.high:
        return 3;
      case TaskPriority.critical:
        return 4;
    }
  }
}
