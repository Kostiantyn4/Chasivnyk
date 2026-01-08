// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_recurrence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskRecurrence _$TaskRecurrenceFromJson(Map<String, dynamic> json) {
  return _TaskRecurrence.fromJson(json);
}

/// @nodoc
mixin _$TaskRecurrence {
  RecurrenceType get type => throw _privateConstructorUsedError;
  int get interval =>
      throw _privateConstructorUsedError; // Every N days/weeks/months/years
  List<WeekDay> get weekDays =>
      throw _privateConstructorUsedError; // For weekly recurrence
  int get dayOfMonth =>
      throw _privateConstructorUsedError; // For monthly recurrence (1-31)
  int get monthOfYear =>
      throw _privateConstructorUsedError; // For yearly recurrence (1-12)
  DateTime? get endDate =>
      throw _privateConstructorUsedError; // When recurrence ends
  int get maxOccurrences =>
      throw _privateConstructorUsedError; // Max number of occurrences (0 = infinite)
  int get completedOccurrences => throw _privateConstructorUsedError;

  /// Serializes this TaskRecurrence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskRecurrence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskRecurrenceCopyWith<TaskRecurrence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskRecurrenceCopyWith<$Res> {
  factory $TaskRecurrenceCopyWith(
    TaskRecurrence value,
    $Res Function(TaskRecurrence) then,
  ) = _$TaskRecurrenceCopyWithImpl<$Res, TaskRecurrence>;
  @useResult
  $Res call({
    RecurrenceType type,
    int interval,
    List<WeekDay> weekDays,
    int dayOfMonth,
    int monthOfYear,
    DateTime? endDate,
    int maxOccurrences,
    int completedOccurrences,
  });
}

/// @nodoc
class _$TaskRecurrenceCopyWithImpl<$Res, $Val extends TaskRecurrence>
    implements $TaskRecurrenceCopyWith<$Res> {
  _$TaskRecurrenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskRecurrence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interval = null,
    Object? weekDays = null,
    Object? dayOfMonth = null,
    Object? monthOfYear = null,
    Object? endDate = freezed,
    Object? maxOccurrences = null,
    Object? completedOccurrences = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as RecurrenceType,
            interval: null == interval
                ? _value.interval
                : interval // ignore: cast_nullable_to_non_nullable
                      as int,
            weekDays: null == weekDays
                ? _value.weekDays
                : weekDays // ignore: cast_nullable_to_non_nullable
                      as List<WeekDay>,
            dayOfMonth: null == dayOfMonth
                ? _value.dayOfMonth
                : dayOfMonth // ignore: cast_nullable_to_non_nullable
                      as int,
            monthOfYear: null == monthOfYear
                ? _value.monthOfYear
                : monthOfYear // ignore: cast_nullable_to_non_nullable
                      as int,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            maxOccurrences: null == maxOccurrences
                ? _value.maxOccurrences
                : maxOccurrences // ignore: cast_nullable_to_non_nullable
                      as int,
            completedOccurrences: null == completedOccurrences
                ? _value.completedOccurrences
                : completedOccurrences // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskRecurrenceImplCopyWith<$Res>
    implements $TaskRecurrenceCopyWith<$Res> {
  factory _$$TaskRecurrenceImplCopyWith(
    _$TaskRecurrenceImpl value,
    $Res Function(_$TaskRecurrenceImpl) then,
  ) = __$$TaskRecurrenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    RecurrenceType type,
    int interval,
    List<WeekDay> weekDays,
    int dayOfMonth,
    int monthOfYear,
    DateTime? endDate,
    int maxOccurrences,
    int completedOccurrences,
  });
}

