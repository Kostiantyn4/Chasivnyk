import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/task_extension.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('TaskTitle', () {
    test('should throw EmptyTitleException when title is empty', () {
      expect(() => TaskTitle(''), throwsA(isA<ArgumentError>()));
      expect(() => TaskTitle(' '), throwsA(isA<ArgumentError>()));
      expect(() => TaskTitle('\n\t'), throwsA(isA<ArgumentError>()));
    });

    test('should throw TitleTooLongException when title is too long', () {
      final longTitle = 'a' * 256;
      expect(() => TaskTitle(longTitle), throwsA(isA<ArgumentError>()));
    });

    test('should trim whitespace from title', () {
      final title = TaskTitle(' Test Title ');
      expect(title.value, equals('Test Title'));
    });
  });

  group('Task Entity', () {
    test('should serialize and deserialize Task correctly', () {
      final now = DateTime.now();
      final task = Task(
        id: TaskId(const Uuid().v4()),
        title: TaskTitle('Test Task'),
        description: TaskDescription('Test Description'),
        dueDate: now,
        duration: TaskDuration.day,
        reminders: [
          Reminder(
            id: TaskId(const Uuid().v4()),
            time: now,
          ),
        ],
        subtasks: [
          Subtask(
            id: TaskId(const Uuid().v4()),
            title: TaskTitle('Test Subtask'),
          ),
        ],
        tags: [TaskTag('test'), TaskTag('task')],
        projectId: ProjectId('project-1'),
        status: TaskStatus.active,
        createdAt: now,
        updatedAt: now,
      );

      final json = task.toJson();
      final deserializedTask = Task.fromJson(json);

      expect(deserializedTask.id.value, equals(task.id.value));
      expect(deserializedTask.title.value, equals(task.title.value));
      expect(deserializedTask.description?.value, equals(task.description?.value));
      expect(deserializedTask.dueDate?.toIso8601String(), equals(task.dueDate?.toIso8601String()));
      expect(deserializedTask.duration, equals(task.duration));
      expect(deserializedTask.reminders.length, equals(task.reminders.length));
      expect(deserializedTask.reminders.first.id.value, equals(task.reminders.first.id.value));
      expect(deserializedTask.reminders.first.time.toIso8601String(), equals(task.reminders.first.time.toIso8601String()));
      expect(deserializedTask.subtasks.length, equals(task.subtasks.length));
      expect(deserializedTask.subtasks.first.id.value, equals(task.subtasks.first.id.value));
      expect(deserializedTask.subtasks.first.title.value, equals(task.subtasks.first.title.value));
      expect(deserializedTask.tags, equals(task.tags));
      expect(deserializedTask.projectId, equals(task.projectId));
      expect(deserializedTask.status, equals(task.status));
      expect(deserializedTask.createdAt.toIso8601String(), equals(task.createdAt.toIso8601String()));
      expect(deserializedTask.updatedAt.toIso8601String(), equals(task.updatedAt.toIso8601String()));
      expect(deserializedTask.completedAt, equals(task.completedAt));
    });

    test('should create task with minimal data', () {
      final task = Task.create(title: 'Test Task');
      expect(task.title.value, equals('Test Task'));
      expect(task.description?.value, isNull);
      expect(task.dueDate, isNull);
      expect(task.duration, isNull);
      expect(task.reminders, isEmpty);
      expect(task.subtasks, isEmpty);
      expect(task.tags.map((t) => t.value), isEmpty);
      expect(task.projectId, isNull);
      expect(task.status, equals(TaskStatus.active));
      expect(task.completedAt, isNull);
    });

    test('should throw ArgumentError when custom duration without customDuration', () {
      expect(
        () => Task.create(title: 'Test Task', duration: TaskDuration.custom),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            'Custom duration requires customDuration parameter',
          ),
        ),
      );
    });

    test('should create task with duration and dueDate', () {
      final dueDate = DateTime.now().add(Duration(days: 1));
      final task = Task.create(
        title: 'Test Task',
        duration: TaskDuration.week,
        dueDate: dueDate,
      );
      expect(task.duration, equals(TaskDuration.week));
      expect(task.dueDate, equals(dueDate));
    });

    test('should throw EmptyTitleException for empty title', () {
      expect(
        () => Task.create(title: '  '),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw ArgumentError for past due date', () {
      final pastDate = DateTime.now().subtract(Duration(days: 1));
      expect(
        () => Task.create(title: 'Test Task', dueDate: pastDate),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            'Due date cannot be in the past',
          ),
        ),
      );
    });

    test('should throw InvalidTagException for empty tags', () {
      expect(
        () => Task.create(title: 'Test Task', tags: [TaskTag('  ')]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw InvalidTagException for too long tags', () {
      expect(
        () => Task.create(title: 'Test Task', tags: [TaskTag('a' * 51)]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should create task with valid tags', () {
      final task = Task.create(title: 'Test Task', tags: [TaskTag('tag1'), TaskTag('tag2')]);
      expect(task.tags.map((t) => t.value), equals(['tag1', 'tag2']));
    });

    test('should create task with projectId', () {
      final task = Task.create(title: 'Test Task', projectId: 'project-1');
      expect(task.projectId, isNotNull);
      expect(task.projectId!.value, equals('project-1'));
    });

    test('should throw InvalidIdException for empty projectId', () {
      expect(
        () => Task.create(title: 'Test Task', projectId: ''),
        throwsA(isA<ArgumentError>()),
      );
    });
  });

  group('Task Status Changes', () {
    test('should set completedAt when marking task as done', () {
      final task = Task.create(title: 'Test Task');
      expect(task.completedAt, isNull);

      final completedTask = task.markAsDone();
      expect(completedTask.completedAt, isNotNull);
      expect(completedTask.status, equals(TaskStatus.done));
    });

    test('should keep completedAt null for non-completed tasks', () {
      final task = Task.create(title: 'Test Task');
      expect(task.completedAt, isNull);

      final inProgressTask = task.startProgress();
      expect(inProgressTask.completedAt, isNull);

      final activeTask = inProgressTask.markAsActive();
      expect(activeTask.completedAt, isNull);
    });
  });

  group('Task', () {
    test('should serialize and deserialize Subtask correctly', () {
      final subtask = Subtask(
        id: TaskId(const Uuid().v4()),
        title: TaskTitle('Test Subtask'),
        isDone: true,
      );

      final json = subtask.toJson();
      final deserializedSubtask = Subtask.fromJson(json);

      expect(deserializedSubtask.id.value, equals(subtask.id.value));
      expect(deserializedSubtask.title.value, equals(subtask.title.value));
      expect(deserializedSubtask.isDone, equals(subtask.isDone));
    });

    test('should serialize and deserialize Reminder correctly', () {
      final reminder = Reminder(
        id: TaskId(const Uuid().v4()),
        time: DateTime.now(),
        isTriggered: true,
      );

      final json = reminder.toJson();
      final deserializedReminder = Reminder.fromJson(json);

      expect(deserializedReminder.id.value, equals(reminder.id.value));
      expect(deserializedReminder.time.toIso8601String(),
          equals(reminder.time.toIso8601String()));
      expect(deserializedReminder.isTriggered, equals(reminder.isTriggered));
    });

    test('should throw ArgumentError for past reminder time', () {
      final pastTime = DateTime.now().subtract(Duration(minutes: 1));
      expect(
        () => Reminder.create(time: pastTime),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            'Reminder time cannot be in the past',
          ),
        ),
      );
    });

    test('should create reminder with future time', () {
      final futureTime = DateTime.now().add(Duration(days: 1));
      final reminder = Reminder.create(time: futureTime);
      expect(reminder.time, equals(futureTime));
      expect(reminder.isTriggered, isFalse);
    });
  });
}
