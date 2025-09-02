import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';
import 'task.dart';

extension ReminderX on Reminder {
  DateTime getNextOccurrence() {

    final now = DateTime.now();
    if (time.isAfter(now)) {
      return time;
    }

    // Calculate how many periods have passed
    final difference = now.difference(time);

    switch (repeat) {
      case ReminderRepeat.none:
        return time;
        
      case ReminderRepeat.daily:
        final passedDays = difference.inDays;
        return DateTime(
          time.year,
          time.month,
          time.day,
          time.hour,
          time.minute,
          time.second,
        ).add(Duration(days: passedDays + 1));

      case ReminderRepeat.weekly:
        final passedWeeks = difference.inDays ~/ 7;
        return DateTime(
          time.year,
          time.month,
          time.day,
          time.hour,
          time.minute,
          time.second,
        ).add(Duration(days: (passedWeeks + 1) * 7));

      case ReminderRepeat.monthly:
        final monthsPassed = (now.year - time.year) * 12 + now.month - time.month;
        var targetMonth = time.month + monthsPassed + 1;
        var targetYear = time.year + (targetMonth - 1) ~/ 12;
        targetMonth = ((targetMonth - 1) % 12) + 1;

        var nextMonth = DateTime(
          targetYear,
          targetMonth,
          1,
          time.hour,
          time.minute,
          time.second,
        );

        // Get the last day of the target month if the original day is too large
        final lastDayOfMonth = DateTime(targetYear, targetMonth + 1, 0).day;
        final targetDay = time.day > lastDayOfMonth ? lastDayOfMonth : time.day;

        nextMonth = DateTime(
          targetYear,
          targetMonth,
          targetDay,
          time.hour,
          time.minute,
          time.second,
        );
        return nextMonth;

    }
  }

  bool get isDue {
    if (isTriggered && repeat == ReminderRepeat.none) {
      return false;
    }
    return time.isBefore(DateTime.now());
  }

  Reminder trigger() {
    if (!isDue) {
      throw StateError('Cannot trigger a reminder that is not due');
    }
    return copyWith(
      isTriggered: repeat == ReminderRepeat.none,
      time: repeat == ReminderRepeat.none ? time : getNextOccurrence(),
    );
  }
}
