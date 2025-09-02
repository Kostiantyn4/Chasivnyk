import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/user_settings.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('UserSettings', () {
    late UserSettings settings;
    final now = DateTime.now();

    setUp(() {
      settings = UserSettings(
        userId: 'test-user-1',
        createdAt: now,
        updatedAt: now,
      );
    });

    group('Factory constructors', () {
      test('should create with default values', () {
        expect(settings.language, equals('uk'));
        expect(settings.themeMode, equals(ThemeMode.dark));
        expect(settings.defaultTaskPriority, equals(TaskPriority.medium));
        expect(settings.dateFormat, equals(DateFormat.ddMMyyyy));
        expect(settings.timeFormat, equals(TimeFormat.h24));
        expect(settings.showCompletedTasks, isTrue);
        expect(settings.enableNotifications, isTrue);
        expect(settings.defaultReminderMinutes, equals(15));
        expect(settings.autoArchiveCompletedDays, equals(7));
        expect(settings.enableDarkCalendar, isFalse);
        expect(settings.showWeekNumbers, isTrue);
        expect(settings.weekStartDay, equals(1));
        expect(settings.defaultProjectId, isEmpty);
        expect(settings.pinnedProjectIds, isEmpty);
      });

      test('should create default settings', () {
        const userId = 'test-user';
        final defaultSettings = UserSettings.createDefault(userId);
        
        expect(defaultSettings.userId, equals(userId));
        expect(defaultSettings.language, equals('uk'));
        expect(defaultSettings.themeMode, equals(ThemeMode.dark));
        expect(defaultSettings.createdAt, isNotNull);
        expect(defaultSettings.updatedAt, isNotNull);
      });
    });

    group('JSON serialization', () {
      test('should serialize to and from JSON', () {
        final json = settings.toJson();
        final fromJson = UserSettings.fromJson(json);
        
        expect(fromJson.userId, equals(settings.userId));
        expect(fromJson.language, equals(settings.language));
        expect(fromJson.themeMode, equals(settings.themeMode));
        expect(fromJson.defaultTaskPriority, equals(settings.defaultTaskPriority));
      });
    });

    group('Validation methods', () {
      test('should validate week start day', () {
        expect(settings.isValidWeekStartDay, isTrue);
        
        final invalidSettings = settings.copyWith(weekStartDay: 0);
        expect(invalidSettings.isValidWeekStartDay, isFalse);
        
        final validSettings = settings.copyWith(weekStartDay: 7);
        expect(validSettings.isValidWeekStartDay, isTrue);
      });

      test('should validate reminder minutes', () {
        expect(settings.isValidReminderMinutes, isTrue);
        
        final invalidSettings = settings.copyWith(defaultReminderMinutes: 0);
        expect(invalidSettings.isValidReminderMinutes, isFalse);
        
        final validSettings = settings.copyWith(defaultReminderMinutes: 1440);
        expect(validSettings.isValidReminderMinutes, isTrue);
      });

      test('should validate auto archive days', () {
        expect(settings.isValidAutoArchiveDays, isTrue);
        
        final invalidSettings = settings.copyWith(autoArchiveCompletedDays: 0);
        expect(invalidSettings.isValidAutoArchiveDays, isFalse);
        
        final validSettings = settings.copyWith(autoArchiveCompletedDays: 365);
        expect(validSettings.isValidAutoArchiveDays, isTrue);
      });
    });

    group('Locale and formatting', () {
      test('should return correct locale for Ukrainian', () {
        expect(settings.locale, equals('uk_UA'));
      });

      test('should return correct locale for English', () {
        final englishSettings = settings.copyWith(language: 'en');
        expect(englishSettings.locale, equals('en_US'));
      });
    });

    group('Project pinning', () {
      test('should check if project is pinned', () {
        expect(settings.isProjectPinned('project-1'), isFalse);
        
        final withPinned = settings.copyWith(pinnedProjectIds: ['project-1']);
        expect(withPinned.isProjectPinned('project-1'), isTrue);
      });

      test('should pin project', () {
        final pinned = settings.pinProject('project-1');
        
        expect(pinned.isProjectPinned('project-1'), isTrue);
        expect(pinned.pinnedProjectIds, contains('project-1'));
        expect(pinned.updatedAt.isAfter(settings.updatedAt), isTrue);
      });

      test('should not pin already pinned project', () {
        final withPinned = settings.copyWith(pinnedProjectIds: ['project-1']);
        final pinned = withPinned.pinProject('project-1');
        
        expect(identical(withPinned, pinned), isTrue);
      });

      test('should unpin project', () {
        final withPinned = settings.copyWith(pinnedProjectIds: ['project-1', 'project-2']);
        final unpinned = withPinned.unpinProject('project-1');
        
        expect(unpinned.isProjectPinned('project-1'), isFalse);
        expect(unpinned.isProjectPinned('project-2'), isTrue);
        expect(unpinned.pinnedProjectIds, hasLength(1));
        expect(unpinned.updatedAt.isAfter(withPinned.updatedAt), isTrue);
      });

      test('should not unpin non-pinned project', () {
        final unpinned = settings.unpinProject('project-1');
        
        expect(identical(settings, unpinned), isTrue);
      });
    });

    group('Update settings', () {
      test('should update single setting', () {
        final updated = settings.updateSetting(language: 'en');
        
        expect(updated.language, equals('en'));
        expect(updated.userId, equals(settings.userId));
        expect(updated.updatedAt.isAfter(settings.updatedAt), isTrue);
      });

      test('should update multiple settings', () {
        final updated = settings.updateSetting(
          language: 'en',
          themeMode: ThemeMode.light,
          enableNotifications: false,
        );
        
        expect(updated.language, equals('en'));
        expect(updated.themeMode, equals(ThemeMode.light));
        expect(updated.enableNotifications, isFalse);
        expect(updated.updatedAt.isAfter(settings.updatedAt), isTrue);
      });

      test('should not change values when no parameters provided', () {
        final updated = settings.updateSetting();
        
        expect(updated.language, equals(settings.language));
        expect(updated.themeMode, equals(settings.themeMode));
        expect(updated.updatedAt.isAfter(settings.updatedAt), isTrue);
      });
    });
  });
}
