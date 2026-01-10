import '../entities/project.dart';
import '../entities/value_objects/task_value_objects.dart';

abstract class IProjectRepository {
  Future<List<Project>> findAll();
  Future<Project?> findById(ProjectId id);
  Future<void> save(Project project);
  Future<void> delete(ProjectId id);
}
