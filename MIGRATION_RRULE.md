# Migration to RRULE-based Recurrence System

## Overview
Migrating from simple `TaskPeriod` enum to a flexible RRULE-based system that separates:
- **Duration** - how long a task is active for ("weekly plans", "yearly task")
- **Recurrence** - when/how a task repeats ("Mon-Wed-Fri", "weekly")

## Changes

### 1. Domain Layer

#### Value Objects (`task_value_objects.dart`)
**Before:**
```dart
enum TaskPeriod { daily, weekly, monthly, yearly }
```

**After:**
```dart
enum TaskDuration { day, week, month, quarter, year, custom }
class CustomDuration { int value; DurationUnit unit; }
enum DurationUnit { days, weeks, months, years }
```

#### Task Entity (`task.dart`)
**Before:**
```dart
Task({
  TaskPeriod? period,
  // ...
})
```

**After:**
```dart
Task({
  TaskDuration? duration,
  CustomDuration? customDuration,
  String? rrule,  // RFC 5545 RRULE
  DateTime? recurrenceEnd,
  // ...
})
```

### 2. Data Layer

#### Isar Entity (`task_entity.dart`)
**Before:**
```dart
int? period; // 0=daily, 1=weekly, 2=monthly, 3=yearly
```

**After:**
```dart
int? duration; // 0=day, 1=week, 2=month, 3=quarter, 4=year, 5=custom
String? customDurationJson; // {"value": 2, "unit": 1}
String? rrule; // "FREQ=WEEKLY;BYDAY=MO,WE,FR"
int? recurrenceEnd; // DateTime as milliseconds
```

#### Repository (`isar_task_repository.dart`)
- Remove `_mapPeriod()` and `_mapPeriodToInt()`
- Add `_mapDuration()` and `_mapDurationToInt()`
- Add RRULE string mapping (no conversion needed)
- Add CustomDuration JSON serialization

### 3. Dependencies

Added:
```yaml
dependencies:
  rrule: ^0.2.17  # RFC 5545 recurrence rules
```

## Examples

### Duration
```dart
// "Weekly plans"
Task.create(
  title: "Weekly plans",
  duration: TaskDuration.week,
)

// "2 months project"
Task.create(
  title: "Project",
  duration: TaskDuration.custom,
  customDuration: CustomDuration(value: 2, unit: DurationUnit.months),
)
```

### Recurrence
```dart
// "Training Mon-Wed-Fri"
Task.create(
  title: "Training",
  rrule: "FREQ=WEEKLY;BYDAY=MO,WE,FR",
)

// "Weekdays"
Task.create(
  title: "Work",
  rrule: "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR",
)

// "Every 2 weeks"
Task.create(
  title: "Meeting",
  rrule: "FREQ=WEEKLY;INTERVAL=2",
)
```

### Combination
```dart
// "Weekly report for 2 days"
Task.create(
  title: "Report",
  duration: TaskDuration.custom,
  customDuration: CustomDuration(value: 2, unit: DurationUnit.days),
  rrule: "FREQ=WEEKLY;BYDAY=FR",
)
```

## RRULE Usage

### Parsing
```dart
import 'package:rrule/rrule.dart';

final rule = RecurrenceRule.fromString('FREQ=WEEKLY;BYDAY=MO,WE,FR');
```

### Generating Occurrences
```dart
final occurrences = rule.getInstances(
  start: DateTime.now(),
  count: 10, // Next 10 occurrences
);
```

### Creating RRULE
```dart
final rule = RecurrenceRule(
  frequency: Frequency.weekly,
  byWeekDays: {
    ByWeekDayEntry(DateTime.monday),
    ByWeekDayEntry(DateTime.wednesday),
    ByWeekDayEntry(DateTime.friday),
  },
);
final rruleString = rule.toString(); // "FREQ=WEEKLY;BYDAY=MO,WE,FR"
```

## Migration Steps

1. ✅ Add `rrule` dependency
2. ✅ Update domain value objects
3. ✅ Update Task entity
4. ✅ Run build_runner
5. ✅ Update Isar entities
6. ✅ Update repository mapping
7. ✅ Update tests
8. ⏳ Update UI (future)

## Breaking Changes

- `TaskPeriod` enum removed → use `TaskDuration` + `rrule`
- `Task.period` field removed → use `Task.duration` + `Task.rrule`
- `TaskPeriodConverter` removed
- Repository mapping methods changed

## Testing

All existing tests need updates:
- Replace `period: TaskPeriod.weekly` with `duration: TaskDuration.week`
- Add new tests for RRULE functionality
- Test CustomDuration serialization

## UI (Future Work)

Create custom UI widgets for:
1. Duration picker (day/week/month/quarter/year/custom)
2. Recurrence picker (using rrule library)
   - Frequency dropdown
   - Days of week checkboxes
   - Interval input
   - End date picker

## Resources

- [rrule package](https://pub.dev/packages/rrule)
- [RFC 5545 (iCalendar)](https://tools.ietf.org/html/rfc5545)
- [RRULE examples](https://icalendar.org/iCalendar-RFC-5545/3-8-5-3-recurrence-rule.html)
