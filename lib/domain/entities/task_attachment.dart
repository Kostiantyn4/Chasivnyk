import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_attachment_value_objects.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_converters.dart';

part 'task_attachment.freezed.dart';
part 'task_attachment.g.dart';

@freezed
class TaskAttachment with _$TaskAttachment {
  const factory TaskAttachment({
    @TaskIdConverter()
    required TaskId id,
    @TaskIdConverter()
    required TaskId taskId,
    @AttachmentFilenameConverter()
    required AttachmentFilename filename,
    @AttachmentPathConverter()
    required AttachmentPath path,
    @AttachmentTypeConverter()
    required AttachmentType type,
    String? mimeType,
    @AttachmentSizeConverter()
    AttachmentSize? size,
    required DateTime createdAt,
  }) = _TaskAttachment;

  factory TaskAttachment.fromJson(Map<String, dynamic> json) =>
      _$TaskAttachmentFromJson(json);

  @visibleForTesting
  static TaskAttachment createFile({
    String? id,
    required String taskId,
    required String filename,
    required String path,
    required String mimeType,
    required int size,
  }) {
    final now = DateTime.now();
    return TaskAttachment(
      id: id != null
          ? TaskId(id)
          : TaskId(const Uuid().v4()),
      taskId: TaskId(taskId),
      filename: AttachmentFilename(filename),
      type: AttachmentType.file,
      path: AttachmentPath(path),
      size: AttachmentSize(size),
      mimeType: mimeType,
      createdAt: now,
    );
  }

  @visibleForTesting
  static TaskAttachment createLink({
    String? id,
    required String taskId,
    required String filename,
    required String path,
  }) {
    final now = DateTime.now();
    return TaskAttachment(
      id: id != null
          ? TaskId(id)
          : TaskId(const Uuid().v4()),
      taskId: TaskId(taskId),
      filename: AttachmentFilename(filename),
      type: AttachmentType.link,
      path: AttachmentPath.url(path), // Use URL validation
      size: AttachmentSize(0),
      createdAt: now,
    );
  }
}
