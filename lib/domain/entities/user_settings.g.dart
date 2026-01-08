// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      userId: json['user_id'] as String,
      language: json['language'] as String? ?? 'uk',
      themeMode:
          $enumDecodeNullable(_$ThemeModeEnumMap, json['theme_mode']) ??
          ThemeMode.dark,
      defaultTaskPriority: json['default_task_priority'] == null
          ? TaskPriority.medium
          : const TaskPriorityConverter().fromJson(
              json['default_task_priority'] as String,
            ),
      dateFormat:
          $enumDecodeNullable(_$DateFormatEnumMap, json['date_format']) ??
          DateFormat.ddMMyyyy,
      timeFormat:
          $enumDecodeNullable(_$TimeFormatEnumMap, json['time_format']) ??
          TimeFormat.h24,
      showCompletedTasks: json['show_completed_tasks'] as bool? ?? true,
      enableNotifications: json['enable_notifications'] as bool? ?? true,
      defaultReminderMinutes:
          (json['default_reminder_minutes'] as num?)?.toInt() ?? 15,
      autoArchiveCompletedDays:
          (json['auto_archive_completed_days'] as num?)?.toInt() ?? 7,
      enableDarkCalendar: json['enable_dark_calendar'] as bool? ?? false,
      showWeekNumbers: json['show_week_numbers'] as bool? ?? true,
      weekStartDay: (json['week_start_day'] as num?)?.toInt() ?? 1,
      defaultProjectId: json['default_project_id'] as String? ?? '',
      pinnedProjectIds:
          (json['pinned_project_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'language': instance.language,
      'theme_mode': _$ThemeModeEnumMap[instance.themeMode]!,
      'default_task_priority': const TaskPriorityConverter().toJson(
        instance.defaultTaskPriority,
      ),
      'date_format': _$DateFormatEnumMap[instance.dateFormat]!,
      'time_format': _$TimeFormatEnumMap[instance.timeFormat]!,
      'show_completed_tasks': instance.showCompletedTasks,
      'enable_notifications': instance.enableNotifications,
      'default_reminder_minutes': instance.defaultReminderMinutes,
      'auto_archive_completed_days': instance.autoArchiveCompletedDays,
      'enable_dark_calendar': instance.enableDarkCalendar,
      'show_week_numbers': instance.showWeekNumbers,
      'week_start_day': instance.weekStartDay,
      'default_project_id': instance.defaultProjectId,
      'pinned_project_ids': instance.pinnedProjectIds,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ThemeModeEnumMap = {
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
  ThemeMode.system: 'system',
};

const _$DateFormatEnumMap = {
  DateFormat.ddMMyyyy: 'ddMMyyyy',
  DateFormat.mmDDyyyy: 'mmDDyyyy',
  DateFormat.yyyyMMdd: 'yyyyMMdd',
};

const _$TimeFormatEnumMap = {TimeFormat.h12: 'h12', TimeFormat.h24: 'h24'};
