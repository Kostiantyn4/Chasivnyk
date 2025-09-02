// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskComment _$TaskCommentFromJson(Map<String, dynamic> json) {
  return _TaskComment.fromJson(json);
}

/// @nodoc
mixin _$TaskComment {
  @TaskIdConverter()
  TaskId get id => throw _privateConstructorUsedError;
  @TaskIdConverter()
  TaskId get taskId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get editedAt => throw _privateConstructorUsedError;

  /// Serializes this TaskComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCommentCopyWith<TaskComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCommentCopyWith<$Res> {
  factory $TaskCommentCopyWith(
          TaskComment value, $Res Function(TaskComment) then) =
      _$TaskCommentCopyWithImpl<$Res, TaskComment>;
  @useResult
  $Res call(
      {@TaskIdConverter() TaskId id,
      @TaskIdConverter() TaskId taskId,
      String authorId,
      String content,
      DateTime createdAt,
      DateTime? editedAt});
}

/// @nodoc
class _$TaskCommentCopyWithImpl<$Res, $Val extends TaskComment>
    implements $TaskCommentCopyWith<$Res> {
  _$TaskCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? authorId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? editedAt = freezed,
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
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskCommentImplCopyWith<$Res>
    implements $TaskCommentCopyWith<$Res> {
  factory _$$TaskCommentImplCopyWith(
          _$TaskCommentImpl value, $Res Function(_$TaskCommentImpl) then) =
      __$$TaskCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TaskIdConverter() TaskId id,
      @TaskIdConverter() TaskId taskId,
      String authorId,
      String content,
      DateTime createdAt,
      DateTime? editedAt});
}

/// @nodoc
class __$$TaskCommentImplCopyWithImpl<$Res>
    extends _$TaskCommentCopyWithImpl<$Res, _$TaskCommentImpl>
    implements _$$TaskCommentImplCopyWith<$Res> {
  __$$TaskCommentImplCopyWithImpl(
      _$TaskCommentImpl _value, $Res Function(_$TaskCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? authorId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? editedAt = freezed,
  }) {
    return _then(_$TaskCommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskCommentImpl extends _TaskComment {
  const _$TaskCommentImpl(
      {@TaskIdConverter() required this.id,
      @TaskIdConverter() required this.taskId,
      required this.authorId,
      required this.content,
      required this.createdAt,
      this.editedAt})
      : super._();

  factory _$TaskCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskCommentImplFromJson(json);

  @override
  @TaskIdConverter()
  final TaskId id;
  @override
  @TaskIdConverter()
  final TaskId taskId;
  @override
  final String authorId;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime? editedAt;

  @override
  String toString() {
    return 'TaskComment(id: $id, taskId: $taskId, authorId: $authorId, content: $content, createdAt: $createdAt, editedAt: $editedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, taskId, authorId, content, createdAt, editedAt);

  /// Create a copy of TaskComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskCommentImplCopyWith<_$TaskCommentImpl> get copyWith =>
      __$$TaskCommentImplCopyWithImpl<_$TaskCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskCommentImplToJson(
      this,
    );
  }
}

abstract class _TaskComment extends TaskComment {
  const factory _TaskComment(
      {@TaskIdConverter() required final TaskId id,
      @TaskIdConverter() required final TaskId taskId,
      required final String authorId,
      required final String content,
      required final DateTime createdAt,
      final DateTime? editedAt}) = _$TaskCommentImpl;
  const _TaskComment._() : super._();

  factory _TaskComment.fromJson(Map<String, dynamic> json) =
      _$TaskCommentImpl.fromJson;

  @override
  @TaskIdConverter()
  TaskId get id;
  @override
  @TaskIdConverter()
  TaskId get taskId;
  @override
  String get authorId;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime? get editedAt;

  /// Create a copy of TaskComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskCommentImplCopyWith<_$TaskCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
