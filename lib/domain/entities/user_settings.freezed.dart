// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  String get userId => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @TaskPriorityConverter()
  TaskPriority get defaultTaskPriority => throw _privateConstructorUsedError;
  DateFormat get dateFormat => throw _privateConstructorUsedError;
  TimeFormat get timeFormat => throw _privateConstructorUsedError;
  bool get showCompletedTasks => throw _privateConstructorUsedError;
  bool get enableNotifications => throw _privateConstructorUsedError;
  int get defaultReminderMinutes => throw _privateConstructorUsedError;
  int get autoArchiveCompletedDays => throw _privateConstructorUsedError;
  bool get enableDarkCalendar => throw _privateConstructorUsedError;
  bool get showWeekNumbers => throw _privateConstructorUsedError;
  int get weekStartDay =>
      throw _privateConstructorUsedError; // 1 = Monday, 7 = Sunday
  String get defaultProjectId => throw _privateConstructorUsedError;
  List<String> get pinnedProjectIds => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
    UserSettings value,
    $Res Function(UserSettings) then,
  ) = _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call({
    String userId,
    String language,
    ThemeMode themeMode,
    @TaskPriorityConverter() TaskPriority defaultTaskPriority,
    DateFormat dateFormat,
    TimeFormat timeFormat,
    bool showCompletedTasks,
    bool enableNotifications,
    int defaultReminderMinutes,
    int autoArchiveCompletedDays,
    bool enableDarkCalendar,
    bool showWeekNumbers,
    int weekStartDay,
    String defaultProjectId,
    List<String> pinnedProjectIds,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? language = null,
    Object? themeMode = null,
    Object? defaultTaskPriority = null,
    Object? dateFormat = null,
    Object? timeFormat = null,
    Object? showCompletedTasks = null,
    Object? enableNotifications = null,
    Object? defaultReminderMinutes = null,
    Object? autoArchiveCompletedDays = null,
    Object? enableDarkCalendar = null,
    Object? showWeekNumbers = null,
    Object? weekStartDay = null,
    Object? defaultProjectId = null,
    Object? pinnedProjectIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as ThemeMode,
            defaultTaskPriority: null == defaultTaskPriority
                ? _value.defaultTaskPriority
                : defaultTaskPriority // ignore: cast_nullable_to_non_nullable
                      as TaskPriority,
            dateFormat: null == dateFormat
                ? _value.dateFormat
                : dateFormat // ignore: cast_nullable_to_non_nullable
                      as DateFormat,
            timeFormat: null == timeFormat
                ? _value.timeFormat
                : timeFormat // ignore: cast_nullable_to_non_nullable
                      as TimeFormat,
            showCompletedTasks: null == showCompletedTasks
                ? _value.showCompletedTasks
                : showCompletedTasks // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableNotifications: null == enableNotifications
                ? _value.enableNotifications
                : enableNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            defaultReminderMinutes: null == defaultReminderMinutes
                ? _value.defaultReminderMinutes
                : defaultReminderMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            autoArchiveCompletedDays: null == autoArchiveCompletedDays
                ? _value.autoArchiveCompletedDays
                : autoArchiveCompletedDays // ignore: cast_nullable_to_non_nullable
                      as int,
            enableDarkCalendar: null == enableDarkCalendar
                ? _value.enableDarkCalendar
                : enableDarkCalendar // ignore: cast_nullable_to_non_nullable
                      as bool,
            showWeekNumbers: null == showWeekNumbers
                ? _value.showWeekNumbers
                : showWeekNumbers // ignore: cast_nullable_to_non_nullable
                      as bool,
            weekStartDay: null == weekStartDay
                ? _value.weekStartDay
                : weekStartDay // ignore: cast_nullable_to_non_nullable
                      as int,
            defaultProjectId: null == defaultProjectId
                ? _value.defaultProjectId
                : defaultProjectId // ignore: cast_nullable_to_non_nullable
                      as String,
            pinnedProjectIds: null == pinnedProjectIds
                ? _value.pinnedProjectIds
                : pinnedProjectIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
    _$UserSettingsImpl value,
    $Res Function(_$UserSettingsImpl) then,
  ) = __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String language,
    ThemeMode themeMode,
    @TaskPriorityConverter() TaskPriority defaultTaskPriority,
    DateFormat dateFormat,
    TimeFormat timeFormat,
    bool showCompletedTasks,
    bool enableNotifications,
    int defaultReminderMinutes,
    int autoArchiveCompletedDays,
    bool enableDarkCalendar,
    bool showWeekNumbers,
    int weekStartDay,
    String defaultProjectId,
    List<String> pinnedProjectIds,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
    _$UserSettingsImpl _value,
    $Res Function(_$UserSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? language = null,
    Object? themeMode = null,
    Object? defaultTaskPriority = null,
    Object? dateFormat = null,
    Object? timeFormat = null,
    Object? showCompletedTasks = null,
    Object? enableNotifications = null,
    Object? defaultReminderMinutes = null,
    Object? autoArchiveCompletedDays = null,
    Object? enableDarkCalendar = null,
    Object? showWeekNumbers = null,
    Object? weekStartDay = null,
    Object? defaultProjectId = null,
    Object? pinnedProjectIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$UserSettingsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeMode,
        defaultTaskPriority: null == defaultTaskPriority
            ? _value.defaultTaskPriority
            : defaultTaskPriority // ignore: cast_nullable_to_non_nullable
                  as TaskPriority,
        dateFormat: null == dateFormat
            ? _value.dateFormat
            : dateFormat // ignore: cast_nullable_to_non_nullable
                  as DateFormat,
        timeFormat: null == timeFormat
            ? _value.timeFormat
            : timeFormat // ignore: cast_nullable_to_non_nullable
                  as TimeFormat,
        showCompletedTasks: null == showCompletedTasks
            ? _value.showCompletedTasks
            : showCompletedTasks // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableNotifications: null == enableNotifications
            ? _value.enableNotifications
            : enableNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        defaultReminderMinutes: null == defaultReminderMinutes
            ? _value.defaultReminderMinutes
            : defaultReminderMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        autoArchiveCompletedDays: null == autoArchiveCompletedDays
            ? _value.autoArchiveCompletedDays
            : autoArchiveCompletedDays // ignore: cast_nullable_to_non_nullable
                  as int,
        enableDarkCalendar: null == enableDarkCalendar
            ? _value.enableDarkCalendar
            : enableDarkCalendar // ignore: cast_nullable_to_non_nullable
                  as bool,
        showWeekNumbers: null == showWeekNumbers
            ? _value.showWeekNumbers
            : showWeekNumbers // ignore: cast_nullable_to_non_nullable
                  as bool,
        weekStartDay: null == weekStartDay
            ? _value.weekStartDay
            : weekStartDay // ignore: cast_nullable_to_non_nullable
                  as int,
        defaultProjectId: null == defaultProjectId
            ? _value.defaultProjectId
            : defaultProjectId // ignore: cast_nullable_to_non_nullable
                  as String,
        pinnedProjectIds: null == pinnedProjectIds
            ? _value._pinnedProjectIds
            : pinnedProjectIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl({
    required this.userId,
    this.language = 'uk',
    this.themeMode = ThemeMode.dark,
    @TaskPriorityConverter() this.defaultTaskPriority = TaskPriority.medium,
    this.dateFormat = DateFormat.ddMMyyyy,
    this.timeFormat = TimeFormat.h24,
    this.showCompletedTasks = true,
    this.enableNotifications = true,
    this.defaultReminderMinutes = 15,
    this.autoArchiveCompletedDays = 7,
    this.enableDarkCalendar = false,
    this.showWeekNumbers = true,
    this.weekStartDay = 1,
    this.defaultProjectId = '',
    final List<String> pinnedProjectIds = const [],
    required this.createdAt,
    required this.updatedAt,
  }) : _pinnedProjectIds = pinnedProjectIds;

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  @TaskPriorityConverter()
  final TaskPriority defaultTaskPriority;
  @override
  @JsonKey()
  final DateFormat dateFormat;
  @override
  @JsonKey()
  final TimeFormat timeFormat;
  @override
  @JsonKey()
  final bool showCompletedTasks;
  @override
  @JsonKey()
  final bool enableNotifications;
  @override
  @JsonKey()
  final int defaultReminderMinutes;
  @override
  @JsonKey()
  final int autoArchiveCompletedDays;
  @override
  @JsonKey()
  final bool enableDarkCalendar;
  @override
  @JsonKey()
  final bool showWeekNumbers;
  @override
  @JsonKey()
  final int weekStartDay;
  // 1 = Monday, 7 = Sunday
  @override
  @JsonKey()
  final String defaultProjectId;
  final List<String> _pinnedProjectIds;
  @override
  @JsonKey()
  List<String> get pinnedProjectIds {
    if (_pinnedProjectIds is EqualUnmodifiableListView)
      return _pinnedProjectIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedProjectIds);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserSettings(userId: $userId, language: $language, themeMode: $themeMode, defaultTaskPriority: $defaultTaskPriority, dateFormat: $dateFormat, timeFormat: $timeFormat, showCompletedTasks: $showCompletedTasks, enableNotifications: $enableNotifications, defaultReminderMinutes: $defaultReminderMinutes, autoArchiveCompletedDays: $autoArchiveCompletedDays, enableDarkCalendar: $enableDarkCalendar, showWeekNumbers: $showWeekNumbers, weekStartDay: $weekStartDay, defaultProjectId: $defaultProjectId, pinnedProjectIds: $pinnedProjectIds, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.defaultTaskPriority, defaultTaskPriority) ||
                other.defaultTaskPriority == defaultTaskPriority) &&
            (identical(other.dateFormat, dateFormat) ||
                other.dateFormat == dateFormat) &&
            (identical(other.timeFormat, timeFormat) ||
                other.timeFormat == timeFormat) &&
            (identical(other.showCompletedTasks, showCompletedTasks) ||
                other.showCompletedTasks == showCompletedTasks) &&
            (identical(other.enableNotifications, enableNotifications) ||
                other.enableNotifications == enableNotifications) &&
            (identical(other.defaultReminderMinutes, defaultReminderMinutes) ||
                other.defaultReminderMinutes == defaultReminderMinutes) &&
            (identical(
                  other.autoArchiveCompletedDays,
                  autoArchiveCompletedDays,
                ) ||
                other.autoArchiveCompletedDays == autoArchiveCompletedDays) &&
            (identical(other.enableDarkCalendar, enableDarkCalendar) ||
                other.enableDarkCalendar == enableDarkCalendar) &&
            (identical(other.showWeekNumbers, showWeekNumbers) ||
                other.showWeekNumbers == showWeekNumbers) &&
            (identical(other.weekStartDay, weekStartDay) ||
                other.weekStartDay == weekStartDay) &&
            (identical(other.defaultProjectId, defaultProjectId) ||
                other.defaultProjectId == defaultProjectId) &&
            const DeepCollectionEquality().equals(
              other._pinnedProjectIds,
              _pinnedProjectIds,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    language,
    themeMode,
    defaultTaskPriority,
    dateFormat,
    timeFormat,
    showCompletedTasks,
    enableNotifications,
    defaultReminderMinutes,
    autoArchiveCompletedDays,
    enableDarkCalendar,
    showWeekNumbers,
    weekStartDay,
    defaultProjectId,
    const DeepCollectionEquality().hash(_pinnedProjectIds),
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(this);
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings({
    required final String userId,
    final String language,
    final ThemeMode themeMode,
    @TaskPriorityConverter() final TaskPriority defaultTaskPriority,
    final DateFormat dateFormat,
    final TimeFormat timeFormat,
    final bool showCompletedTasks,
    final bool enableNotifications,
    final int defaultReminderMinutes,
    final int autoArchiveCompletedDays,
    final bool enableDarkCalendar,
    final bool showWeekNumbers,
    final int weekStartDay,
    final String defaultProjectId,
    final List<String> pinnedProjectIds,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  String get userId;
  @override
  String get language;
  @override
  ThemeMode get themeMode;
  @override
  @TaskPriorityConverter()
  TaskPriority get defaultTaskPriority;
  @override
  DateFormat get dateFormat;
  @override
  TimeFormat get timeFormat;
  @override
  bool get showCompletedTasks;
  @override
  bool get enableNotifications;
  @override
  int get defaultReminderMinutes;
  @override
  int get autoArchiveCompletedDays;
  @override
  bool get enableDarkCalendar;
  @override
  bool get showWeekNumbers;
  @override
  int get weekStartDay; // 1 = Monday, 7 = Sunday
  @override
  String get defaultProjectId;
  @override
  List<String> get pinnedProjectIds;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
