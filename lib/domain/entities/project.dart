import 'package:freezed_annotation/freezed_annotation.dart';
import 'value_objects/task_value_objects.dart';
import 'value_objects/json_converters.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectStatus { active, archived, completed }

@freezed
class Project with _$Project {
  const factory Project({
    @ProjectIdConverter() required ProjectId id,
    @ProjectTitleConverter() required ProjectTitle title,
    @ProjectDescriptionConverter() ProjectDescription? description,
    @Default(ProjectStatus.active) ProjectStatus status,
    @Default([]) @TaskTagConverter() List<TaskTag> tags,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? completedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  factory Project.create({
    required String title,
    String? description,
    List<TaskTag>? tags,
  }) {
    final now = DateTime.now();
    return Project(
      id: ProjectId.generate(),
      title: ProjectTitle(title),
      description: description != null ? ProjectDescription(description) : null,
      tags: tags ?? const [],
      createdAt: now,
      updatedAt: now,
    );
  }
}
