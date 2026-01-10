import 'package:uuid/uuid.dart';
import '../entities/task.dart';
import '../entities/task_extension.dart';
import '../entities/value_objects/task_value_objects.dart';
import '../repositories/task_repository.dart';
import '../entities/task_comment.dart';
import '../entities/task_attachment.dart';

abstract class ITaskService {
  Future<Task> createTask(
    String title, {
    String? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    TaskPriority? priority,
    String? projectId,
  });
  Future<Task> updateTask(
    Task task, {
    String? title,
    String? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    TaskPriority? priority,
    String? projectId,
    bool changeProject = false,
  });
  
  Future<Task> addSubtask(Task task, String title);
  Future<Task> addReminder(Task task, DateTime time);
  Future<Task> addTag(Task task, String tag);
  Future<Task> updateStatus(Task task, TaskStatus status);
  Future<Task> addComment(Task task, String authorId, String content);
  Future<Task> editComment(Task task, String commentId, String content);
  Future<Task> addFileAttachment(Task task, String name, String url, String mimeType, int size);
  Future<Task> addLinkAttachment(Task task, String name, String url);
  Future<Task> updatePriority(Task task, TaskPriority priority);
  Future<void> deleteTask(Task task);
}

class TaskService implements ITaskService {
  final ITaskRepository _repository;

  TaskService(this._repository);

  @override
  Future<Task> createTask(
    String title, {
    String? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    TaskPriority? priority,
    String? projectId,
  }) async {
    final nonPastDueDate = _ensureDueDateIsNotPast(dueDate);
    final task = Task.create(
      title: title,
      description: description,
      dueDate: nonPastDueDate,
      duration: duration,
      customDuration: customDuration,
      rrule: rrule,
      recurrenceEnd: recurrenceEnd,
      priority: priority,
      projectId: projectId,
    ).copyWith(status: TaskStatus.active);
    await _repository.save(task);
    return task;
  }

  /// Prevents app crashes from legacy records by coercing past due dates a few
  /// minutes into the future. Data migrations should fix existing data, but
  /// this guard protects against regressions or external integrations.
  DateTime? _ensureDueDateIsNotPast(DateTime? dueDate) {
    if (dueDate == null) return null;
    final now = DateTime.now();
    if (dueDate.isBefore(now)) {
      return now.add(const Duration(minutes: 5));
    }
    return dueDate;
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _repository.delete(task.id);
  }

  @override
  Future<Task> updateTask(
    Task task, {
    String? title,
    String? description,
    DateTime? dueDate,
    TaskDuration? duration,
    CustomDuration? customDuration,
    String? rrule,
    DateTime? recurrenceEnd,
    TaskPriority? priority,
    String? projectId,
    bool changeProject = false,
  }) async {
    final updatedTask = task.copyWith(
      title: title != null ? TaskTitle(title) : task.title,
      description: description != null
          ? (description.isEmpty ? null : TaskDescription(description))
          : task.description,
      dueDate: dueDate ?? task.dueDate,
      duration: duration ?? task.duration,
      customDuration: customDuration ?? task.customDuration,
      rrule: rrule ?? task.rrule,
      recurrenceEnd: recurrenceEnd ?? task.recurrenceEnd,
      priority: priority ?? task.priority,
      projectId: changeProject
          ? (projectId != null ? ProjectId(projectId) : null)
          : task.projectId,
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> addSubtask(Task task, String title) async {
    final subtask = Subtask.create(title: title);
    final updatedTask = task.copyWith(
      subtasks: [...task.subtasks, subtask],
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> addReminder(Task task, DateTime time) async {
    final taskId = TaskId(const Uuid().v4());
    final reminder = Reminder(
      id: taskId,
      time: time,
    );
    final updatedTask = task.copyWith(
      reminders: [...task.reminders, reminder],
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> addTag(Task task, String tag) async {
    final newTag = TaskTag(tag);
    if (task.tags.contains(newTag)) return task;
    final updatedTask = task.copyWith(
      tags: [...task.tags, newTag],
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> updatePriority(Task task, TaskPriority priority) async {
    final updatedTask = task.updatePriority(priority);
    await _repository.save(updatedTask);
    return updatedTask;
  }

  Future<Task> escalateTask(Task task) async {
    final updatedTask = task.escalate();
    await _repository.save(updatedTask);
    return updatedTask;
  }

  Future<Task> deescalateTask(Task task) async {
    final updatedTask = task.deescalate();
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> updateStatus(Task task, TaskStatus status) async {
    Task updatedTask;
    switch (status) {
      case TaskStatus.active:
        updatedTask = task.markAsActive();
        break;
      case TaskStatus.inProgress:
        updatedTask = task.startProgress();
        break;
      case TaskStatus.done:
        updatedTask = task.markAsDone();
        break;
      case TaskStatus.archived:
        updatedTask = task.archive();
        break;
    }
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> addComment(Task task, String authorId, String content) async {
    final comment = TaskComment.create(
      taskId: task.id.value,
      authorId: authorId,
      content: content,
    );
    final updatedTask = task.copyWith(
      comments: [...task.comments, comment],
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> editComment(Task task, String commentId, String content) async {
    final comments = [...task.comments];
    final index = comments.indexWhere((c) => c.id.value == commentId);
    if (index == -1) throw ArgumentError('Comment not found');

    final oldComment = comments[index];
    final updatedComment = oldComment.updateContent(content);
    comments[index] = updatedComment;

    final updatedTask = task.copyWith(
      comments: comments,
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> addFileAttachment(Task task, String name, String url, String mimeType, int size) async {
    final attachment = TaskAttachment.createFile(
      taskId: task.id.value,
      filename: name,
      path: url,
      mimeType: mimeType,
      size: size,
    );
    final updatedTask = task.copyWith(
      attachments: [...task.attachments, attachment],
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }

  @override
  Future<Task> addLinkAttachment(Task task, String name, String url) async {
    final attachment = TaskAttachment.createLink(
      taskId: task.id.value,
      filename: name,
      path: url,
    );
    final updatedTask = task.copyWith(
      attachments: [...task.attachments, attachment],
      updatedAt: DateTime.now(),
    );
    await _repository.save(updatedTask);
    return updatedTask;
  }
}
