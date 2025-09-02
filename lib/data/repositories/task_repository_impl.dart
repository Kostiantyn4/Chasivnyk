import '../../domain/entities/task.dart';
import '../../domain/entities/value_objects/task_value_objects.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<Task?> findById(TaskId id) async {
    try {
      return _tasks.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
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
      // Сортуємо за пріоритетом (critical -> high -> medium -> low)
      final priorityOrder = TaskPriority.values.toList().reversed.toList();
      final aIndex = priorityOrder.indexOf(a.priority);
      final bIndex = priorityOrder.indexOf(b.priority);
      
      if (aIndex != bIndex) return aIndex.compareTo(bIndex);
      
      // Якщо пріоритети однакові, сортуємо за датою оновлення (новіші зверху)
      return b.updatedAt.compareTo(a.updatedAt);
    });
  }
}
