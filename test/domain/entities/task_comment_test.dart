import 'package:test/test.dart';
import 'package:chasivnyk/domain/entities/task_comment.dart';

void main() {
  group('TaskComment', () {
    test('create() creates a valid comment', () {
      final comment = TaskComment.create(
        taskId: 'task-1',
        authorId: 'user-1',
        content: 'Test comment',
      );

      expect(comment.taskId.value, equals('task-1'));
      expect(comment.authorId, equals('user-1'));
      expect(comment.content, equals('Test comment'));
      expect(comment.editedAt, isNull);
      expect(comment.createdAt, isNotNull);
    });

    test('create() throws on empty content', () {
      expect(
        () => TaskComment.create(
          taskId: 'task-1',
          authorId: 'user-1',
          content: '   ',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('create() trims content', () {
      final comment = TaskComment.create(
        taskId: 'task-1',
        authorId: 'user-1',
        content: '  Test comment  ',
      );

      expect(comment.content, equals('Test comment'));
    });

    test('updateContent() updates content and sets editedAt', () {
      final comment = TaskComment.create(
        taskId: 'task-1',
        authorId: 'user-1',
        content: 'Original content',
      );

      final updatedComment = comment.updateContent('Updated content');

      expect(updatedComment.content, equals('Updated content'));
      expect(updatedComment.editedAt, isNotNull);
      expect(updatedComment.id, equals(comment.id));
      expect(updatedComment.taskId, equals(comment.taskId));
      expect(updatedComment.authorId, equals(comment.authorId));
      expect(updatedComment.createdAt, equals(comment.createdAt));
    });

    test('toJson() and fromJson() correctly serialize and deserialize', () {
      final originalComment = TaskComment.create(
        taskId: 'task-1',
        authorId: 'user-1',
        content: 'Test comment',
      );

      final json = originalComment.toJson();
      final deserializedComment = TaskComment.fromJson(json);

      expect(deserializedComment, equals(originalComment));
    });

    test('create() with existing id and dates preserves them', () {
      final now = DateTime.now();
      final edited = now.add(Duration(minutes: 5));
      
      final comment = TaskComment.create(
        id: 'comment-1',
        taskId: 'task-1',
        authorId: 'user-1',
        content: 'Test comment',
        createdAt: now,
        editedAt: edited,
      );

      expect(comment.id.value, equals('comment-1'));
      expect(comment.createdAt, equals(now));
      expect(comment.editedAt, equals(edited));
    });
  });
}
