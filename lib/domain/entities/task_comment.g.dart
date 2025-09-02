// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskCommentImpl _$$TaskCommentImplFromJson(Map<String, dynamic> json) =>
    _$TaskCommentImpl(
      id: const TaskIdConverter().fromJson(json['id'] as String),
      taskId: const TaskIdConverter().fromJson(json['task_id'] as String),
      authorId: json['author_id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      editedAt: json['edited_at'] == null
          ? null
          : DateTime.parse(json['edited_at'] as String),
    );

Map<String, dynamic> _$$TaskCommentImplToJson(_$TaskCommentImpl instance) =>
    <String, dynamic>{
      'id': const TaskIdConverter().toJson(instance.id),
      'task_id': const TaskIdConverter().toJson(instance.taskId),
      'author_id': instance.authorId,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'edited_at': instance.editedAt?.toIso8601String(),
    };
