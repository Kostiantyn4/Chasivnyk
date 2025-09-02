import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/task_attachment.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_attachment_value_objects.dart';
import 'package:chasivnyk/data/repositories/task_repository.dart';
import 'package:chasivnyk/domain/entities/task_comment.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('TaskRepository', () {
    late TaskRepositoryImpl repository;

    setUp(() {
      repository = TaskRepositoryImpl();
    });


    test('should save and retrieve task with subtasks', () async {
      final now = DateTime.now();
      final task = Task.create(title: 'Test Task');
      final taskWithSubtask = task.copyWith(
        description: TaskDescription('Test Description'),
        dueDate: now.add(Duration(days: 1)),
        period: TaskPeriod.weekly,
        subtasks: [
          Subtask.create(title: 'Test Subtask'),
        ],
      );

      await repository.save(taskWithSubtask);

      final retrievedTask = await repository.findById(taskWithSubtask.id);
      expect(retrievedTask, isNotNull);
      expect(retrievedTask!.subtasks.length, equals(1));
      expect(retrievedTask.subtasks.first.title.value, equals('Test Subtask'));

      final updatedTask = taskWithSubtask.copyWith(
        subtasks: [
          ...taskWithSubtask.subtasks,
          Subtask.create(title: 'Another Subtask'),
        ],
      );

      await repository.save(updatedTask);

      final retrievedUpdatedTask = await repository.findById(taskWithSubtask.id);
      expect(retrievedUpdatedTask!.subtasks.length, equals(2));
    });

    test('should save and retrieve task with reminders', () async {
      final now = DateTime.now();
      final task = Task.create(title: 'Test Task');
      final taskWithReminder = task.copyWith(
        reminders: [
          Reminder.create(time: now.add(Duration(hours: 1))),
        ],
      );

      await repository.save(taskWithReminder);

      final retrievedTask = await repository.findById(taskWithReminder.id);
      expect(retrievedTask, isNotNull);
      expect(retrievedTask!.reminders.length, equals(1));

      final updatedTask = taskWithReminder.copyWith(
        reminders: [
          ...taskWithReminder.reminders,
          Reminder.create(
            time: now.add(Duration(hours: 2)),
          ),
        ],
      );

      await repository.save(updatedTask);

      final retrievedUpdatedTask = await repository.findById(taskWithReminder.id);
      expect(retrievedUpdatedTask!.reminders.length, equals(2));
    });

    test('should save and retrieve task with comments', () async {
      final task = Task.create(title: 'Test Task');
      final taskWithComment = task.copyWith(
        comments: [
          TaskComment.create(
            taskId: task.id.value,
            authorId: 'user-1',
            content: 'Test Comment',
          ),
        ],
      );

      await repository.save(taskWithComment);

      final retrievedTask = await repository.findById(taskWithComment.id);
      expect(retrievedTask, isNotNull);
      expect(retrievedTask!.comments.length, equals(1));

      final updatedTask = taskWithComment.copyWith(
        comments: [
          ...taskWithComment.comments,
          TaskComment.create(
            taskId: taskWithComment.id.value,
            authorId: 'user-1',
            content: 'Another Comment',
          ),
        ],
      );

      await repository.save(updatedTask);

      final retrievedUpdatedTask = await repository.findById(taskWithComment.id);
      expect(retrievedUpdatedTask!.comments.length, equals(2));
    });

    test('should save and retrieve task with attachments', () async {
      final task = Task.create(title: 'Test Task');
      final attachment = TaskAttachment(
        id: TaskId(const Uuid().v4()),
        taskId: task.id,
        filename: AttachmentFilename('test.txt'),
        path: AttachmentPath('file://test.txt'),
        type: AttachmentType.file,
        mimeType: 'text/plain',
        size: AttachmentSize(100),
        createdAt: DateTime.now(),
      );

      final taskWithAttachment = task.copyWith(
        attachments: [...task.attachments, attachment],
      );

      await repository.save(taskWithAttachment);

      final retrievedTask = await repository.findById(taskWithAttachment.id);
      expect(retrievedTask, isNotNull);
      expect(retrievedTask!.attachments.length, equals(1));
    });

    test('should update existing task', () async {
      final task = Task.create(title: 'Original Task');
      await repository.save(task);

      final updatedTitle = 'Updated Task';
      final updatedTask = task.copyWith(title: TaskTitle(updatedTitle));
      await repository.save(updatedTask);

      final retrievedTask = await repository.findById(task.id);
      expect(retrievedTask!.title.value, equals(updatedTitle));
    });

    test('should delete task and all related data', () async {
      final task = Task.create(title: 'Test Task');
      final taskWithData = task.copyWith(
        subtasks: [Subtask.create(title: 'Subtask to Delete')],
        reminders: [Reminder.create(time: DateTime.now().add(Duration(hours: 1)))],
        tags: [TaskTag('test-tag')],
        comments: [
          TaskComment.create(
            taskId: task.id.value,
            authorId: 'user-1',
            content: 'Comment to Delete',
          ),
        ],
        attachments: [
          TaskAttachment.createFile(
            taskId: task.id.value,
            filename: 'delete.txt',
            path: 'file:///path/to/delete.txt',
            mimeType: 'text/plain',
            size: 1024,
          ),
        ],
      );

      await repository.save(taskWithData);

      await repository.delete(task.id);

      final deletedTask = await repository.findById(task.id);
      expect(deletedTask, isNull);
    });

    test('should return null for non-existent task', () async {
      final nonExistentId = TaskId('non-existent');
      final task = await repository.findById(nonExistentId);
      expect(task, isNull);
    });

    test('should retrieve all tasks', () async {
      final task1 = Task.create(title: 'Task 1');
      final task2 = Task.create(title: 'Task 2');

      await repository.save(task1);
      await repository.save(task2);

      final tasks = await repository.findAll();
      expect(tasks, hasLength(2));
      expect(tasks.map((t) => t.title.value), containsAll(['Task 1', 'Task 2']));
    });
  });
}
