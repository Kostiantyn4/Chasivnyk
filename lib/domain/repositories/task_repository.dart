import '../entities/task.dart';
import '../entities/value_objects/task_value_objects.dart';

abstract class ITaskRepository {
  Future<Task?> findById(TaskId id);
  Future<List<Task>> findAll();
  Future<List<Task>> findAllSortedByPriority();
  Future<List<Task>> findByProject(String? projectId);
  Future<void> save(Task task);
  Future<void> delete(TaskId id);
}
