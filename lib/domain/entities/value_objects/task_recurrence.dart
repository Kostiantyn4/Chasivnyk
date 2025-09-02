import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_recurrence.freezed.dart';
part 'task_recurrence.g.dart';

enum RecurrenceType {
  none,
  daily,
  weekly,
  monthly,
  yearly,
  custom,
}

enum WeekDay {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7);

  const WeekDay(this.value);
  final int value;
}

@freezed
class TaskRecurrence with _$TaskRecurrence {
  const factory TaskRecurrence({
    @Default(RecurrenceType.none) RecurrenceType type,
    @Default(1) int interval, // Every N days/weeks/months/years
    @Default([]) List<WeekDay> weekDays, // For weekly recurrence
    @Default(1) int dayOfMonth, // For monthly recurrence (1-31)
    @Default(1) int monthOfYear, // For yearly recurrence (1-12)
    DateTime? endDate, // When recurrence ends
    @Default(0) int maxOccurrences, // Max number of occurrences (0 = infinite)
    @Default(0) int completedOccurrences, // How many times completed
  }) = _TaskRecurrence;

  factory TaskRecurrence.fromJson(Map<String, dynamic> json) =>
      _$TaskRecurrenceFromJson(json);

  // Factory constructors for common patterns
  factory TaskRecurrence.daily({int interval = 1, DateTime? endDate, int maxOccurrences = 0}) {
    return TaskRecurrence(
      type: RecurrenceType.daily,
      interval: interval,
      endDate: endDate,
      maxOccurrences: maxOccurrences,
    );
  }

  factory TaskRecurrence.weekly({
    int interval = 1,
    List<WeekDay> weekDays = const [],
    DateTime? endDate,
    int maxOccurrences = 0,
  }) {
    return TaskRecurrence(
      type: RecurrenceType.weekly,
      interval: interval,
      weekDays: weekDays.isEmpty ? [WeekDay.monday] : weekDays,
      endDate: endDate,
      maxOccurrences: maxOccurrences,
    );
  }

  factory TaskRecurrence.monthly({
    int interval = 1,
    int dayOfMonth = 1,
    DateTime? endDate,
    int maxOccurrences = 0,
  }) {
    return TaskRecurrence(
      type: RecurrenceType.monthly,
      interval: interval,
      dayOfMonth: dayOfMonth.clamp(1, 31),
      endDate: endDate,
      maxOccurrences: maxOccurrences,
    );
  }

  factory TaskRecurrence.yearly({
    int interval = 1,
    int monthOfYear = 1,
    int dayOfMonth = 1,
    DateTime? endDate,
    int maxOccurrences = 0,
  }) {
    return TaskRecurrence(
      type: RecurrenceType.yearly,
      interval: interval,
      monthOfYear: monthOfYear.clamp(1, 12),
      dayOfMonth: dayOfMonth.clamp(1, 31),
      endDate: endDate,
      maxOccurrences: maxOccurrences,
    );
  }

  factory TaskRecurrence.none() {
    return const TaskRecurrence(type: RecurrenceType.none);
  }
}

extension TaskRecurrenceX on TaskRecurrence {
  /// Checks if this recurrence is active (not none)
  bool get isActive => type != RecurrenceType.none;

  /// Checks if recurrence has ended
  bool get hasEnded {
    if (!isActive) return true;
    
    final now = DateTime.now();
    
    // Check end date
    if (endDate != null && now.isAfter(endDate!)) {
      return true;
    }
    
    // Check max occurrences
    if (maxOccurrences > 0 && completedOccurrences >= maxOccurrences) {
      return true;
    }
    
    return false;
  }

