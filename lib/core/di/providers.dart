import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/isar_task_repository.dart';
import '../../data/repositories/user_settings_repository.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/repositories/user_settings_repository.dart';
import '../../domain/services/task_service.dart';

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
  return repository.findAllSortedByPriority();
});

final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  return UserSettingsRepositoryImpl();
});
