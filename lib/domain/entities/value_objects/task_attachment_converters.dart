import 'package:freezed_annotation/freezed_annotation.dart';
import 'task_attachment_value_objects.dart';

class AttachmentIdConverter implements JsonConverter<AttachmentId, String> {
  const AttachmentIdConverter();

  @override
  AttachmentId fromJson(String json) => AttachmentId.fromString(json);

  @override
  String toJson(AttachmentId object) => object.value;
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
