# Isar Database Implementation

## Overview
This project uses **Isar Community Fork** - an actively maintained fork of the original Isar database. Isar is a high-performance NoSQL database designed specifically for Flutter and Dart.

## Why Isar Community Fork?
- ✅ **Actively maintained** - Regular updates and bug fixes
- ✅ **High performance** - Extremely fast queries and operations
- ✅ **Type-safe** - Full Dart type safety
- ✅ **Easy to use** - Simple API with minimal boilerplate
- ✅ **Async by default** - Perfect for Flutter apps
- ✅ **Cross-platform** - Works on iOS, Android, Desktop

## Structure

### Entities
- **TaskEntity** (`entities/task_entity.dart`) - Main task storage entity
  - Stores task metadata (title, description, status, priority, dates)
  - Uses JSON serialization for complex nested objects (subtasks, tags, reminders, comments, attachments)
  - Indexed fields for efficient querying

### Database Manager
- **AppDatabase** (`app_database.dart`) - Singleton database manager
  - `getInstance()` - Get or create Isar instance
  - `clearAll()` - Clear all data (for testing)
  - `close()` - Close database connection

### Repository
- **IsarTaskRepository** (`../repositories/isar_task_repository.dart`) - Implementation of `ITaskRepository`
  - Maps between domain `Task` entities and Isar `TaskEntity`
  - Handles JSON serialization/deserialization for complex fields
  - Provides CRUD operations

## Usage

### Initialize Database
```dart
final isar = await AppDatabase.getInstance();
```

### Create Repository
```dart
final repository = await IsarTaskRepository.create();
```

### Save Task
```dart
final task = Task.create(
  title: 'My Task',
  description: 'Task description',
  priority: TaskPriority.high,
);
await repository.save(task);
```

### Query Tasks
```dart
// Find by ID
final task = await repository.findById(taskId);

// Get all tasks
final tasks = await repository.findAll();

// Get tasks sorted by priority
final sortedTasks = await repository.findAllSortedByPriority();
```

### Delete Task
```dart
await repository.delete(taskId);
```

## Code Generation

Isar uses code generation to create efficient database schemas. Run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

This generates `task_entity.g.dart` with:
- Schema definitions
- Query builders
- Serialization code

## Data Model

### TaskEntity Fields
- `id` - Auto-increment Isar ID
- `taskId` - UUID from domain (indexed)
- `title` - Task title (indexed)
- `description` - Optional description
- `status` - Task status as int (indexed)
- `dueDate` - Due date as milliseconds (indexed)
- `period` - Recurrence period (indexed)
- `priority` - Priority level (indexed)
- `createdAt` / `updatedAt` - Timestamps
- JSON fields for complex data:
  - `subtasksJson` - List of subtasks
  - `tagsJson` - List of tags
  - `remindersJson` - List of reminders
  - `commentsJson` - List of comments
  - `attachmentsJson` - List of attachments

### Indexing Strategy
Indexed fields for fast queries:
- `taskId` - For lookups by domain ID
- `title` - For text search
- `status` - For filtering by status
- `dueDate` - For date-based queries
- `period` - For recurring task queries
- `priority` - For priority sorting

## Performance Considerations

1. **JSON Serialization** - Complex nested objects are stored as JSON strings
   - Pros: Flexible, easy to maintain
   - Cons: Slightly slower than native Isar objects
   - Trade-off: Acceptable for this use case

2. **Indexes** - Strategic indexing on frequently queried fields
   - Improves query performance
   - Minimal storage overhead

3. **Batch Operations** - Use transactions for multiple operations
   ```dart
   await isar.writeTxn(() async {
     await isar.taskEntitys.putAll(entities);
   });
   ```

## Testing

Clear database before tests:
```dart
await AppDatabase.clearAll();
```

## Migration Notes

When adding new fields:
1. Add field to `TaskEntity`
2. Run code generation
3. Update mapping methods in `IsarTaskRepository`
4. Test thoroughly

## Resources

- [Isar Community Fork](https://pub.dev/packages/isar_community)
- [Isar Documentation](https://isar.dev)
- [GitHub Repository](https://github.com/isar/isar)
