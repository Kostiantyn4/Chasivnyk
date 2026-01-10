import '../entities/project.dart';
import '../entities/value_objects/task_value_objects.dart';
import '../repositories/project_repository.dart';

abstract class IProjectService {
  Future<List<Project>> getProjects();
  Future<Project?> findById(String id);
  Future<Project> createProject({
    required String title,
    String? description,
    List<String>? tags,
  });
  Future<Project> updateProject(Project project, {
    String? title,
    String? description,
    List<String>? tags,
  });
  Future<void> deleteProject(Project project);
}

class ProjectService implements IProjectService {
  ProjectService(this._repository);

  final IProjectRepository _repository;

  @override
  Future<List<Project>> getProjects() {
    return _repository.findAll();
  }

  @override
  Future<Project?> findById(String id) {
    return _repository.findById(ProjectId(id));
  }

  @override
  Future<Project> createProject({
    required String title,
    String? description,
    List<String>? tags,
  }) async {
    final project = Project.create(
      title: title,
      description: description,
      tags: tags?.map(TaskTag.new).toList(),
    );
    await _repository.save(project);
    return project;
  }

  @override
  Future<Project> updateProject(
    Project project, {
    String? title,
    String? description,
    List<String>? tags,
  }) async {
    final updated = project.copyWith(
      title: title != null ? ProjectTitle(title) : project.title,
      description: description != null
          ? (description.isEmpty ? null : ProjectDescription(description))
          : project.description,
      tags: tags != null
          ? tags.map(TaskTag.new).toList(growable: false)
          : project.tags,
      updatedAt: DateTime.now(),
    );
    await _repository.save(updated);
    return updated;
  }

  @override
  Future<void> deleteProject(Project project) async {
    await _repository.delete(project.id);
  }
}
