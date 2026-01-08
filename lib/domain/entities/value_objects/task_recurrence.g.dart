// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_recurrence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskRecurrenceImpl _$$TaskRecurrenceImplFromJson(Map<String, dynamic> json) =>
    _$TaskRecurrenceImpl(
      type:
          $enumDecodeNullable(_$RecurrenceTypeEnumMap, json['type']) ??
          RecurrenceType.none,
      interval: (json['interval'] as num?)?.toInt() ?? 1,
      weekDays:
          (json['week_days'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$WeekDayEnumMap, e))
              .toList() ??
          const [],
      dayOfMonth: (json['day_of_month'] as num?)?.toInt() ?? 1,
      monthOfYear: (json['month_of_year'] as num?)?.toInt() ?? 1,
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      maxOccurrences: (json['max_occurrences'] as num?)?.toInt() ?? 0,
      completedOccurrences:
          (json['completed_occurrences'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TaskRecurrenceImplToJson(
  _$TaskRecurrenceImpl instance,
) => <String, dynamic>{
  'type': _$RecurrenceTypeEnumMap[instance.type]!,
  'interval': instance.interval,
  'week_days': instance.weekDays.map((e) => _$WeekDayEnumMap[e]!).toList(),
  'day_of_month': instance.dayOfMonth,
  'month_of_year': instance.monthOfYear,
  'end_date': instance.endDate?.toIso8601String(),
  'max_occurrences': instance.maxOccurrences,
  'completed_occurrences': instance.completedOccurrences,
};

const _$RecurrenceTypeEnumMap = {
  RecurrenceType.none: 'none',
  RecurrenceType.daily: 'daily',
  RecurrenceType.weekly: 'weekly',
  RecurrenceType.monthly: 'monthly',
  RecurrenceType.yearly: 'yearly',
  RecurrenceType.custom: 'custom',
};

const _$WeekDayEnumMap = {
  WeekDay.monday: 'monday',
  WeekDay.tuesday: 'tuesday',
  WeekDay.wednesday: 'wednesday',
  WeekDay.thursday: 'thursday',
  WeekDay.friday: 'friday',
  WeekDay.saturday: 'saturday',
  WeekDay.sunday: 'sunday',
};
