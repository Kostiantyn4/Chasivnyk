// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @TaskIdConverter()
  TaskId get id => throw _privateConstructorUsedError;
  @TaskTitleConverter()
  TaskTitle get title => throw _privateConstructorUsedError;
  @TaskDescriptionConverter()
  TaskDescription? get description => throw _privateConstructorUsedError;
  DateTime? get dueDate =>
      throw _privateConstructorUsedError; // Duration - how long the task is active for
  TaskDuration? get duration => throw _privateConstructorUsedError;
  CustomDuration? get customDuration =>
      throw _privateConstructorUsedError; // When duration == TaskDuration.custom
  // Recurrence - when/how the task repeats (RFC 5545 RRULE)
  String? get rrule =>
      throw _privateConstructorUsedError; // e.g., "FREQ=WEEKLY;BYDAY=MO,WE,FR"
  DateTime? get recurrenceEnd =>
      throw _privateConstructorUsedError; // When to stop repeating
  List<Reminder> get reminders => throw _privateConstructorUsedError;
  List<Subtask> get subtasks => throw _privateConstructorUsedError;
  @TaskTagConverter()
  List<TaskTag> get tags => throw _privateConstructorUsedError;
  @ProjectIdConverter()
  ProjectId? get projectId => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  @TaskPriorityConverter()
  TaskPriority get priority => throw _privateConstructorUsedError;
  List<TaskComment> get comments => throw _privateConstructorUsedError;
  List<TaskAttachment> get attachments => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    @TaskTitleConverter() TaskTitle title,
    @TaskDescriptionConverter() TaskDescription? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    List<Reminder> reminders,
    List<Subtask> subtasks,
    @TaskTagConverter() List<TaskTag> tags,
    @ProjectIdConverter() ProjectId? projectId,
    TaskStatus status,
    @TaskPriorityConverter() TaskPriority priority,
    List<TaskComment> comments,
    List<TaskAttachment> attachments,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? duration = freezed,
    Object? customDuration = freezed,
    Object? rrule = freezed,
    Object? recurrenceEnd = freezed,
    Object? reminders = null,
    Object? subtasks = null,
    Object? tags = null,
    Object? projectId = freezed,
    Object? status = null,
    Object? priority = null,
    Object? comments = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as TaskId,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as TaskTitle,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as TaskDescription?,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as TaskDuration?,
            customDuration: freezed == customDuration
                ? _value.customDuration
                : customDuration // ignore: cast_nullable_to_non_nullable
                      as CustomDuration?,
            rrule: freezed == rrule
                ? _value.rrule
                : rrule // ignore: cast_nullable_to_non_nullable
                      as String?,
            recurrenceEnd: freezed == recurrenceEnd
                ? _value.recurrenceEnd
                : recurrenceEnd // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            reminders: null == reminders
                ? _value.reminders
                : reminders // ignore: cast_nullable_to_non_nullable
                      as List<Reminder>,
            subtasks: null == subtasks
                ? _value.subtasks
                : subtasks // ignore: cast_nullable_to_non_nullable
                      as List<Subtask>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<TaskTag>,
            projectId: freezed == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as ProjectId?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as TaskPriority,
            comments: null == comments
                ? _value.comments
                : comments // ignore: cast_nullable_to_non_nullable
                      as List<TaskComment>,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<TaskAttachment>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    @TaskTitleConverter() TaskTitle title,
    @TaskDescriptionConverter() TaskDescription? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    List<Reminder> reminders,
    List<Subtask> subtasks,
    @TaskTagConverter() List<TaskTag> tags,
    @ProjectIdConverter() ProjectId? projectId,
    TaskStatus status,
    @TaskPriorityConverter() TaskPriority priority,
    List<TaskComment> comments,
    List<TaskAttachment> attachments,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
    : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? duration = freezed,
    Object? customDuration = freezed,
    Object? rrule = freezed,
    Object? recurrenceEnd = freezed,
    Object? reminders = null,
    Object? subtasks = null,
    Object? tags = null,
    Object? projectId = freezed,
    Object? status = null,
    Object? priority = null,
    Object? comments = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$TaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as TaskId,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as TaskTitle,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as TaskDescription?,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as TaskDuration?,
        customDuration: freezed == customDuration
            ? _value.customDuration
            : customDuration // ignore: cast_nullable_to_non_nullable
                  as CustomDuration?,
        rrule: freezed == rrule
            ? _value.rrule
            : rrule // ignore: cast_nullable_to_non_nullable
                  as String?,
        recurrenceEnd: freezed == recurrenceEnd
            ? _value.recurrenceEnd
            : recurrenceEnd // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        reminders: null == reminders
            ? _value._reminders
            : reminders // ignore: cast_nullable_to_non_nullable
                  as List<Reminder>,
        subtasks: null == subtasks
            ? _value._subtasks
            : subtasks // ignore: cast_nullable_to_non_nullable
                  as List<Subtask>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<TaskTag>,
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as ProjectId?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as TaskPriority,
        comments: null == comments
            ? _value._comments
            : comments // ignore: cast_nullable_to_non_nullable
                  as List<TaskComment>,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<TaskAttachment>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({
    @TaskIdConverter() required this.id,
    @TaskTitleConverter() required this.title,
    @TaskDescriptionConverter() this.description,
    this.dueDate,
    this.duration,
    this.customDuration,
    this.rrule,
    this.recurrenceEnd,
    final List<Reminder> reminders = const [],
    final List<Subtask> subtasks = const [],
    @TaskTagConverter() final List<TaskTag> tags = const [],
    @ProjectIdConverter() this.projectId,
    this.status = TaskStatus.active,
    @TaskPriorityConverter() this.priority = TaskPriority.medium,
    final List<TaskComment> comments = const [],
    final List<TaskAttachment> attachments = const [],
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
  }) : _reminders = reminders,
       _subtasks = subtasks,
       _tags = tags,
       _comments = comments,
       _attachments = attachments;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @TaskIdConverter()
  final TaskId id;
  @override
  @TaskTitleConverter()
  final TaskTitle title;
  @override
  @TaskDescriptionConverter()
  final TaskDescription? description;
  @override
  final DateTime? dueDate;
  // Duration - how long the task is active for
  @override
  final TaskDuration? duration;
  @override
  final CustomDuration? customDuration;
  // When duration == TaskDuration.custom
  // Recurrence - when/how the task repeats (RFC 5545 RRULE)
  @override
  final String? rrule;
  // e.g., "FREQ=WEEKLY;BYDAY=MO,WE,FR"
  @override
  final DateTime? recurrenceEnd;
  // When to stop repeating
  final List<Reminder> _reminders;
  // When to stop repeating
  @override
  @JsonKey()
  List<Reminder> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  final List<Subtask> _subtasks;
  @override
  @JsonKey()
  List<Subtask> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  final List<TaskTag> _tags;
  @override
  @JsonKey()
  @TaskTagConverter()
  List<TaskTag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @ProjectIdConverter()
  final ProjectId? projectId;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  @JsonKey()
  @TaskPriorityConverter()
  final TaskPriority priority;
  final List<TaskComment> _comments;
  @override
  @JsonKey()
  List<TaskComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<TaskAttachment> _attachments;
  @override
  @JsonKey()
  List<TaskAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, dueDate: $dueDate, duration: $duration, customDuration: $customDuration, rrule: $rrule, recurrenceEnd: $recurrenceEnd, reminders: $reminders, subtasks: $subtasks, tags: $tags, projectId: $projectId, status: $status, priority: $priority, comments: $comments, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.customDuration, customDuration) ||
                other.customDuration == customDuration) &&
            (identical(other.rrule, rrule) || other.rrule == rrule) &&
            (identical(other.recurrenceEnd, recurrenceEnd) ||
                other.recurrenceEnd == recurrenceEnd) &&
            const DeepCollectionEquality().equals(
              other._reminders,
              _reminders,
            ) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    description,
    dueDate,
    duration,
    customDuration,
    rrule,
    recurrenceEnd,
    const DeepCollectionEquality().hash(_reminders),
    const DeepCollectionEquality().hash(_subtasks),
    const DeepCollectionEquality().hash(_tags),
    projectId,
    status,
    priority,
    const DeepCollectionEquality().hash(_comments),
    const DeepCollectionEquality().hash(_attachments),
    createdAt,
    updatedAt,
    completedAt,
  ]);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task({
    @TaskIdConverter() required final TaskId id,
    @TaskTitleConverter() required final TaskTitle title,
    @TaskDescriptionConverter() final TaskDescription? description,
    final DateTime? dueDate,
    final TaskDuration? duration,
    final CustomDuration? customDuration,
    final String? rrule,
    final DateTime? recurrenceEnd,
    final List<Reminder> reminders,
    final List<Subtask> subtasks,
    @TaskTagConverter() final List<TaskTag> tags,
    @ProjectIdConverter() final ProjectId? projectId,
    final TaskStatus status,
    @TaskPriorityConverter() final TaskPriority priority,
    final List<TaskComment> comments,
    final List<TaskAttachment> attachments,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? completedAt,
  }) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  @TaskIdConverter()
  TaskId get id;
  @override
  @TaskTitleConverter()
  TaskTitle get title;
  @override
  @TaskDescriptionConverter()
  TaskDescription? get description;
  @override
  DateTime? get dueDate; // Duration - how long the task is active for
  @override
  TaskDuration? get duration;
  @override
  CustomDuration? get customDuration; // When duration == TaskDuration.custom
  // Recurrence - when/how the task repeats (RFC 5545 RRULE)
  @override
  String? get rrule; // e.g., "FREQ=WEEKLY;BYDAY=MO,WE,FR"
  @override
  DateTime? get recurrenceEnd; // When to stop repeating
  @override
  List<Reminder> get reminders;
  @override
  List<Subtask> get subtasks;
  @override
  @TaskTagConverter()
  List<TaskTag> get tags;
  @override
  @ProjectIdConverter()
  ProjectId? get projectId;
  @override
  TaskStatus get status;
  @override
  @TaskPriorityConverter()
  TaskPriority get priority;
  @override
  List<TaskComment> get comments;
  @override
  List<TaskAttachment> get attachments;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get completedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subtask _$SubtaskFromJson(Map<String, dynamic> json) {
  return _Subtask.fromJson(json);
}