/// @nodoc
class __$$TaskRecurrenceImplCopyWithImpl<$Res>
    extends _$TaskRecurrenceCopyWithImpl<$Res, _$TaskRecurrenceImpl>
    implements _$$TaskRecurrenceImplCopyWith<$Res> {
  __$$TaskRecurrenceImplCopyWithImpl(
    _$TaskRecurrenceImpl _value,
    $Res Function(_$TaskRecurrenceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskRecurrence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? interval = null,
    Object? weekDays = null,
    Object? dayOfMonth = null,
    Object? monthOfYear = null,
    Object? endDate = freezed,
    Object? maxOccurrences = null,
    Object? completedOccurrences = null,
  }) {
    return _then(
      _$TaskRecurrenceImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as RecurrenceType,
        interval: null == interval
            ? _value.interval
            : interval // ignore: cast_nullable_to_non_nullable
                  as int,
        weekDays: null == weekDays
            ? _value._weekDays
            : weekDays // ignore: cast_nullable_to_non_nullable
                  as List<WeekDay>,
        dayOfMonth: null == dayOfMonth
            ? _value.dayOfMonth
            : dayOfMonth // ignore: cast_nullable_to_non_nullable
                  as int,
        monthOfYear: null == monthOfYear
            ? _value.monthOfYear
            : monthOfYear // ignore: cast_nullable_to_non_nullable
                  as int,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        maxOccurrences: null == maxOccurrences
            ? _value.maxOccurrences
            : maxOccurrences // ignore: cast_nullable_to_non_nullable
                  as int,
        completedOccurrences: null == completedOccurrences
            ? _value.completedOccurrences
            : completedOccurrences // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskRecurrenceImpl implements _TaskRecurrence {
  const _$TaskRecurrenceImpl({
    this.type = RecurrenceType.none,
    this.interval = 1,
    final List<WeekDay> weekDays = const [],
    this.dayOfMonth = 1,
    this.monthOfYear = 1,
    this.endDate,
    this.maxOccurrences = 0,
    this.completedOccurrences = 0,
  }) : _weekDays = weekDays;

  factory _$TaskRecurrenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskRecurrenceImplFromJson(json);

  @override
  @JsonKey()
  final RecurrenceType type;
  @override
  @JsonKey()
  final int interval;
  // Every N days/weeks/months/years
  final List<WeekDay> _weekDays;
  // Every N days/weeks/months/years
  @override
  @JsonKey()
  List<WeekDay> get weekDays {
    if (_weekDays is EqualUnmodifiableListView) return _weekDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekDays);
  }

  // For weekly recurrence
  @override
  @JsonKey()
  final int dayOfMonth;
  // For monthly recurrence (1-31)
  @override
  @JsonKey()
  final int monthOfYear;
  // For yearly recurrence (1-12)
  @override
  final DateTime? endDate;
  // When recurrence ends
  @override
  @JsonKey()
  final int maxOccurrences;
  // Max number of occurrences (0 = infinite)
  @override
  @JsonKey()
  final int completedOccurrences;

  @override
  String toString() {
    return 'TaskRecurrence(type: $type, interval: $interval, weekDays: $weekDays, dayOfMonth: $dayOfMonth, monthOfYear: $monthOfYear, endDate: $endDate, maxOccurrences: $maxOccurrences, completedOccurrences: $completedOccurrences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskRecurrenceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            const DeepCollectionEquality().equals(other._weekDays, _weekDays) &&
            (identical(other.dayOfMonth, dayOfMonth) ||
                other.dayOfMonth == dayOfMonth) &&
            (identical(other.monthOfYear, monthOfYear) ||
                other.monthOfYear == monthOfYear) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.maxOccurrences, maxOccurrences) ||
                other.maxOccurrences == maxOccurrences) &&
            (identical(other.completedOccurrences, completedOccurrences) ||
                other.completedOccurrences == completedOccurrences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    interval,
    const DeepCollectionEquality().hash(_weekDays),
    dayOfMonth,
    monthOfYear,
    endDate,
    maxOccurrences,
    completedOccurrences,
  );

  /// Create a copy of TaskRecurrence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskRecurrenceImplCopyWith<_$TaskRecurrenceImpl> get copyWith =>
      __$$TaskRecurrenceImplCopyWithImpl<_$TaskRecurrenceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskRecurrenceImplToJson(this);
  }
}

abstract class _TaskRecurrence implements TaskRecurrence {
  const factory _TaskRecurrence({
    final RecurrenceType type,
    final int interval,
    final List<WeekDay> weekDays,
    final int dayOfMonth,
    final int monthOfYear,
    final DateTime? endDate,
    final int maxOccurrences,
    final int completedOccurrences,
  }) = _$TaskRecurrenceImpl;

  factory _TaskRecurrence.fromJson(Map<String, dynamic> json) =
      _$TaskRecurrenceImpl.fromJson;

  @override
  RecurrenceType get type;
  @override
  int get interval; // Every N days/weeks/months/years
  @override
  List<WeekDay> get weekDays; // For weekly recurrence
  @override
  int get dayOfMonth; // For monthly recurrence (1-31)
  @override
  int get monthOfYear; // For yearly recurrence (1-12)
  @override
  DateTime? get endDate; // When recurrence ends
  @override
  int get maxOccurrences; // Max number of occurrences (0 = infinite)
  @override
  int get completedOccurrences;

  /// Create a copy of TaskRecurrence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskRecurrenceImplCopyWith<_$TaskRecurrenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
