import 'package:json_annotation/json_annotation.dart';
import 'task_value_objects.dart';
import 'task_recurrence.dart';

class TaskIdConverter implements JsonConverter<TaskId, String> {
  const TaskIdConverter();

  @override
  TaskId fromJson(String json) => TaskId(json);

  @override
  String toJson(TaskId object) => object.value;
}

class TaskTitleConverter implements JsonConverter<TaskTitle, String> {
  const TaskTitleConverter();

  @override
  TaskTitle fromJson(String json) => TaskTitle(json);

  @override
  String toJson(TaskTitle object) => object.value;
}

class ProjectIdConverter implements JsonConverter<ProjectId?, String?> {
  const ProjectIdConverter();

  @override
  ProjectId? fromJson(String? json) => json != null ? ProjectId(json) : null;

  @override
  String? toJson(ProjectId? object) => object?.toJson();
}

class ProjectTitleConverter implements JsonConverter<ProjectTitle, String> {
  const ProjectTitleConverter();

  @override
  ProjectTitle fromJson(String json) => ProjectTitle(json);

  @override
  String toJson(ProjectTitle object) => object.toJson();
}

class ProjectDescriptionConverter implements JsonConverter<ProjectDescription?, String?> {
  const ProjectDescriptionConverter();

  @override
  ProjectDescription? fromJson(String? json) => json != null ? ProjectDescription(json) : null;

  @override
  String? toJson(ProjectDescription? object) => object?.toJson();
}

class TaskDescriptionConverter implements JsonConverter<TaskDescription, String?> {
  const TaskDescriptionConverter();

  @override
  TaskDescription fromJson(String? json) => TaskDescription(json);

  @override
  String? toJson(TaskDescription object) => object.value;
}

class TaskRecurrenceConverter implements JsonConverter<TaskRecurrence, Map<String, dynamic>> {
  const TaskRecurrenceConverter();

  @override
  TaskRecurrence fromJson(Map<String, dynamic> json) => TaskRecurrence.fromJson(json);

  @override
  Map<String, dynamic> toJson(TaskRecurrence object) => object.toJson();
}

class TaskTagConverter implements JsonConverter<TaskTag, String> {
  const TaskTagConverter();

  @override
  TaskTag fromJson(String json) => TaskTag(json);

  @override
  String toJson(TaskTag object) => object.value;
}

class TaskPeriodConverter implements JsonConverter<TaskPeriod, String> {
  const TaskPeriodConverter();

  @override
  TaskPeriod fromJson(String json) => TaskPeriod.values.byName(json);

  @override
  String toJson(TaskPeriod object) => object.name;
}

class ReminderRepeatConverter implements JsonConverter<ReminderRepeat, String> {
  const ReminderRepeatConverter();

  @override
  ReminderRepeat fromJson(String json) => ReminderRepeat.values.byName(json);

  @override
  String toJson(ReminderRepeat object) => object.name;
}

class TaskPriorityConverter implements JsonConverter<TaskPriority, String> {
  const TaskPriorityConverter();

  @override
  TaskPriority fromJson(String json) => TaskPriority.values.byName(json);

  @override
  String toJson(TaskPriority object) => object.name;
}
