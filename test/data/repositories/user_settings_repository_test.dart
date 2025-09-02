import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/data/repositories/user_settings_repository.dart';
import 'package:chasivnyk/domain/entities/user_settings.dart';

void main() {
  group('UserSettingsRepositoryImpl', () {
    late UserSettingsRepositoryImpl repository;
    late UserSettings testSettings;

    setUp(() {
      repository = UserSettingsRepositoryImpl();
      testSettings = UserSettings.createDefault('test-user-1');
    });

    group('getUserSettings', () {
      test('should return null when user settings do not exist', () async {
        final result = await repository.getUserSettings('non-existent-user');
        expect(result, isNull);
      });

      test('should return user settings when they exist', () async {
        await repository.saveUserSettings(testSettings);
        
        final result = await repository.getUserSettings(testSettings.userId);
        expect(result, isNotNull);
        expect(result!.userId, equals(testSettings.userId));
        expect(result.language, equals(testSettings.language));
      });
    });

    group('saveUserSettings', () {
      test('should save new user settings', () async {
        await repository.saveUserSettings(testSettings);
        
        final saved = await repository.getUserSettings(testSettings.userId);
        expect(saved, isNotNull);
        expect(saved!.userId, equals(testSettings.userId));
      });

      test('should update existing user settings', () async {
        await repository.saveUserSettings(testSettings);
        
        final updated = testSettings.updateSetting(language: 'en');
        await repository.saveUserSettings(updated);
        
        final result = await repository.getUserSettings(testSettings.userId);
        expect(result!.language, equals('en'));
        expect(result.updatedAt, equals(updated.updatedAt));
      });
    });

    group('deleteUserSettings', () {
      test('should delete existing user settings', () async {
        await repository.saveUserSettings(testSettings);
        expect(await repository.hasUserSettings(testSettings.userId), isTrue);
        
        await repository.deleteUserSettings(testSettings.userId);
        expect(await repository.hasUserSettings(testSettings.userId), isFalse);
        
        final result = await repository.getUserSettings(testSettings.userId);
        expect(result, isNull);
      });

      test('should not throw when deleting non-existent settings', () async {
        expect(
          () => repository.deleteUserSettings('non-existent-user'),
          returnsNormally,
        );
      });
    });

    group('hasUserSettings', () {
      test('should return false when user settings do not exist', () async {
        final result = await repository.hasUserSettings('non-existent-user');
        expect(result, isFalse);
      });

      test('should return true when user settings exist', () async {
        await repository.saveUserSettings(testSettings);
        
        final result = await repository.hasUserSettings(testSettings.userId);
        expect(result, isTrue);
      });

      test('should return false after deletion', () async {
        await repository.saveUserSettings(testSettings);
        await repository.deleteUserSettings(testSettings.userId);
        
        final result = await repository.hasUserSettings(testSettings.userId);
        expect(result, isFalse);
      });
    });

    group('Multiple users', () {
      test('should handle multiple users independently', () async {
        final user1Settings = UserSettings.createDefault('user-1');
        final user2Settings = UserSettings.createDefault('user-2');
        
        await repository.saveUserSettings(user1Settings);
        await repository.saveUserSettings(user2Settings);
        
        expect(await repository.hasUserSettings('user-1'), isTrue);
        expect(await repository.hasUserSettings('user-2'), isTrue);
        
        final retrieved1 = await repository.getUserSettings('user-1');
        final retrieved2 = await repository.getUserSettings('user-2');
        
        expect(retrieved1!.userId, equals('user-1'));
        expect(retrieved2!.userId, equals('user-2'));
        
        await repository.deleteUserSettings('user-1');
        
        expect(await repository.hasUserSettings('user-1'), isFalse);
        expect(await repository.hasUserSettings('user-2'), isTrue);
      });
    });
  });
}
