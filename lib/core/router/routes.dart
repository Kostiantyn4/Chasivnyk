import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  timeline('/'),
  projects('/projects'),
  progress('/progress'),
  projectTasks('/projects/:projectId/tasks'),
  createProject('/projects/new'),
  createTask('/tasks/new'),
  editTask('/tasks/:taskId/edit');

  const AppRoute(this.path);
  final String path;
}

extension AppNavigation on BuildContext {
  void goTimeline() => goNamed(AppRoute.timeline.name);
  void goProjects() => goNamed(AppRoute.projects.name);
  void goProgress() => goNamed(AppRoute.progress.name);

  Future<T?> pushProjectTasks<T>(String projectId) => pushNamed<T>(
        AppRoute.projectTasks.name,
        pathParameters: {'projectId': projectId},
      );

  Future<T?> pushCreateProject<T>() =>
      pushNamed<T>(AppRoute.createProject.name);

  Future<T?> pushCreateTask<T>({
    String? projectId,
    DateTime? initialDueDate,
  }) =>
      pushNamed<T>(
        AppRoute.createTask.name,
        queryParameters: {
          if (projectId != null) 'projectId': projectId,
          if (initialDueDate != null) 'dueDate': initialDueDate.toIso8601String(),
        },
      );

  Future<T?> pushEditTask<T>(String taskId) => pushNamed<T>(
        AppRoute.editTask.name,
        pathParameters: {'taskId': taskId},
      );
}
