import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'value_objects/task_value_objects.dart';
import 'value_objects/json_converters.dart';

part 'task_comment.freezed.dart';
part 'task_comment.g.dart';

@freezed
class TaskComment with _$TaskComment {
  const TaskComment._();
  
  const factory TaskComment({
    @TaskIdConverter() required TaskId id,
    @TaskIdConverter() required TaskId taskId,
    required String authorId,
    required String content,
    required DateTime createdAt,
    DateTime? editedAt,
  }) = _TaskComment;

  factory TaskComment.fromJson(Map<String, dynamic> json) =>
      _$TaskCommentFromJson(json);

  factory TaskComment.create({
    String? id,
    DateTime? createdAt,
    DateTime? editedAt,
    required String taskId,
    required String authorId,
    required String content,
  }) {
    if (content.trim().isEmpty) {
      throw ArgumentError('Content cannot be empty');
    }

    final now = DateTime.now();
    return TaskComment(
      id: TaskId(id ?? const Uuid().v4()),
      taskId: TaskId(taskId),
      authorId: authorId,
      content: content.trim(),
      createdAt: createdAt ?? now,
      editedAt: editedAt,
    );
  }

  TaskComment updateContent(String newContent) {
    if (newContent.trim().isEmpty) {
      throw ArgumentError('Content cannot be empty');
    }
    return copyWith(
      content: newContent.trim(),
      editedAt: DateTime.now(),
    );
  }
}
