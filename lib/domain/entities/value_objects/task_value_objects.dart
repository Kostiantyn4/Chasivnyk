import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class TaskId {
  final String value;

  TaskId(this.value) {
    if (value.isEmpty) throw ArgumentError('TaskId cannot be empty');
  }

  factory TaskId.generate() => TaskId(const Uuid().v4());
  factory TaskId.fromJson(String json) => TaskId(json);
  String toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskId &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
class TaskTitle {
  final String value;

  TaskTitle(String value) : value = value.trim() {
    if (value.trim().isEmpty) {
      throw ArgumentError('Title cannot be empty');
    }
    if (value.trim().length > 255) {
      throw ArgumentError('Title cannot be longer than 255 characters');
    }
  }

  factory TaskTitle.fromJson(String json) => TaskTitle(json);
  String toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTitle &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
class TaskDescription {
  final String value;

  TaskDescription(String? value) : value = value?.trim() ?? '' {
    if (value != null && value.trim().length > 1000) {
      throw ArgumentError('Description cannot exceed 1000 characters');
    }
  }

  factory TaskDescription.fromJson(String? json) => TaskDescription(json);
  String? toJson() => value.isEmpty ? null : value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDescription &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

@immutable
class TaskTag {
  final String value;

  TaskTag(String value) : value = value.trim().toLowerCase() {
    if (value.trim().isEmpty) {
      throw ArgumentError('Tag cannot be empty');
    }
    if (value.trim().length > 50) {
      throw ArgumentError('Tag cannot exceed 50 characters');
    }
    if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value.trim())) {
      throw ArgumentError('Tag can only contain letters, numbers, underscores and hyphens');
    }
  }

  factory TaskTag.fromJson(String json) => TaskTag(json);
  String toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTag &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

@immutable
class ProjectId {
  final String value;

  ProjectId(String value) : value = value.trim() {
    if (value.trim().isEmpty) throw ArgumentError('ProjectId cannot be empty');
    if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value.trim())) {
      throw ArgumentError('ProjectId can only contain letters, numbers, underscores and hyphens');
    }
  }

  factory ProjectId.generate() => ProjectId(const Uuid().v4());
  factory ProjectId.fromJson(String json) => ProjectId(json);
  String toJson() => value;

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectId &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
class ProjectTitle {
  final String value;

  ProjectTitle(String value) : value = value.trim() {
    if (value.trim().isEmpty) {
      throw ArgumentError('Project title cannot be empty');
    }
    if (value.trim().length > 255) {
      throw ArgumentError('Project title cannot be longer than 255 characters');
    }
  }

  factory ProjectTitle.fromJson(String json) => ProjectTitle(json);
  String toJson() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectTitle &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

@immutable
class ProjectDescription {
  final String value;

  ProjectDescription(String? value) : value = value?.trim() ?? '' {
    if (value != null && value.trim().length > 1000) {
      throw ArgumentError('Project description cannot exceed 1000 characters');
    }
  }

  factory ProjectDescription.fromJson(String? json) => ProjectDescription(json);
  String? toJson() => value.isEmpty ? null : value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectDescription &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

enum TaskPeriod {
  daily,
  weekly,
  monthly,
  yearly,
}

enum ReminderRepeat {
  none,
  daily,
  weekly,
  monthly,
}

enum TaskPriority {
  low,
  medium,
  high,
  critical
}
