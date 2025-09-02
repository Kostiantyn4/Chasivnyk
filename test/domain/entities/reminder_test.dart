import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/task.dart';
import 'package:chasivnyk/domain/entities/reminder_extension.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('Reminder', () {
    test('should create reminder with repeat and notificationId', () {
      final time = DateTime.now().add(const Duration(days: 1));
      final reminder = Reminder.create(
        time: time,
        repeat: ReminderRepeat.daily,
        notificationId: 123,
      );

      expect(reminder.time, equals(time));
      expect(reminder.repeat, equals(ReminderRepeat.daily));
      expect(reminder.notificationId, equals(123));
      expect(reminder.isTriggered, isFalse);
    });

    test('should throw when creating reminder with past time', () {
      final pastTime = DateTime.now().subtract(const Duration(hours: 1));
      expect(
        () => Reminder.create(time: pastTime),
        throwsArgumentError,
      );
    });

    test('should serialize and deserialize with all fields', () {
      final time = DateTime.now().add(const Duration(days: 1));
      final reminder = Reminder(
        id: TaskId('test-id'),
        time: time,
        repeat: ReminderRepeat.weekly,
        notificationId: 456,
        isTriggered: true,
      );

      final json = reminder.toJson();
      final deserialized = Reminder.fromJson(json);

      expect(deserialized.id.value, equals('test-id'));
      expect(deserialized.time.toIso8601String(), equals(time.toIso8601String()));
      expect(deserialized.repeat, equals(ReminderRepeat.weekly));
      expect(deserialized.notificationId, equals(456));
      expect(deserialized.isTriggered, isTrue);
    });
  });

  group('ReminderX', () {
    test('getNextOccurrence should return original time for future non-repeating reminder', () {
      final time = DateTime.now().add(const Duration(days: 1));
      final reminder = Reminder.create(time: time);
      expect(reminder.getNextOccurrence(), equals(time));
    });

    test('getNextOccurrence should return next day for daily repeat', () {
      final now = DateTime.now();
      final yesterdayTime = DateTime(
        now.year,
        now.month,
        now.day - 1,
        10, // hour
        30, // minute
      );
      final reminder = Reminder(
        id: TaskId('test'),
        time: yesterdayTime,
        repeat: ReminderRepeat.daily,
      );

      final nextOccurrence = reminder.getNextOccurrence();
      expect(nextOccurrence.hour, equals(10));
      expect(nextOccurrence.minute, equals(30));
      expect(nextOccurrence.day, equals(now.day + 1));
    });

    test('getNextOccurrence should return next week for weekly repeat', () {
      final now = DateTime.now();
      final lastWeekTime = now.subtract(const Duration(days: 7));
      final reminder = Reminder(
        id: TaskId('test'),
        time: lastWeekTime,
        repeat: ReminderRepeat.weekly,
      );

      final nextOccurrence = reminder.getNextOccurrence();
      expect(
        nextOccurrence.difference(now).inDays,
        lessThanOrEqualTo(7),
      );
      expect(
        nextOccurrence.difference(now).inDays,
        greaterThan(0),
      );
    });

    test('getNextOccurrence should handle month transitions', () {
      final now = DateTime.now();
      final lastMonthTime = DateTime(
        now.year,
        now.month - 1,
        15, // day
        10, // hour
        30, // minute
      );
      final reminder = Reminder(
        id: TaskId('test'),
        time: lastMonthTime,
        repeat: ReminderRepeat.monthly,
      );

      final nextOccurrence = reminder.getNextOccurrence();
      expect(nextOccurrence.day, equals(15));
      expect(nextOccurrence.hour, equals(10));
      expect(nextOccurrence.minute, equals(30));
      expect(nextOccurrence.month, equals(now.month + 1));
    });

    test('isDue should be true for past non-repeating reminder', () {
      final now = DateTime.now();
      final reminder = Reminder(
        id: TaskId('test'),
        time: now.subtract(const Duration(minutes: 5)),
      );
      expect(reminder.isDue, isTrue);
    });

    test('isDue should be false for triggered non-repeating reminder', () {
      final now = DateTime.now();
      final reminder = Reminder(
        id: TaskId('test'),
        time: now.subtract(const Duration(minutes: 5)),
        isTriggered: true,
      );
      expect(reminder.isDue, isFalse);
    });

    test('isDue should be true for repeating reminder when next occurrence is in past', () {
      final now = DateTime.now();
      final reminder = Reminder(
        id: TaskId('test'),
        time: now.subtract(const Duration(days: 1)),
        repeat: ReminderRepeat.daily,
      );
      expect(reminder.isDue, isTrue);
    });

    test('trigger should update isTriggered for non-repeating reminder', () {
      final now = DateTime.now();
      final reminder = Reminder(
        id: TaskId('test'),
        time: now.subtract(const Duration(minutes: 5)),
      );
      final triggered = reminder.trigger();
      expect(triggered.isTriggered, isTrue);
      expect(triggered.time, equals(reminder.time));
    });

    test('trigger should update time for repeating reminder', () {
      final now = DateTime.now();
      final reminder = Reminder(
        id: TaskId('test'),
        time: now.subtract(const Duration(days: 1)),
        repeat: ReminderRepeat.daily,
      );
      final triggered = reminder.trigger();
      expect(triggered.isTriggered, isFalse);
      expect(triggered.time.day, equals(now.day + 1));
    });

    test('trigger should throw for non-due reminder', () {
      final reminder = Reminder.create(
        time: DateTime.now().add(const Duration(days: 1)),
      );
      expect(() => reminder.trigger(), throwsStateError);
    });
  });
}
