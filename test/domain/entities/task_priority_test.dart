import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/task_extension.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('Task Priority', () {
    test('should create task with default medium priority', () {
      final task = Task.create(title: 'Test Task');
      expect(task.priority, equals(TaskPriority.medium));
    });

    test('should create task with specified priority', () {
      final task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.high,
      );
      expect(task.priority, equals(TaskPriority.high));
    });

    test('updatePriority should change priority', () {
      final task = Task.create(title: 'Test Task');
      final updatedTask = task.updatePriority(TaskPriority.high);
      expect(updatedTask.priority, equals(TaskPriority.high));
      expect(updatedTask.updatedAt.isAfter(task.updatedAt), isTrue);
    });

    test('updatePriority should throw for same priority', () {
      final task = Task.create(title: 'Test Task');
      expect(
        () => task.updatePriority(TaskPriority.medium),
        throwsStateError,
      );
    });

    test('updatePriority should throw for archived task', () {
      final task = Task.create(title: 'Test Task').archive();
      expect(
        () => task.updatePriority(TaskPriority.high),
        throwsStateError,
      );
    });

    test('escalate should increase priority level', () {
      var task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.low,
      );

      task = task.escalate();
      expect(task.priority, equals(TaskPriority.medium));

      task = task.escalate();
      expect(task.priority, equals(TaskPriority.high));

      task = task.escalate();
      expect(task.priority, equals(TaskPriority.critical));
    });

    test('escalate should throw for critical priority', () {
      final task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.critical,
      );
      expect(() => task.escalate(), throwsStateError);
    });

    test('deescalate should decrease priority level', () {
      var task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.critical,
      );

      task = task.deescalate();
      expect(task.priority, equals(TaskPriority.high));

      task = task.deescalate();
      expect(task.priority, equals(TaskPriority.medium));

      task = task.deescalate();
      expect(task.priority, equals(TaskPriority.low));
    });

    test('deescalate should throw for low priority', () {
      final task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.low,
      );
      expect(() => task.deescalate(), throwsStateError);
    });

    test('priority getters should work correctly', () {
      final task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.high,
      );

      expect(task.isHighPriority, isTrue);
      expect(task.isCritical, isFalse);
      expect(task.isMediumPriority, isFalse);
      expect(task.isLowPriority, isFalse);
    });
  });
}