/// @nodoc
mixin _$Subtask {
  @TaskIdConverter()
  TaskId get id => throw _privateConstructorUsedError;
  @TaskTitleConverter()
  TaskTitle get title => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  /// Serializes this Subtask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskCopyWith<Subtask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskCopyWith<$Res> {
  factory $SubtaskCopyWith(Subtask value, $Res Function(Subtask) then) =
      _$SubtaskCopyWithImpl<$Res, Subtask>;
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    @TaskTitleConverter() TaskTitle title,
    bool isDone,
  });
}

/// @nodoc
class _$SubtaskCopyWithImpl<$Res, $Val extends Subtask>
    implements $SubtaskCopyWith<$Res> {
  _$SubtaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? title = null, Object? isDone = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as TaskId,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as TaskTitle,
            isDone: null == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubtaskImplCopyWith<$Res> implements $SubtaskCopyWith<$Res> {
  factory _$$SubtaskImplCopyWith(
    _$SubtaskImpl value,
    $Res Function(_$SubtaskImpl) then,
  ) = __$$SubtaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    @TaskTitleConverter() TaskTitle title,
    bool isDone,
  });
}

/// @nodoc
class __$$SubtaskImplCopyWithImpl<$Res>
    extends _$SubtaskCopyWithImpl<$Res, _$SubtaskImpl>
    implements _$$SubtaskImplCopyWith<$Res> {
  __$$SubtaskImplCopyWithImpl(
    _$SubtaskImpl _value,
    $Res Function(_$SubtaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? title = null, Object? isDone = null}) {
    return _then(
      _$SubtaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as TaskId,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as TaskTitle,
        isDone: null == isDone
            ? _value.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskImpl implements _Subtask {
  const _$SubtaskImpl({
    @TaskIdConverter() required this.id,
    @TaskTitleConverter() required this.title,
    this.isDone = false,
  });

  factory _$SubtaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskImplFromJson(json);

  @override
  @TaskIdConverter()
  final TaskId id;
  @override
  @TaskTitleConverter()
  final TaskTitle title;
  @override
  @JsonKey()
  final bool isDone;

  @override
  String toString() {
    return 'Subtask(id: $id, title: $title, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isDone);

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskImplCopyWith<_$SubtaskImpl> get copyWith =>
      __$$SubtaskImplCopyWithImpl<_$SubtaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskImplToJson(this);
  }
}

abstract class _Subtask implements Subtask {
  const factory _Subtask({
    @TaskIdConverter() required final TaskId id,
    @TaskTitleConverter() required final TaskTitle title,
    final bool isDone,
  }) = _$SubtaskImpl;

  factory _Subtask.fromJson(Map<String, dynamic> json) = _$SubtaskImpl.fromJson;

  @override
  @TaskIdConverter()
  TaskId get id;
  @override
  @TaskTitleConverter()
  TaskTitle get title;
  @override
  bool get isDone;

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskImplCopyWith<_$SubtaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  @TaskIdConverter()
  TaskId get id => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  bool get isTriggered => throw _privateConstructorUsedError;
  @ReminderRepeatConverter()
  ReminderRepeat get repeat => throw _privateConstructorUsedError;
  int? get notificationId => throw _privateConstructorUsedError;

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    DateTime time,
    bool isTriggered,
    @ReminderRepeatConverter() ReminderRepeat repeat,
    int? notificationId,
  });
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? isTriggered = null,
    Object? repeat = null,
    Object? notificationId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as TaskId,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isTriggered: null == isTriggered
                ? _value.isTriggered
                : isTriggered // ignore: cast_nullable_to_non_nullable
                      as bool,
            repeat: null == repeat
                ? _value.repeat
                : repeat // ignore: cast_nullable_to_non_nullable
                      as ReminderRepeat,
            notificationId: freezed == notificationId
                ? _value.notificationId
                : notificationId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
    _$ReminderImpl value,
    $Res Function(_$ReminderImpl) then,
  ) = __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    DateTime time,
    bool isTriggered,
    @ReminderRepeatConverter() ReminderRepeat repeat,
    int? notificationId,
  });
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
    _$ReminderImpl _value,
    $Res Function(_$ReminderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? isTriggered = null,
    Object? repeat = null,
    Object? notificationId = freezed,
  }) {
    return _then(
      _$ReminderImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as TaskId,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isTriggered: null == isTriggered
            ? _value.isTriggered
            : isTriggered // ignore: cast_nullable_to_non_nullable
                  as bool,
        repeat: null == repeat
            ? _value.repeat
            : repeat // ignore: cast_nullable_to_non_nullable
                  as ReminderRepeat,
        notificationId: freezed == notificationId
            ? _value.notificationId
            : notificationId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderImpl implements _Reminder {
  const _$ReminderImpl({
    @TaskIdConverter() required this.id,
    required this.time,
    this.isTriggered = false,
    @ReminderRepeatConverter() this.repeat = ReminderRepeat.none,
    this.notificationId,
  });

  factory _$ReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderImplFromJson(json);

  @override
  @TaskIdConverter()
  final TaskId id;
  @override
  final DateTime time;
  @override
  @JsonKey()
  final bool isTriggered;
  @override
  @JsonKey()
  @ReminderRepeatConverter()
  final ReminderRepeat repeat;
  @override
  final int? notificationId;

  @override
  String toString() {
    return 'Reminder(id: $id, time: $time, isTriggered: $isTriggered, repeat: $repeat, notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.isTriggered, isTriggered) ||
                other.isTriggered == isTriggered) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, time, isTriggered, repeat, notificationId);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderImplToJson(this);
  }
}

abstract class _Reminder implements Reminder {
  const factory _Reminder({
    @TaskIdConverter() required final TaskId id,
    required final DateTime time,
    final bool isTriggered,
    @ReminderRepeatConverter() final ReminderRepeat repeat,
    final int? notificationId,
  }) = _$ReminderImpl;

  factory _Reminder.fromJson(Map<String, dynamic> json) =
      _$ReminderImpl.fromJson;

  @override
  @TaskIdConverter()
  TaskId get id;
  @override
  DateTime get time;
  @override
  bool get isTriggered;
  @override
  @ReminderRepeatConverter()
  ReminderRepeat get repeat;
  @override
  int? get notificationId;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
