import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects/task_value_objects.dart';
import 'value_objects/json_converters.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

enum ThemeMode { light, dark, system }
enum DateFormat { ddMMyyyy, mmDDyyyy, yyyyMMdd }
enum TimeFormat { h12, h24 }

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    required String userId,
    @Default('uk') String language,
    @Default(ThemeMode.dark) ThemeMode themeMode,
    @Default(TaskPriority.medium) @TaskPriorityConverter() TaskPriority defaultTaskPriority,
    @Default(DateFormat.ddMMyyyy) DateFormat dateFormat,
    @Default(TimeFormat.h24) TimeFormat timeFormat,
    @Default(true) bool showCompletedTasks,
    @Default(true) bool enableNotifications,
    @Default(15) int defaultReminderMinutes,
    @Default(7) int autoArchiveCompletedDays,
    @Default(false) bool enableDarkCalendar,
    @Default(true) bool showWeekNumbers,
    @Default(1) int weekStartDay, // 1 = Monday, 7 = Sunday
    @Default('') String defaultProjectId,
    @Default([]) List<String> pinnedProjectIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) => 
      _$UserSettingsFromJson(json);

  factory UserSettings.createDefault(String userId) {
    final now = DateTime.now();
    return UserSettings(
      userId: userId,
      createdAt: now,
      updatedAt: now,
    );
  }
}

extension UserSettingsX on UserSettings {
  /// Updates a setting and returns new instance with updated timestamp
  UserSettings updateSetting<T>({
    String? language,
    ThemeMode? themeMode,
    TaskPriority? defaultTaskPriority,
    DateFormat? dateFormat,
    TimeFormat? timeFormat,
    bool? showCompletedTasks,
    bool? enableNotifications,
    int? defaultReminderMinutes,
    int? autoArchiveCompletedDays,
    bool? enableDarkCalendar,
    bool? showWeekNumbers,
    int? weekStartDay,
    String? defaultProjectId,
    List<String>? pinnedProjectIds,
  }) {
    return copyWith(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      defaultTaskPriority: defaultTaskPriority ?? this.defaultTaskPriority,
      dateFormat: dateFormat ?? this.dateFormat,
      timeFormat: timeFormat ?? this.timeFormat,
      showCompletedTasks: showCompletedTasks ?? this.showCompletedTasks,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      defaultReminderMinutes: defaultReminderMinutes ?? this.defaultReminderMinutes,
      autoArchiveCompletedDays: autoArchiveCompletedDays ?? this.autoArchiveCompletedDays,
      enableDarkCalendar: enableDarkCalendar ?? this.enableDarkCalendar,
      showWeekNumbers: showWeekNumbers ?? this.showWeekNumbers,
      weekStartDay: weekStartDay ?? this.weekStartDay,
      defaultProjectId: defaultProjectId ?? this.defaultProjectId,
      pinnedProjectIds: pinnedProjectIds ?? this.pinnedProjectIds,
      updatedAt: DateTime.now(),
    );
  }

  /// Validates week start day (1-7)
  bool get isValidWeekStartDay => weekStartDay >= 1 && weekStartDay <= 7;

  /// Validates reminder minutes (1-1440)
  bool get isValidReminderMinutes => 
      defaultReminderMinutes >= 1 && defaultReminderMinutes <= 1440;

  /// Validates auto archive days (1-365)
  bool get isValidAutoArchiveDays => 
      autoArchiveCompletedDays >= 1 && autoArchiveCompletedDays <= 365;

  /// Returns locale string for internationalization
  String get locale => language == 'uk' ? 'uk_UA' : 'en_US';

  /// Checks if project is pinned
  bool isProjectPinned(String projectId) => pinnedProjectIds.contains(projectId);

  /// Adds project to pinned list
  UserSettings pinProject(String projectId) {
    if (isProjectPinned(projectId)) return this;
    return updateSetting(
      pinnedProjectIds: [...pinnedProjectIds, projectId],
    );
  }

  /// Removes project from pinned list
  UserSettings unpinProject(String projectId) {
    if (!isProjectPinned(projectId)) return this;
    return updateSetting(
      pinnedProjectIds: pinnedProjectIds.where((id) => id != projectId).toList(),
    );
  }
}