  /// Calculates the next occurrence date from a given date
  DateTime? getNextOccurrence(DateTime fromDate) {
    if (!isActive || hasEnded) return null;

    switch (type) {
      case RecurrenceType.none:
        return null;
        
      case RecurrenceType.daily:
        return fromDate.add(Duration(days: interval));
        
      case RecurrenceType.weekly:
        return _getNextWeeklyOccurrence(fromDate);
        
      case RecurrenceType.monthly:
        return _getNextMonthlyOccurrence(fromDate);
        
      case RecurrenceType.yearly:
        return _getNextYearlyOccurrence(fromDate);
        
      case RecurrenceType.custom:
        // Custom logic can be implemented here
        return null;
    }
  }

  /// Gets all upcoming occurrences within a date range
  List<DateTime> getOccurrencesInRange(DateTime start, DateTime end) {
    if (!isActive || hasEnded) return [];

    final occurrences = <DateTime>[];
    DateTime? current = getNextOccurrence(start.subtract(const Duration(days: 1)));
    
    while (current != null && current.isBefore(end)) {
      if (current.isAfter(start) || current.isAtSameMomentAs(start)) {
        occurrences.add(current);
      }
      
      // Safety check to prevent infinite loops
      if (occurrences.length >= 1000) break;
      
      current = getNextOccurrence(current);
    }
    
    return occurrences;
  }

  /// Marks an occurrence as completed
  TaskRecurrence markOccurrenceCompleted() {
    return copyWith(completedOccurrences: completedOccurrences + 1);
  }

  /// Gets human-readable description of the recurrence pattern
  String get description {
    if (!isActive) return 'No recurrence';

    switch (type) {
      case RecurrenceType.none:
        return 'No recurrence';
        
      case RecurrenceType.daily:
        return interval == 1 ? 'Daily' : 'Every $interval days';
        
      case RecurrenceType.weekly:
        final days = weekDays.map((d) => d.name.capitalize()).join(', ');
        final intervalText = interval == 1 ? 'Weekly' : 'Every $interval weeks';
        return '$intervalText on $days';
        
      case RecurrenceType.monthly:
        final intervalText = interval == 1 ? 'Monthly' : 'Every $interval months';
        return '$intervalText on day $dayOfMonth';
        
      case RecurrenceType.yearly:
        final intervalText = interval == 1 ? 'Yearly' : 'Every $interval years';
        return '$intervalText on $dayOfMonth/${monthOfYear.toString().padLeft(2, '0')}';
        
      case RecurrenceType.custom:
        return 'Custom recurrence';
    }
  }

  DateTime? _getNextWeeklyOccurrence(DateTime fromDate) {
    if (weekDays.isEmpty) return null;

    final currentWeekDay = fromDate.weekday;
    final sortedWeekDays = weekDays.map((d) => d.value).toList()..sort();

    // Find next occurrence in current week
    for (final weekDay in sortedWeekDays) {
      if (weekDay > currentWeekDay) {
        final daysToAdd = weekDay - currentWeekDay;
        return fromDate.add(Duration(days: daysToAdd));
      }
    }

    // Next occurrence is in next interval week
    final daysToNextWeek = (7 * interval) - currentWeekDay + sortedWeekDays.first;
    return fromDate.add(Duration(days: daysToNextWeek));
  }

  DateTime? _getNextMonthlyOccurrence(DateTime fromDate) {
    var nextMonth = DateTime(fromDate.year, fromDate.month + interval, dayOfMonth);
    
    // Handle case where dayOfMonth doesn't exist in target month
    while (nextMonth.day != dayOfMonth) {
      nextMonth = DateTime(nextMonth.year, nextMonth.month, 1);
      nextMonth = DateTime(nextMonth.year, nextMonth.month + 1, dayOfMonth);
    }
    
    return nextMonth;
  }

  DateTime? _getNextYearlyOccurrence(DateTime fromDate) {
    var nextYear = DateTime(fromDate.year + interval, monthOfYear, dayOfMonth);
    
    // Handle leap year edge case (Feb 29)
    if (nextYear.month != monthOfYear) {
      nextYear = DateTime(nextYear.year, monthOfYear, 28);
    }
    
    return nextYear;
  }
}

extension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
