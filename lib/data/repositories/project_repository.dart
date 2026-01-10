import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/project.dart';
import '../../domain/entities/value_objects/task_value_objects.dart';
import '../../domain/repositories/project_repository.dart';

class ProjectRepository implements IProjectRepository {
  static const String _storageKey = 'projects_storage';

  Future<List<Project>> _loadProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null) return [];
    try {
      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((entry) => Project.fromJson(Map<String, dynamic>.from(entry as Map)))
          .toList();
    } catch (_) {
      await prefs.remove(_storageKey);
      return [];
    }
  }

  Future<void> _persist(List<Project> projects) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      projects.map((project) => project.toJson()).toList(),
    );
    await prefs.setString(_storageKey, encoded);
  }

  @override
  Future<List<Project>> findAll() {
    return _loadProjects();
  }

  @override
  Future<Project?> findById(ProjectId id) async {
    final projects = await _loadProjects();
    return projects.cast<Project?>().firstWhere(
          (project) => project?.id == id,
          orElse: () => null,
        );
  }

  @override
  Future<void> save(Project project) async {
    final projects = await _loadProjects();
    final index = projects.indexWhere((item) => item.id == project.id);
    if (index == -1) {
      projects.add(project);
    } else {
      projects[index] = project.copyWith(updatedAt: DateTime.now());
    }
    await _persist(projects);
  }

  @override
  Future<void> delete(ProjectId id) async {
    final projects = await _loadProjects();
    projects.removeWhere((project) => project.id == id);
    await _persist(projects);
  }
}
