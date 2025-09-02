import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_recurrence.dart';

void main() {
  group('TaskRecurrence', () {
    group('Factory constructors', () {
      test('should create none recurrence', () {
        final recurrence = TaskRecurrence.none();
        
        expect(recurrence.type, equals(RecurrenceType.none));
        expect(recurrence.isActive, isFalse);
      });

      test('should create daily recurrence', () {
        final recurrence = TaskRecurrence.daily(interval: 2);
        
        expect(recurrence.type, equals(RecurrenceType.daily));
        expect(recurrence.interval, equals(2));
        expect(recurrence.isActive, isTrue);
      });

      test('should create weekly recurrence', () {
        final recurrence = TaskRecurrence.weekly(
          interval: 2,
          weekDays: [WeekDay.monday, WeekDay.friday],
        );
        
        expect(recurrence.type, equals(RecurrenceType.weekly));
        expect(recurrence.interval, equals(2));
        expect(recurrence.weekDays, hasLength(2));
        expect(recurrence.weekDays, contains(WeekDay.monday));
        expect(recurrence.weekDays, contains(WeekDay.friday));
      });

      test('should create monthly recurrence', () {
        final recurrence = TaskRecurrence.monthly(
          interval: 3,
          dayOfMonth: 15,
        );
        
        expect(recurrence.type, equals(RecurrenceType.monthly));
        expect(recurrence.interval, equals(3));
        expect(recurrence.dayOfMonth, equals(15));
      });

      test('should create yearly recurrence', () {
        final recurrence = TaskRecurrence.yearly(
          interval: 2,
          monthOfYear: 6,
          dayOfMonth: 15,
        );
        
        expect(recurrence.type, equals(RecurrenceType.yearly));
        expect(recurrence.interval, equals(2));
        expect(recurrence.monthOfYear, equals(6));
        expect(recurrence.dayOfMonth, equals(15));
      });
    });

    group('JSON serialization', () {
      test('should serialize to and from JSON', () {
        final recurrence = TaskRecurrence.weekly(
          weekDays: [WeekDay.monday, WeekDay.wednesday],
          maxOccurrences: 10,
        );
        
        final json = recurrence.toJson();
        final fromJson = TaskRecurrence.fromJson(json);
        
        expect(fromJson.type, equals(recurrence.type));
        expect(fromJson.weekDays, equals(recurrence.weekDays));
        expect(fromJson.maxOccurrences, equals(recurrence.maxOccurrences));
      });
    });

    group('Validation', () {
      test('should clamp dayOfMonth in monthly recurrence', () {
        final recurrence = TaskRecurrence.monthly(dayOfMonth: 35);
        expect(recurrence.dayOfMonth, equals(31));
        
        final recurrence2 = TaskRecurrence.monthly(dayOfMonth: 0);
        expect(recurrence2.dayOfMonth, equals(1));
      });

      test('should clamp monthOfYear in yearly recurrence', () {
        final recurrence = TaskRecurrence.yearly(monthOfYear: 15);
        expect(recurrence.monthOfYear, equals(12));
        
        final recurrence2 = TaskRecurrence.yearly(monthOfYear: 0);
        expect(recurrence2.monthOfYear, equals(1));
      });
    });

    group('hasEnded', () {
      test('should return true for none type', () {
        final recurrence = TaskRecurrence.none();
        expect(recurrence.hasEnded, isTrue);
      });

      test('should return true when end date is passed', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        final recurrence = TaskRecurrence.daily(endDate: yesterday);
        
        expect(recurrence.hasEnded, isTrue);
      });

      test('should return true when max occurrences reached', () {
        final recurrence = TaskRecurrence.daily(maxOccurrences: 5)
            .copyWith(completedOccurrences: 5);
        
        expect(recurrence.hasEnded, isTrue);
      });

      test('should return false for active recurrence', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final recurrence = TaskRecurrence.daily(endDate: tomorrow);
        
        expect(recurrence.hasEnded, isFalse);
      });
    });

    group('getNextOccurrence', () {
      test('should return null for none type', () {
        final recurrence = TaskRecurrence.none();
        final next = recurrence.getNextOccurrence(DateTime.now());
        
        expect(next, isNull);
      });

      test('should return null for ended recurrence', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        final recurrence = TaskRecurrence.daily(endDate: yesterday);
        final next = recurrence.getNextOccurrence(DateTime.now());
        
        expect(next, isNull);
      });

      test('should calculate next daily occurrence', () {
        final recurrence = TaskRecurrence.daily(interval: 3);
        final baseDate = DateTime(2024, 1, 1);
        final next = recurrence.getNextOccurrence(baseDate);
        
        expect(next, equals(DateTime(2024, 1, 4)));
      });

      test('should calculate next weekly occurrence', () {
        final recurrence = TaskRecurrence.weekly(
          weekDays: [WeekDay.monday, WeekDay.friday],
        );
        final monday = DateTime(2024, 1, 1); // Monday
        final next = recurrence.getNextOccurrence(monday);
        
        expect(next?.weekday, equals(5)); // Friday
      });

      test('should calculate next monthly occurrence', () {
        final recurrence = TaskRecurrence.monthly(dayOfMonth: 15);
        final baseDate = DateTime(2024, 1, 1);
        final next = recurrence.getNextOccurrence(baseDate);
        
        expect(next, equals(DateTime(2024, 2, 15)));
      });

      test('should calculate next yearly occurrence', () {
        final recurrence = TaskRecurrence.yearly(
          monthOfYear: 6,
          dayOfMonth: 15,
        );
        final baseDate = DateTime(2024, 1, 1);
        final next = recurrence.getNextOccurrence(baseDate);
        
        expect(next, equals(DateTime(2025, 6, 15)));
      });
    });

    group('getOccurrencesInRange', () {
      test('should return empty list for none type', () {
        final recurrence = TaskRecurrence.none();
        final start = DateTime(2024, 1, 1);
        final end = DateTime(2024, 1, 31);
        
        final occurrences = recurrence.getOccurrencesInRange(start, end);
        expect(occurrences, isEmpty);
      });

      test('should return occurrences in range for daily', () {
        final recurrence = TaskRecurrence.daily();
        final start = DateTime(2024, 1, 1);
        final end = DateTime(2024, 1, 5);
        
        final occurrences = recurrence.getOccurrencesInRange(start, end);
        expect(occurrences, hasLength(4)); // 2nd, 3rd, 4th, 5th
      });

      test('should limit occurrences to prevent infinite loops', () {
        final recurrence = TaskRecurrence.daily();
        final start = DateTime(2024, 1, 1);
        final end = DateTime(2027, 1, 1); // 3 years
        
        final occurrences = recurrence.getOccurrencesInRange(start, end);
        expect(occurrences.length, lessThanOrEqualTo(1000));
      });
    });

    group('markOccurrenceCompleted', () {
      test('should increment completed occurrences', () {
        final recurrence = TaskRecurrence.daily();
        final completed = recurrence.markOccurrenceCompleted();
        
        expect(completed.completedOccurrences, equals(1));
        expect(recurrence.completedOccurrences, equals(0)); // Original unchanged
      });
    });

    group('description', () {
      test('should return correct description for none', () {
        final recurrence = TaskRecurrence.none();
        expect(recurrence.description, equals('No recurrence'));
      });

      test('should return correct description for daily', () {
        final recurrence = TaskRecurrence.daily();
        expect(recurrence.description, equals('Daily'));
        
        final recurrence2 = TaskRecurrence.daily(interval: 3);
        expect(recurrence2.description, equals('Every 3 days'));
      });

      test('should return correct description for weekly', () {
        final recurrence = TaskRecurrence.weekly(
          weekDays: [WeekDay.monday, WeekDay.friday],
        );
        expect(recurrence.description, contains('Weekly'));
        expect(recurrence.description, contains('Monday'));
        expect(recurrence.description, contains('Friday'));
      });

      test('should return correct description for monthly', () {
        final recurrence = TaskRecurrence.monthly(dayOfMonth: 15);
        expect(recurrence.description, equals('Monthly on day 15'));
        
        final recurrence2 = TaskRecurrence.monthly(interval: 2, dayOfMonth: 1);
        expect(recurrence2.description, equals('Every 2 months on day 1'));
      });

      test('should return correct description for yearly', () {
        final recurrence = TaskRecurrence.yearly(
          monthOfYear: 6,
          dayOfMonth: 15,
        );
        expect(recurrence.description, equals('Yearly on 15/06'));
      });
    });

    group('WeekDay enum', () {
      test('should have correct values', () {
        expect(WeekDay.monday.value, equals(1));
        expect(WeekDay.tuesday.value, equals(2));
        expect(WeekDay.wednesday.value, equals(3));
        expect(WeekDay.thursday.value, equals(4));
        expect(WeekDay.friday.value, equals(5));
        expect(WeekDay.saturday.value, equals(6));
        expect(WeekDay.sunday.value, equals(7));
      });
    });
  });
}
