// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: ProjectId.fromJson(json['id'] as String),
      title: const ProjectTitleConverter().fromJson(json['title'] as String),
      description: const ProjectDescriptionConverter().fromJson(
        json['description'] as String?,
      ),
      status:
          $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
          ProjectStatus.active,
      tags:
          (json['tags'] as List<dynamic>?)
              ?.map((e) => const TaskTagConverter().fromJson(e as String))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id.toJson(),
      'title': const ProjectTitleConverter().toJson(instance.title),
      'description': const ProjectDescriptionConverter().toJson(
        instance.description,
      ),
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'tags': instance.tags.map(const TaskTagConverter().toJson).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'active',
  ProjectStatus.archived: 'archived',
  ProjectStatus.completed: 'completed',
};
