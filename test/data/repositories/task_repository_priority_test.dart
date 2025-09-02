import 'package:test/test.dart';
import 'package:chasivnyk/data/repositories/task_repository_impl.dart';
import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('TaskRepository Priority Sorting', () {
    late TaskRepositoryImpl repository;

    setUp(() {
      repository = TaskRepositoryImpl();
    });

    test('should sort tasks by priority and update date', () async {
      final now = DateTime.now();
      
      final task1 = Task.create(
        title: 'Low Priority Old',
        priority: TaskPriority.low,
      ).copyWith(updatedAt: now.subtract(const Duration(hours: 2)));

      final task2 = Task.create(
        title: 'Medium Priority New',
        priority: TaskPriority.medium,
      ).copyWith(updatedAt: now);

      final task3 = Task.create(
        title: 'Medium Priority Old',
        priority: TaskPriority.medium,
      ).copyWith(updatedAt: now.subtract(const Duration(hours: 1)));

      final task4 = Task.create(
        title: 'High Priority',
        priority: TaskPriority.high,
      );

      final task5 = Task.create(
        title: 'Critical Priority',
        priority: TaskPriority.critical,
      );

      // Add tasks in random order
      await repository.save(task1);
      await repository.save(task3);
      await repository.save(task5);
      await repository.save(task2);
      await repository.save(task4);

      final sortedTasks = await repository.findAllSortedByPriority();

      // Verify priority order (critical -> high -> medium -> low)
      expect(sortedTasks[0].title.value, equals('Critical Priority'));
      expect(sortedTasks[1].title.value, equals('High Priority'));
      
      // Verify that tasks with same priority are sorted by update date (newer first)
      expect(sortedTasks[2].title.value, equals('Medium Priority New'));
      expect(sortedTasks[3].title.value, equals('Medium Priority Old'));
      expect(sortedTasks[4].title.value, equals('Low Priority Old'));
    });

    test('should handle empty repository', () async {
      final tasks = await repository.findAllSortedByPriority();
      expect(tasks, isEmpty);
    });

    test('should handle single task', () async {
      final task = Task.create(
        title: 'Test Task',
        priority: TaskPriority.medium,
      );
      
      await repository.save(task);
      
      final tasks = await repository.findAllSortedByPriority();
      expect(tasks.length, equals(1));
      expect(tasks.first.title.value, equals('Test Task'));
    });
  });
}
