// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskEntityCollection on Isar {
  IsarCollection<TaskEntity> get taskEntitys => this.collection();
}

const TaskEntitySchema = CollectionSchema(
  name: r'TaskEntity',
  id: -2911998186285533288,
  properties: {
    r'attachmentsJson': PropertySchema(
      id: 0,
      name: r'attachmentsJson',
      type: IsarType.string,
    ),
    r'commentsJson': PropertySchema(
      id: 1,
      name: r'commentsJson',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'customDurationJson': PropertySchema(
      id: 3,
      name: r'customDurationJson',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(id: 5, name: r'dueDate', type: IsarType.long),
    r'duration': PropertySchema(id: 6, name: r'duration', type: IsarType.long),
    r'priority': PropertySchema(id: 7, name: r'priority', type: IsarType.long),
    r'recurrenceEnd': PropertySchema(
      id: 8,
      name: r'recurrenceEnd',
      type: IsarType.long,
    ),
    r'remindersJson': PropertySchema(
      id: 9,
      name: r'remindersJson',
      type: IsarType.string,
    ),
    r'rrule': PropertySchema(id: 10, name: r'rrule', type: IsarType.string),
    r'status': PropertySchema(id: 11, name: r'status', type: IsarType.long),
    r'subtasksJson': PropertySchema(
      id: 12,
      name: r'subtasksJson',
      type: IsarType.string,
    ),
    r'tagsJson': PropertySchema(
      id: 13,
      name: r'tagsJson',
      type: IsarType.string,
    ),
    r'taskId': PropertySchema(id: 14, name: r'taskId', type: IsarType.string),
    r'title': PropertySchema(id: 15, name: r'title', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.long,
    ),
  },

  estimateSize: _taskEntityEstimateSize,
  serialize: _taskEntitySerialize,
  deserialize: _taskEntityDeserialize,
  deserializeProp: _taskEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'taskId': IndexSchema(
      id: -6391211041487498726,
      name: r'taskId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'taskId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'dueDate': IndexSchema(
      id: -7871003637559820552,
      name: r'dueDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dueDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'duration': IndexSchema(
      id: 8840853660219221640,
      name: r'duration',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'duration',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'priority': IndexSchema(
      id: -6477851841645083544,
      name: r'priority',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'priority',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _taskEntityGetId,
  getLinks: _taskEntityGetLinks,
  attach: _taskEntityAttach,
  version: '3.3.0-dev.1',
);

int _taskEntityEstimateSize(
  TaskEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attachmentsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.commentsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customDurationJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remindersJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rrule;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subtasksJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tagsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.taskId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _taskEntitySerialize(
  TaskEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attachmentsJson);
  writer.writeString(offsets[1], object.commentsJson);
  writer.writeLong(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.customDurationJson);
  writer.writeString(offsets[4], object.description);
  writer.writeLong(offsets[5], object.dueDate);
  writer.writeLong(offsets[6], object.duration);
  writer.writeLong(offsets[7], object.priority);
  writer.writeLong(offsets[8], object.recurrenceEnd);
  writer.writeString(offsets[9], object.remindersJson);
  writer.writeString(offsets[10], object.rrule);
  writer.writeLong(offsets[11], object.status);
  writer.writeString(offsets[12], object.subtasksJson);
  writer.writeString(offsets[13], object.tagsJson);
  writer.writeString(offsets[14], object.taskId);
  writer.writeString(offsets[15], object.title);
  writer.writeLong(offsets[16], object.updatedAt);
}

TaskEntity _taskEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskEntity();
  object.attachmentsJson = reader.readStringOrNull(offsets[0]);
  object.commentsJson = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readLong(offsets[2]);
  object.customDurationJson = reader.readStringOrNull(offsets[3]);
  object.description = reader.readStringOrNull(offsets[4]);
  object.dueDate = reader.readLongOrNull(offsets[5]);
  object.duration = reader.readLongOrNull(offsets[6]);
  object.id = id;
  object.priority = reader.readLong(offsets[7]);
  object.recurrenceEnd = reader.readLongOrNull(offsets[8]);
  object.remindersJson = reader.readStringOrNull(offsets[9]);
  object.rrule = reader.readStringOrNull(offsets[10]);
  object.status = reader.readLong(offsets[11]);
  object.subtasksJson = reader.readStringOrNull(offsets[12]);
  object.tagsJson = reader.readStringOrNull(offsets[13]);
  object.taskId = reader.readString(offsets[14]);
  object.title = reader.readString(offsets[15]);
  object.updatedAt = reader.readLong(offsets[16]);
  return object;
}

P _taskEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskEntityGetId(TaskEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskEntityGetLinks(TaskEntity object) {
  return [];
}

void _taskEntityAttach(IsarCollection<dynamic> col, Id id, TaskEntity object) {
  object.id = id;
}

extension TaskEntityQueryWhereSort
    on QueryBuilder<TaskEntity, TaskEntity, QWhere> {
  QueryBuilder<TaskEntity, TaskEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhere> anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhere> anyDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dueDate'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhere> anyDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'duration'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhere> anyPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'priority'),
      );
    });
  }
}

extension TaskEntityQueryWhere
    on QueryBuilder<TaskEntity, TaskEntity, QWhereClause> {
  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> taskIdEqualTo(
    String taskId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'taskId', value: [taskId]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> taskIdNotEqualTo(
    String taskId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'taskId',
                lower: [],
                upper: [taskId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'taskId',
                lower: [taskId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'taskId',
                lower: [taskId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'taskId',
                lower: [],
                upper: [taskId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [title]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleNotEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleGreaterThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [title],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleLessThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [],
          upper: [title],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleBetween(
    String lowerTitle,
    String upperTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [lowerTitle],
          includeLower: includeLower,
          upper: [upperTitle],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleStartsWith(
    String TitlePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [TitlePrefix],
          upper: ['$TitlePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: ['']),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> statusEqualTo(
    int status,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> statusNotEqualTo(
    int status,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> statusGreaterThan(
    int status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [status],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> statusLessThan(
    int status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [],
          upper: [status],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> statusBetween(
    int lowerStatus,
    int upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [lowerStatus],
          includeLower: includeLower,
          upper: [upperStatus],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'dueDate', value: [null]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueDate',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateEqualTo(
    int? dueDate,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'dueDate', value: [dueDate]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateNotEqualTo(
    int? dueDate,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueDate',
                lower: [],
                upper: [dueDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueDate',
                lower: [dueDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueDate',
                lower: [dueDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'dueDate',
                lower: [],
                upper: [dueDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateGreaterThan(
    int? dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueDate',
          lower: [dueDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateLessThan(
    int? dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueDate',
          lower: [],
          upper: [dueDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> dueDateBetween(
    int? lowerDueDate,
    int? upperDueDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'dueDate',
          lower: [lowerDueDate],
          includeLower: includeLower,
          upper: [upperDueDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'duration', value: [null]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'duration',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationEqualTo(
    int? duration,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'duration', value: [duration]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationNotEqualTo(
    int? duration,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'duration',
                lower: [],
                upper: [duration],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'duration',
                lower: [duration],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'duration',
                lower: [duration],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'duration',
                lower: [],
                upper: [duration],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationGreaterThan(
    int? duration, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'duration',
          lower: [duration],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationLessThan(
    int? duration, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'duration',
          lower: [],
          upper: [duration],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> durationBetween(
    int? lowerDuration,
    int? upperDuration, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'duration',
          lower: [lowerDuration],
          includeLower: includeLower,
          upper: [upperDuration],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> priorityEqualTo(
    int priority,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'priority', value: [priority]),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> priorityNotEqualTo(
    int priority,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priority',
                lower: [],
                upper: [priority],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priority',
                lower: [priority],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priority',
                lower: [priority],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'priority',
                lower: [],
                upper: [priority],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> priorityGreaterThan(
    int priority, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'priority',
          lower: [priority],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> priorityLessThan(
    int priority, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'priority',
          lower: [],
          upper: [priority],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterWhereClause> priorityBetween(
    int lowerPriority,
    int upperPriority, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'priority',
          lower: [lowerPriority],
          includeLower: includeLower,
          upper: [upperPriority],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension TaskEntityQueryFilter
    on QueryBuilder<TaskEntity, TaskEntity, QFilterCondition> {
  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'attachmentsJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'attachmentsJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'attachmentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'attachmentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'attachmentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'attachmentsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'attachmentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'attachmentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'attachmentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'attachmentsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'attachmentsJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  attachmentsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'attachmentsJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'commentsJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'commentsJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'commentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'commentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'commentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'commentsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'commentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'commentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'commentsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'commentsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'commentsJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  commentsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'commentsJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> createdAtEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  createdAtGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> createdAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> createdAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'customDurationJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'customDurationJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'customDurationJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'customDurationJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'customDurationJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'customDurationJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'customDurationJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'customDurationJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'customDurationJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'customDurationJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customDurationJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  customDurationJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customDurationJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dueDate'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dueDate'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> dueDateEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dueDate', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  dueDateGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dueDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> dueDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dueDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> dueDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dueDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'duration'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'duration'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> durationEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'duration', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  durationGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'duration',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'duration',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'duration',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> priorityEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'priority', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  priorityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> priorityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priority',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  recurrenceEndIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'recurrenceEnd'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  recurrenceEndIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'recurrenceEnd'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  recurrenceEndEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recurrenceEnd', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  recurrenceEndGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recurrenceEnd',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  recurrenceEndLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recurrenceEnd',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  recurrenceEndBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recurrenceEnd',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'remindersJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'remindersJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'remindersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'remindersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'remindersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'remindersJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'remindersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'remindersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'remindersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'remindersJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'remindersJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  remindersJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'remindersJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rrule'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rrule'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rrule',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rrule',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rrule',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rrule',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rrule',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rrule',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rrule',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rrule',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> rruleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rrule', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  rruleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rrule', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> statusEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'subtasksJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'subtasksJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'subtasksJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'subtasksJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'subtasksJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'subtasksJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'subtasksJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'subtasksJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'subtasksJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'subtasksJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'subtasksJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  subtasksJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'subtasksJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tagsJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  tagsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tagsJson'),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tagsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  tagsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tagsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tagsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tagsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  tagsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tagsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tagsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tagsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> tagsJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tagsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  tagsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tagsJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  tagsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tagsJson', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'taskId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'taskId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'taskId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'taskId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'taskId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'taskId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'taskId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'taskId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> taskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'taskId', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  taskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'taskId', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> updatedAtEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition>
  updatedAtGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> updatedAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterFilterCondition> updatedAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension TaskEntityQueryObject
    on QueryBuilder<TaskEntity, TaskEntity, QFilterCondition> {}

extension TaskEntityQueryLinks
    on QueryBuilder<TaskEntity, TaskEntity, QFilterCondition> {}

extension TaskEntityQuerySortBy
    on QueryBuilder<TaskEntity, TaskEntity, QSortBy> {
  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByAttachmentsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentsJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy>
  sortByAttachmentsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentsJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByCommentsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByCommentsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy>
  sortByCustomDurationJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDurationJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy>
  sortByCustomDurationJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDurationJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByRecurrenceEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByRecurrenceEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByRemindersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByRemindersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByRrule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rrule', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByRruleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rrule', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortBySubtasksJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtasksJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortBySubtasksJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtasksJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByTagsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByTagsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TaskEntityQuerySortThenBy
    on QueryBuilder<TaskEntity, TaskEntity, QSortThenBy> {
  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByAttachmentsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentsJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy>
  thenByAttachmentsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentsJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByCommentsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByCommentsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy>
  thenByCustomDurationJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDurationJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy>
  thenByCustomDurationJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDurationJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByRecurrenceEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByRecurrenceEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceEnd', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByRemindersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByRemindersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByRrule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rrule', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByRruleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rrule', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenBySubtasksJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtasksJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenBySubtasksJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtasksJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByTagsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsJson', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByTagsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tagsJson', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TaskEntityQueryWhereDistinct
    on QueryBuilder<TaskEntity, TaskEntity, QDistinct> {
  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByAttachmentsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'attachmentsJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByCommentsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentsJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByCustomDurationJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'customDurationJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByRecurrenceEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceEnd');
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByRemindersJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'remindersJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByRrule({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rrule', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctBySubtasksJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtasksJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByTagsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagsJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByTaskId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskEntity, TaskEntity, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension TaskEntityQueryProperty
    on QueryBuilder<TaskEntity, TaskEntity, QQueryProperty> {
  QueryBuilder<TaskEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations>
  attachmentsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentsJson');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations> commentsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentsJson');
    });
  }

  QueryBuilder<TaskEntity, int, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations>
  customDurationJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customDurationJson');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TaskEntity, int?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<TaskEntity, int?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<TaskEntity, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<TaskEntity, int?, QQueryOperations> recurrenceEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceEnd');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations> remindersJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remindersJson');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations> rruleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rrule');
    });
  }

  QueryBuilder<TaskEntity, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations> subtasksJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtasksJson');
    });
  }

  QueryBuilder<TaskEntity, String?, QQueryOperations> tagsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagsJson');
    });
  }

  QueryBuilder<TaskEntity, String, QQueryOperations> taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskId');
    });
  }

  QueryBuilder<TaskEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<TaskEntity, int, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
