import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/isar_task_repository.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/user_settings_repository.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/repositories/project_repository.dart';
import '../../domain/repositories/user_settings_repository.dart';
import '../../domain/services/task_service.dart';
import '../../domain/services/project_service.dart';

final taskRepositoryProvider = FutureProvider<ITaskRepository>((ref) async {
  final isar = await AppDatabase.getInstance();
  return IsarTaskRepository(isar);
});

final taskServiceProvider = FutureProvider<ITaskService>((ref) async {
  final repository = await ref.watch(taskRepositoryProvider.future);
  return TaskService(repository);
});

final tasksProvider = FutureProvider<List<Task>>((ref) async {
  final repository = await ref.watch(taskRepositoryProvider.future);
  return repository.findByProject(null);
});

final projectTasksProvider =
    FutureProvider.family<List<Task>, String?>((ref, projectId) async {
  final repository = await ref.watch(taskRepositoryProvider.future);
  return repository.findByProject(projectId);
});

final projectRepositoryProvider = Provider<IProjectRepository>((ref) {
  return ProjectRepository();
});

final projectServiceProvider = Provider<IProjectService>((ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return ProjectService(repository);
});

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final service = ref.watch(projectServiceProvider);
  return service.getProjects();
});

final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  return UserSettingsRepositoryImpl();
});
