import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/task_attachment.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';
import 'package:chasivnyk/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<Task?> findById(TaskId id) async {
    try {
      return _tasks.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Task>> findAll() async {
    return _tasks;
  }

  @override
  Future<Task> save(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
    } else {
      _tasks.add(task);
    }
    return task;
  }

  @override
  Future<void> delete(TaskId id) async {
    _tasks.removeWhere((t) => t.id == id);
  }

  @override
  Future<List<Task>> findAllSortedByPriority() async {
    final sortedTasks = List<Task>.from(_tasks);
    sortedTasks.sort((a, b) => a.priority.index.compareTo(b.priority.index));
    return sortedTasks;
  }
}
