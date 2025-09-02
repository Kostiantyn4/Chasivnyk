import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/task_repository.dart';
import '../../data/repositories/user_settings_repository.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/repositories/user_settings_repository.dart';

final taskRepositoryProvider = Provider<ITaskRepository>((ref) {
  return TaskRepositoryImpl();
});

final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  return UserSettingsRepositoryImpl();
});
