import 'package:json_annotation/json_annotation.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_attachment_value_objects.dart';

class TaskIdConverter implements JsonConverter<TaskId, String> {
  const TaskIdConverter();

  @override
  TaskId fromJson(String json) => TaskId(json);

  @override
  String toJson(TaskId object) => object.value;
}

class AttachmentTypeConverter implements JsonConverter<AttachmentType, String> {
  const AttachmentTypeConverter();

  @override
  AttachmentType fromJson(String json) {
    switch (json) {
      case 'file':
        return AttachmentType.file;
      case 'link':
        return AttachmentType.link;
      case 'image':
        return AttachmentType.image;
      case 'document':
        return AttachmentType.document;
      case 'audio':
        return AttachmentType.audio;
      case 'video':
        return AttachmentType.video;
      default:
        return AttachmentType.other;
    }
  }

  @override
  String toJson(AttachmentType object) => object.name;
}

class AttachmentFilenameConverter implements JsonConverter<AttachmentFilename, String> {
  const AttachmentFilenameConverter();

  @override
  AttachmentFilename fromJson(String json) => AttachmentFilename(json);

  @override
  String toJson(AttachmentFilename object) => object.value;
}

class AttachmentPathConverter implements JsonConverter<AttachmentPath, String> {
  const AttachmentPathConverter();

  @override
  AttachmentPath fromJson(String json) => AttachmentPath(json);

  @override
  String toJson(AttachmentPath object) => object.value;
}

class AttachmentSizeConverter implements JsonConverter<AttachmentSize, int> {
  const AttachmentSizeConverter();

  @override
  AttachmentSize fromJson(int json) => AttachmentSize(json);

  @override
  int toJson(AttachmentSize object) => object.value;
}
