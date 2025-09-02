import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/task_extension.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('TaskX', () {
    test('isOverdue should be true for past due date and active/inProgress status', () {
      final now = DateTime.now();
      final activeTask = Task(
        id: TaskId('test-id'),
        title: TaskTitle('Test Task'),
        dueDate: now.subtract(const Duration(days: 1)),
        status: TaskStatus.active,
        createdAt: now,
        updatedAt: now,
      );
      expect(activeTask.isOverdue, isTrue);

      final inProgressTask = activeTask.copyWith(status: TaskStatus.inProgress);
      expect(inProgressTask.isOverdue, isTrue);
    });

    test('isOverdue should be false for future due date', () {
      final task = Task.create(
        title: 'Test Task',
        dueDate: DateTime.now().add(const Duration(days: 1)),
      );
      expect(task.isOverdue, isFalse);
    });

    test('isOverdue should be false for done task', () {
      final now = DateTime.now();
      final task = Task(
        id: TaskId('test-id'),
        title: TaskTitle('Test Task'),
        dueDate: now.subtract(const Duration(days: 1)),
        status: TaskStatus.done,
        createdAt: now,
        updatedAt: now,
      );
      expect(task.isOverdue, isFalse);
    });

    test('markAsDone should change status to done', () {
      final task = Task.create(title: 'Test Task');
      final doneTask = task.markAsDone();
      expect(doneTask.status, equals(TaskStatus.done));
      expect(doneTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('markAsDone should throw if task is already done', () {
      final task = Task.create(title: 'Test Task').markAsDone();
      expect(() => task.markAsDone(), throwsStateError);
    });

    test('markAsActive should change status to active', () {
      final task = Task.create(title: 'Test Task').markAsDone();
      final activeTask = task.markAsActive();
      expect(activeTask.status, equals(TaskStatus.active));
      expect(activeTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('markAsActive should throw for archived task', () {
      final task = Task.create(title: 'Test Task').archive();
      expect(() => task.markAsActive(), throwsStateError);
    });

    test('startProgress should change status to inProgress', () {
      final task = Task.create(title: 'Test Task');
      final inProgressTask = task.startProgress();
      expect(inProgressTask.status, equals(TaskStatus.inProgress));
      expect(inProgressTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('startProgress should throw for already in progress task', () {
      final task = Task.create(title: 'Test Task').startProgress();
      expect(() => task.startProgress(), throwsStateError);
    });

    test('startProgress should throw for done task', () {
      final task = Task.create(title: 'Test Task').markAsDone();
      expect(() => task.startProgress(), throwsStateError);
    });

    test('startProgress should throw for archived task', () {
      final task = Task.create(title: 'Test Task').archive();
      expect(() => task.startProgress(), throwsStateError);
    });

    test('archive should change status to archived', () {
      final task = Task.create(title: 'Test Task');
      final archivedTask = task.archive();
      expect(archivedTask.status, equals(TaskStatus.archived));
      expect(archivedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('addSubtask should add new subtask', () {
      final task = Task.create(title: 'Test Task');
      final updatedTask = task.addSubtask('New Subtask');
      expect(updatedTask.subtasks.length, equals(1));
      expect(updatedTask.subtasks.first.title.value, equals('New Subtask'));
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('removeSubtask should remove existing subtask', () {
      final task = Task.create(title: 'Test Task').addSubtask('Subtask');
      final subtaskId = task.subtasks.first.id;
      final updatedTask = task.removeSubtask(subtaskId);
      expect(updatedTask.subtasks, isEmpty);
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('toggleSubtask should toggle isDone status', () {
      final task = Task.create(title: 'Test Task').addSubtask('Subtask');
      final subtaskId = task.subtasks.first.id;
      final updatedTask = task.toggleSubtask(subtaskId);
      expect(updatedTask.subtasks.first.isDone, isTrue);
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('addReminder should add new reminder', () {
      final task = Task.create(title: 'Test Task');
      final time = DateTime.now().add(const Duration(days: 1));
      final updatedTask = task.addReminder(time);
      expect(updatedTask.reminders.length, equals(1));
      expect(updatedTask.reminders.first.time, equals(time));
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('removeReminder should remove existing reminder', () {
      final time = DateTime.now().add(const Duration(days: 1));
      final task = Task.create(title: 'Test Task').addReminder(time);
      final reminderId = task.reminders.first.id;
      final updatedTask = task.removeReminder(reminderId);
      expect(updatedTask.reminders, isEmpty);
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('addTag should add new tag', () {
      final task = Task.create(title: 'Test Task');
      final updatedTask = task.addTag('important');
      expect(updatedTask.tags.map((t) => t.value), contains('important'));
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('addTag should throw for empty tag', () {
      final task = Task.create(title: 'Test Task');
      expect(() => task.addTag('  '), throwsArgumentError);
    });

    test('addTag should throw for too long tag', () {
      final task = Task.create(title: 'Test Task');
      expect(() => task.addTag('a' * 51), throwsArgumentError);
    });

    test('removeTag should remove existing tag', () {
      final task = Task.create(title: 'Test Task', tags: [TaskTag('important')]);
      final updatedTask = task.removeTag('important');
      expect(updatedTask.tags, isEmpty);
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('removeTag should throw for non-existing tag', () {
      final task = Task.create(title: 'Test Task');
      expect(() => task.removeTag('important'), throwsArgumentError);
    });
  });
}
