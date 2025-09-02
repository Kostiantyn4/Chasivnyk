import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/task_attachment.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_attachment_value_objects.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('TaskAttachment', () {
    final task = TaskId('123');

    test('createFile() creates a valid file attachment', () {
      final attachment = TaskAttachment(
        id: TaskId('test-id'),
        taskId: task,
        filename: AttachmentFilename('test.txt'),
        path: AttachmentPath('file://test.txt'),
        type: AttachmentType.file,
        mimeType: 'text/plain',
        size: AttachmentSize(100),
        createdAt: DateTime.now(),
      );

      expect(attachment.taskId.value, equals('123'));
      expect(attachment.filename.value, equals('test.txt'));
      expect(attachment.path.value, equals('file://test.txt'));
      expect(attachment.type, equals(AttachmentType.file));
      expect(attachment.mimeType, equals('text/plain'));
      expect(attachment.size?.value, equals(100));
      expect(attachment.createdAt, isNotNull);
    });

    test('createLink() creates a valid link attachment', () {
      final attachment = TaskAttachment(
        id: TaskId('test-id'),
        taskId: task,
        filename: AttachmentFilename('test-link'),
        path: AttachmentPath('https://example.com'),
        type: AttachmentType.link,
        createdAt: DateTime.now(),
      );

      expect(attachment.taskId.value, equals('123'));
      expect(attachment.filename.value, equals('test-link'));
      expect(attachment.path.value, equals('https://example.com'));
      expect(attachment.type, equals(AttachmentType.link));
      expect(attachment.mimeType, isNull);
      expect(attachment.size, isNull);
      expect(attachment.createdAt, isNotNull);
    });

    test('createLink() throws on invalid URL', () {
      expect(
        () => TaskAttachment.createLink(
          id: '123',
          taskId: '456',
          filename: '',
          path: 'invalid-url',
        ),
        throwsArgumentError,
      );
    });

    test('creates a valid file attachment with custom id and createdAt', () {
      final now = DateTime.now();
      final attachment = TaskAttachment(
        id: TaskId('attachment-1'),
        taskId: task,
        filename: AttachmentFilename('test.txt'),
        path: AttachmentPath('file://test.txt'),
        type: AttachmentType.file,
        mimeType: 'text/plain',
        size: AttachmentSize(100),
        createdAt: now,
      );

      expect(attachment.id.value, equals('attachment-1'));
      expect(attachment.createdAt, equals(now));
    });

    test('creates a valid link attachment with custom id and createdAt', () {
      final now = DateTime.now();
      final attachment = TaskAttachment(
        id: TaskId('attachment-1'),
        taskId: task,
        filename: AttachmentFilename('Google'),
        path: AttachmentPath('https://google.com'),
        type: AttachmentType.link,
        createdAt: now,
      );

      expect(attachment.id.value, equals('attachment-1'));
      expect(attachment.createdAt, equals(now));
    });

    test('toJson() and fromJson() correctly serialize and deserialize file attachment', () {
      final originalAttachment = TaskAttachment(
        id: TaskId('test-id'),
        taskId: task,
        filename: AttachmentFilename('test.pdf'),
        path: AttachmentPath('file://test.pdf'),
        type: AttachmentType.file,
        mimeType: 'application/pdf',
        size: AttachmentSize(1024),
        createdAt: DateTime.now(),
      );

      final json = originalAttachment.toJson();
      final deserializedAttachment = TaskAttachment.fromJson(json);

      expect(deserializedAttachment, equals(originalAttachment));
    });
  });
}
