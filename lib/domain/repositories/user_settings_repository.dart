import '../entities/user_settings.dart';

abstract class UserSettingsRepository {
  Future<UserSettings?> getUserSettings(String userId);
  Future<void> saveUserSettings(UserSettings settings);
  Future<void> deleteUserSettings(String userId);
  Future<bool> hasUserSettings(String userId);
}
