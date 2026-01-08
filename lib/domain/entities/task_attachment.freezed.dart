// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskAttachment _$TaskAttachmentFromJson(Map<String, dynamic> json) {
  return _TaskAttachment.fromJson(json);
}

/// @nodoc
mixin _$TaskAttachment {
  @TaskIdConverter()
  TaskId get id => throw _privateConstructorUsedError;
  @TaskIdConverter()
  TaskId get taskId => throw _privateConstructorUsedError;
  @AttachmentFilenameConverter()
  AttachmentFilename get filename => throw _privateConstructorUsedError;
  @AttachmentPathConverter()
  AttachmentPath get path => throw _privateConstructorUsedError;
  @AttachmentTypeConverter()
  AttachmentType get type => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  @AttachmentSizeConverter()
  AttachmentSize? get size => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TaskAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskAttachmentCopyWith<TaskAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskAttachmentCopyWith<$Res> {
  factory $TaskAttachmentCopyWith(
    TaskAttachment value,
    $Res Function(TaskAttachment) then,
  ) = _$TaskAttachmentCopyWithImpl<$Res, TaskAttachment>;
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    @TaskIdConverter() TaskId taskId,
    @AttachmentFilenameConverter() AttachmentFilename filename,
    @AttachmentPathConverter() AttachmentPath path,
    @AttachmentTypeConverter() AttachmentType type,
    String? mimeType,
    @AttachmentSizeConverter() AttachmentSize? size,
    DateTime createdAt,
  });
}

/// @nodoc
class _$TaskAttachmentCopyWithImpl<$Res, $Val extends TaskAttachment>
    implements $TaskAttachmentCopyWith<$Res> {
  _$TaskAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? filename = null,
    Object? path = null,
    Object? type = null,
    Object? mimeType = freezed,
    Object? size = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as TaskId,
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as TaskId,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as AttachmentFilename,
            path: null == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as AttachmentPath,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AttachmentType,
            mimeType: freezed == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as AttachmentSize?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskAttachmentImplCopyWith<$Res>
    implements $TaskAttachmentCopyWith<$Res> {
  factory _$$TaskAttachmentImplCopyWith(
    _$TaskAttachmentImpl value,
    $Res Function(_$TaskAttachmentImpl) then,
  ) = __$$TaskAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TaskIdConverter() TaskId id,
    @TaskIdConverter() TaskId taskId,
    @AttachmentFilenameConverter() AttachmentFilename filename,
    @AttachmentPathConverter() AttachmentPath path,
    @AttachmentTypeConverter() AttachmentType type,
    String? mimeType,
    @AttachmentSizeConverter() AttachmentSize? size,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$TaskAttachmentImplCopyWithImpl<$Res>
    extends _$TaskAttachmentCopyWithImpl<$Res, _$TaskAttachmentImpl>
    implements _$$TaskAttachmentImplCopyWith<$Res> {
  __$$TaskAttachmentImplCopyWithImpl(
    _$TaskAttachmentImpl _value,
    $Res Function(_$TaskAttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? filename = null,
    Object? path = null,
    Object? type = null,
    Object? mimeType = freezed,
    Object? size = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$TaskAttachmentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as TaskId,
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as TaskId,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as AttachmentFilename,
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as AttachmentPath,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AttachmentType,
        mimeType: freezed == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as AttachmentSize?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskAttachmentImpl implements _TaskAttachment {
  const _$TaskAttachmentImpl({
    @TaskIdConverter() required this.id,
    @TaskIdConverter() required this.taskId,
    @AttachmentFilenameConverter() required this.filename,
    @AttachmentPathConverter() required this.path,
    @AttachmentTypeConverter() required this.type,
    this.mimeType,
    @AttachmentSizeConverter() this.size,
    required this.createdAt,
  });

  factory _$TaskAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskAttachmentImplFromJson(json);

  @override
  @TaskIdConverter()
  final TaskId id;
  @override
  @TaskIdConverter()
  final TaskId taskId;
  @override
  @AttachmentFilenameConverter()
  final AttachmentFilename filename;
  @override
  @AttachmentPathConverter()
  final AttachmentPath path;
  @override
  @AttachmentTypeConverter()
  final AttachmentType type;
  @override
  final String? mimeType;
  @override
  @AttachmentSizeConverter()
  final AttachmentSize? size;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TaskAttachment(id: $id, taskId: $taskId, filename: $filename, path: $path, type: $type, mimeType: $mimeType, size: $size, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskAttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    taskId,
    filename,
    path,
    type,
    mimeType,
    size,
    createdAt,
  );

  /// Create a copy of TaskAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskAttachmentImplCopyWith<_$TaskAttachmentImpl> get copyWith =>
      __$$TaskAttachmentImplCopyWithImpl<_$TaskAttachmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskAttachmentImplToJson(this);
  }
}

abstract class _TaskAttachment implements TaskAttachment {
  const factory _TaskAttachment({
    @TaskIdConverter() required final TaskId id,
    @TaskIdConverter() required final TaskId taskId,
    @AttachmentFilenameConverter() required final AttachmentFilename filename,
    @AttachmentPathConverter() required final AttachmentPath path,
    @AttachmentTypeConverter() required final AttachmentType type,
    final String? mimeType,
    @AttachmentSizeConverter() final AttachmentSize? size,
    required final DateTime createdAt,
  }) = _$TaskAttachmentImpl;

  factory _TaskAttachment.fromJson(Map<String, dynamic> json) =
      _$TaskAttachmentImpl.fromJson;

  @override
  @TaskIdConverter()
  TaskId get id;
  @override
  @TaskIdConverter()
  TaskId get taskId;
  @override
  @AttachmentFilenameConverter()
  AttachmentFilename get filename;
  @override
  @AttachmentPathConverter()
  AttachmentPath get path;
  @override
  @AttachmentTypeConverter()
  AttachmentType get type;
  @override
  String? get mimeType;
  @override
  @AttachmentSizeConverter()
  AttachmentSize? get size;
  @override
  DateTime get createdAt;

  /// Create a copy of TaskAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskAttachmentImplCopyWith<_$TaskAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
