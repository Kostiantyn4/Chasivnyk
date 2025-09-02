// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: const TaskIdConverter().fromJson(json['id'] as String),
      title: const TaskTitleConverter().fromJson(json['title'] as String),
      description: const TaskDescriptionConverter()
          .fromJson(json['description'] as String?),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      period: _$JsonConverterFromJson<String, TaskPeriod>(
          json['period'], const TaskPeriodConverter().fromJson),
      reminders: (json['reminders'] as List<dynamic>?)
              ?.map((e) => Reminder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subtasks: (json['subtasks'] as List<dynamic>?)
              ?.map((e) => Subtask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => const TaskTagConverter().fromJson(e as String))
              .toList() ??
          const [],
      projectId:
          const ProjectIdConverter().fromJson(json['project_id'] as String?),
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.active,
      priority: json['priority'] == null
          ? TaskPriority.medium
          : const TaskPriorityConverter().fromJson(json['priority'] as String),
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => TaskComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => TaskAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': const TaskIdConverter().toJson(instance.id),
      'title': const TaskTitleConverter().toJson(instance.title),
      'description': _$JsonConverterToJson<String?, TaskDescription>(
          instance.description, const TaskDescriptionConverter().toJson),
      'due_date': instance.dueDate?.toIso8601String(),
      'period': _$JsonConverterToJson<String, TaskPeriod>(
          instance.period, const TaskPeriodConverter().toJson),
      'reminders': instance.reminders.map((e) => e.toJson()).toList(),
      'subtasks': instance.subtasks.map((e) => e.toJson()).toList(),
      'tags': instance.tags.map(const TaskTagConverter().toJson).toList(),
      'project_id': const ProjectIdConverter().toJson(instance.projectId),
      'status': _$TaskStatusEnumMap[instance.status]!,
      'priority': const TaskPriorityConverter().toJson(instance.priority),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$TaskStatusEnumMap = {
  TaskStatus.active: 'active',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.done: 'done',
  TaskStatus.archived: 'archived',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$SubtaskImpl _$$SubtaskImplFromJson(Map<String, dynamic> json) =>
    _$SubtaskImpl(
      id: const TaskIdConverter().fromJson(json['id'] as String),
      title: const TaskTitleConverter().fromJson(json['title'] as String),
      isDone: json['is_done'] as bool? ?? false,
    );

Map<String, dynamic> _$$SubtaskImplToJson(_$SubtaskImpl instance) =>
    <String, dynamic>{
      'id': const TaskIdConverter().toJson(instance.id),
      'title': const TaskTitleConverter().toJson(instance.title),
      'is_done': instance.isDone,
    };

_$ReminderImpl _$$ReminderImplFromJson(Map<String, dynamic> json) =>
    _$ReminderImpl(
      id: const TaskIdConverter().fromJson(json['id'] as String),
      time: DateTime.parse(json['time'] as String),
      isTriggered: json['is_triggered'] as bool? ?? false,
      repeat: json['repeat'] == null
          ? ReminderRepeat.none
          : const ReminderRepeatConverter().fromJson(json['repeat'] as String),
      notificationId: (json['notification_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReminderImplToJson(_$ReminderImpl instance) =>
    <String, dynamic>{
      'id': const TaskIdConverter().toJson(instance.id),
      'time': instance.time.toIso8601String(),
      'is_triggered': instance.isTriggered,
      'repeat': const ReminderRepeatConverter().toJson(instance.repeat),
      'notification_id': instance.notificationId,
    };
