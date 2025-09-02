// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskAttachmentImpl _$$TaskAttachmentImplFromJson(Map<String, dynamic> json) =>
    _$TaskAttachmentImpl(
      id: const TaskIdConverter().fromJson(json['id'] as String),
      taskId: const TaskIdConverter().fromJson(json['task_id'] as String),
      filename: const AttachmentFilenameConverter()
          .fromJson(json['filename'] as String),
      path: const AttachmentPathConverter().fromJson(json['path'] as String),
      type: const AttachmentTypeConverter().fromJson(json['type'] as String),
      mimeType: json['mime_type'] as String?,
      size: _$JsonConverterFromJson<int, AttachmentSize>(
          json['size'], const AttachmentSizeConverter().fromJson),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$TaskAttachmentImplToJson(
        _$TaskAttachmentImpl instance) =>
    <String, dynamic>{
      'id': const TaskIdConverter().toJson(instance.id),
      'task_id': const TaskIdConverter().toJson(instance.taskId),
      'filename': const AttachmentFilenameConverter().toJson(instance.filename),
      'path': const AttachmentPathConverter().toJson(instance.path),
      'type': const AttachmentTypeConverter().toJson(instance.type),
      'mime_type': instance.mimeType,
      'size': _$JsonConverterToJson<int, AttachmentSize>(
          instance.size, const AttachmentSizeConverter().toJson),
      'created_at': instance.createdAt.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
