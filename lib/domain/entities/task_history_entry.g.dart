// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskHistoryEntryImpl _$$TaskHistoryEntryImplFromJson(
  Map<String, dynamic> json,
) => _$TaskHistoryEntryImpl(
  id: const TaskIdConverter().fromJson(json['id'] as String),
  taskId: const TaskIdConverter().fromJson(json['task_id'] as String),
  action: $enumDecode(_$TaskHistoryActionEnumMap, json['action']),
  oldValue: json['old_value'] as String?,
  newValue: json['new_value'] as String?,
  description: json['description'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$$TaskHistoryEntryImplToJson(
  _$TaskHistoryEntryImpl instance,
) => <String, dynamic>{
  'id': const TaskIdConverter().toJson(instance.id),
  'task_id': const TaskIdConverter().toJson(instance.taskId),
  'action': _$TaskHistoryActionEnumMap[instance.action]!,
  'old_value': instance.oldValue,
  'new_value': instance.newValue,
  'description': instance.description,
  'timestamp': instance.timestamp.toIso8601String(),
  'user_id': instance.userId,
};

const _$TaskHistoryActionEnumMap = {
  TaskHistoryAction.created: 'created',
  TaskHistoryAction.statusChanged: 'statusChanged',
  TaskHistoryAction.priorityChanged: 'priorityChanged',
  TaskHistoryAction.dueDateUpdated: 'dueDateUpdated',
  TaskHistoryAction.titleUpdated: 'titleUpdated',
  TaskHistoryAction.descriptionUpdated: 'descriptionUpdated',
  TaskHistoryAction.subtaskAdded: 'subtaskAdded',
  TaskHistoryAction.subtaskRemoved: 'subtaskRemoved',
  TaskHistoryAction.subtaskToggled: 'subtaskToggled',
  TaskHistoryAction.reminderAdded: 'reminderAdded',
  TaskHistoryAction.reminderRemoved: 'reminderRemoved',
  TaskHistoryAction.tagAdded: 'tagAdded',
  TaskHistoryAction.tagRemoved: 'tagRemoved',
  TaskHistoryAction.attachmentAdded: 'attachmentAdded',
  TaskHistoryAction.attachmentRemoved: 'attachmentRemoved',
  TaskHistoryAction.commentAdded: 'commentAdded',
  TaskHistoryAction.archived: 'archived',
  TaskHistoryAction.restored: 'restored',
};
