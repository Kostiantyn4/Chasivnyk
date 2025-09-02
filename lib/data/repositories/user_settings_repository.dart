import '../../domain/entities/user_settings.dart';
import '../../domain/repositories/user_settings_repository.dart';

class UserSettingsRepositoryImpl implements UserSettingsRepository {
  final Map<String, UserSettings> _settings = {};

  @override
  Future<UserSettings?> getUserSettings(String userId) async {
    return _settings[userId];
  }

  @override
  Future<void> saveUserSettings(UserSettings settings) async {
    _settings[settings.userId] = settings;
  }

  @override
  Future<void> deleteUserSettings(String userId) async {
    _settings.remove(userId);
  }

  @override
  Future<bool> hasUserSettings(String userId) async {
    return _settings.containsKey(userId);
  }
}
