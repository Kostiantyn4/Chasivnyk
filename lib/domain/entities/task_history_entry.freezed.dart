// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskHistoryEntry _$TaskHistoryEntryFromJson(Map<String, dynamic> json) {
  return _TaskHistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$TaskHistoryEntry {
  @TaskIdConverter()
  TaskId get id => throw _privateConstructorUsedError;
  @TaskIdConverter()
  TaskId get taskId => throw _privateConstructorUsedError;
  TaskHistoryAction get action => throw _privateConstructorUsedError;
  String? get oldValue => throw _privateConstructorUsedError;
  String? get newValue => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this TaskHistoryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskHistoryEntryCopyWith<TaskHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskHistoryEntryCopyWith<$Res> {
  factory $TaskHistoryEntryCopyWith(
          TaskHistoryEntry value, $Res Function(TaskHistoryEntry) then) =
      _$TaskHistoryEntryCopyWithImpl<$Res, TaskHistoryEntry>;
  @useResult
  $Res call(
      {@TaskIdConverter() TaskId id,
      @TaskIdConverter() TaskId taskId,
      TaskHistoryAction action,
      String? oldValue,
      String? newValue,
      String? description,
      DateTime timestamp,
      String? userId});
}

/// @nodoc
class _$TaskHistoryEntryCopyWithImpl<$Res, $Val extends TaskHistoryEntry>
    implements $TaskHistoryEntryCopyWith<$Res> {
  _$TaskHistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? action = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? description = freezed,
    Object? timestamp = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as TaskHistoryAction,
      oldValue: freezed == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      newValue: freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskHistoryEntryImplCopyWith<$Res>
    implements $TaskHistoryEntryCopyWith<$Res> {
  factory _$$TaskHistoryEntryImplCopyWith(_$TaskHistoryEntryImpl value,
          $Res Function(_$TaskHistoryEntryImpl) then) =
      __$$TaskHistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TaskIdConverter() TaskId id,
      @TaskIdConverter() TaskId taskId,
      TaskHistoryAction action,
      String? oldValue,
      String? newValue,
      String? description,
      DateTime timestamp,
      String? userId});
}

/// @nodoc
class __$$TaskHistoryEntryImplCopyWithImpl<$Res>
    extends _$TaskHistoryEntryCopyWithImpl<$Res, _$TaskHistoryEntryImpl>
    implements _$$TaskHistoryEntryImplCopyWith<$Res> {
  __$$TaskHistoryEntryImplCopyWithImpl(_$TaskHistoryEntryImpl _value,
      $Res Function(_$TaskHistoryEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? action = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? description = freezed,
    Object? timestamp = null,
    Object? userId = freezed,
  }) {
    return _then(_$TaskHistoryEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as TaskHistoryAction,
      oldValue: freezed == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      newValue: freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskHistoryEntryImpl implements _TaskHistoryEntry {
  const _$TaskHistoryEntryImpl(
      {@TaskIdConverter() required this.id,
      @TaskIdConverter() required this.taskId,
      required this.action,
      this.oldValue,
      this.newValue,
      this.description,
      required this.timestamp,
      this.userId});

  factory _$TaskHistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskHistoryEntryImplFromJson(json);

  @override
  @TaskIdConverter()
  final TaskId id;
  @override
  @TaskIdConverter()
  final TaskId taskId;
  @override
  final TaskHistoryAction action;
  @override
  final String? oldValue;
  @override
  final String? newValue;
  @override
  final String? description;
  @override
  final DateTime timestamp;
  @override
  final String? userId;

  @override
  String toString() {
    return 'TaskHistoryEntry(id: $id, taskId: $taskId, action: $action, oldValue: $oldValue, newValue: $newValue, description: $description, timestamp: $timestamp, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskHistoryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, taskId, action, oldValue,
      newValue, description, timestamp, userId);

  /// Create a copy of TaskHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskHistoryEntryImplCopyWith<_$TaskHistoryEntryImpl> get copyWith =>
      __$$TaskHistoryEntryImplCopyWithImpl<_$TaskHistoryEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskHistoryEntryImplToJson(
      this,
    );
  }
}

abstract class _TaskHistoryEntry implements TaskHistoryEntry {
  const factory _TaskHistoryEntry(
      {@TaskIdConverter() required final TaskId id,
      @TaskIdConverter() required final TaskId taskId,
      required final TaskHistoryAction action,
      final String? oldValue,
      final String? newValue,
      final String? description,
      required final DateTime timestamp,
      final String? userId}) = _$TaskHistoryEntryImpl;

  factory _TaskHistoryEntry.fromJson(Map<String, dynamic> json) =
      _$TaskHistoryEntryImpl.fromJson;

  @override
  @TaskIdConverter()
  TaskId get id;
  @override
  @TaskIdConverter()
  TaskId get taskId;
  @override
  TaskHistoryAction get action;
  @override
  String? get oldValue;
  @override
  String? get newValue;
  @override
  String? get description;
  @override
  DateTime get timestamp;
  @override
  String? get userId;

  /// Create a copy of TaskHistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskHistoryEntryImplCopyWith<_$TaskHistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
