import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/services/task_service.dart';
import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/task_attachment.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_attachment_value_objects.dart';
import 'package:chasivnyk/domain/repositories/task_repository.dart';

class MockTaskRepository implements ITaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<Task?> findById(TaskId id) async {
    return _tasks.firstWhere((t) => t.id == id);
  }

  @override
  Future<List<Task>> findAll() async {
    return _tasks;
  }

  @override
  Future<void> save(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
    } else {
      _tasks.add(task);
    }
  }

  @override
  Future<void> delete(TaskId id) async {
    _tasks.removeWhere((t) => t.id == id);
  }

  @override
  Future<List<Task>> findAllSortedByPriority() async {
    return List<Task>.from(_tasks)..sort((a, b) {
      final priorityOrder = TaskPriority.values.toList().reversed.toList();
      final aIndex = priorityOrder.indexOf(a.priority);
      final bIndex = priorityOrder.indexOf(b.priority);
      
      if (aIndex != bIndex) return aIndex.compareTo(bIndex);
      return b.updatedAt.compareTo(a.updatedAt);
    });
  }
}

void main() {
  late ITaskRepository repository;
  late ITaskService service;

  setUp(() {
    repository = MockTaskRepository();
    service = TaskService(repository);
  });

  group('TaskService', () {
    test('createTask creates a task with basic properties', () async {
      final task = await service.createTask(
        'Test Task',
        description: 'Test Description',
        dueDate: DateTime(2025, 12, 31),
      );

      expect(task.title.value, equals('Test Task'));
      expect(task.description?.value, equals('Test Description'));
      expect(task.dueDate, equals(DateTime(2025, 12, 31)));
      expect(task.status, equals(TaskStatus.active));
      expect(task.subtasks, isEmpty);
      expect(task.comments, isEmpty);
      expect(task.attachments, isEmpty);
    });

    test('addComment adds a comment to task', () async {
      final task = await service.createTask('Test Task');
      final updatedTask = await service.addComment(
        task,
        'user123',
        'Test comment',
      );

      expect(updatedTask.comments, hasLength(1));
      expect(updatedTask.comments.first.authorId, equals('user123'));
      expect(updatedTask.comments.first.content, equals('Test comment'));
      expect(updatedTask.comments.first.taskId.value, equals(task.id.value));
    });

    test('editComment updates existing comment', () async {
      var task = await service.createTask('Test Task');
      task = await service.addComment(task, 'user123', 'Original comment');
      
      final commentId = task.comments.first.id.value;
      final updatedTask = await service.editComment(
        task,
        commentId,
        'Updated comment',
      );

      expect(updatedTask.comments, hasLength(1));
      expect(updatedTask.comments.first.content, equals('Updated comment'));
      expect(updatedTask.comments.first.editedAt, isNotNull);
    });

    test('editComment throws error for non-existent comment', () async {
      final task = await service.createTask('Test Task');
      
      expect(
        () => service.editComment(task, 'non-existent-id', 'Updated comment'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('addFileAttachment adds file attachment to task', () async {
      final task = await service.createTask('Test Task');
      final attachment = TaskAttachment(
        id: TaskId('test-id'),
        taskId: task.id,
        filename: AttachmentFilename('test.txt'),
        path: AttachmentPath('file://test.txt'),
        type: AttachmentType.file,
        mimeType: 'text/plain',
        size: AttachmentSize(100),
        createdAt: DateTime.now(),
      );

      expect(attachment.type, equals(AttachmentType.file));
      expect(attachment.mimeType, equals('text/plain'));
      expect(attachment.size?.value, equals(100));
      expect(attachment.createdAt, isNotNull);
    });

    test('addLinkAttachment adds link attachment to task', () async {
      final task = await service.createTask('Test Task');
      final attachment = TaskAttachment(
        id: TaskId('test-id'),
        taskId: task.id,
        filename: AttachmentFilename('example.com'),
        path: AttachmentPath('https://example.com'),
        type: AttachmentType.link,
        createdAt: DateTime.now(),
      );

      expect(attachment.type, equals(AttachmentType.link));
      expect(attachment.filename.value, equals('example.com'));
      expect(attachment.mimeType, isNull);
      expect(attachment.size, isNull);
      expect(attachment.createdAt, isNotNull);
    });

    test('addLinkAttachment validates URL format', () async {
      final task = await service.createTask('Test Task');
      
      expect(
        () => service.addLinkAttachment(
          task,
          'Invalid Link',
          'not-a-url',
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
