import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/home/root_navigation_shell.dart';
import '../../presentation/screens/timeline/timeline_screen.dart';
import '../../presentation/screens/projects/projects_screen.dart';
import '../../presentation/screens/projects/project_tasks_screen.dart';
import '../../presentation/screens/projects/create_project_screen.dart';
import '../../presentation/screens/task_creation/create_task_screen.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import 'routes.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootNavigationShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.timeline.path,
              name: AppRoute.timeline.name,
              builder: (context, state) => const TimelineScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.projects.path,
              name: AppRoute.projects.name,
              builder: (context, state) => const ProjectsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.progress.path,
              name: AppRoute.progress.name,
              builder: (context, state) => const _ProgressScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoute.createProject.path,
      name: AppRoute.createProject.name,
      builder: (context, state) => const CreateProjectScreen(),
    ),
    GoRoute(
      path: AppRoute.projectTasks.path,
      name: AppRoute.projectTasks.name,
      builder: (context, state) => ProjectTasksScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),
    GoRoute(
      path: AppRoute.createTask.path,
      name: AppRoute.createTask.name,
      builder: (context, state) {
        final dueDateStr = state.uri.queryParameters['dueDate'];
        return CreateTaskScreen(
          projectId: state.uri.queryParameters['projectId'],
          initialDueDate:
              dueDateStr != null ? DateTime.tryParse(dueDateStr) : null,
          enableDraftPersistence: false,
        );
      },
    ),
    GoRoute(
      path: AppRoute.editTask.path,
      name: AppRoute.editTask.name,
      builder: (context, state) => CreateTaskScreen(
        taskId: state.pathParameters['taskId'],
      ),
    ),
  ],
);

class _ProgressScreen extends StatelessWidget {
  const _ProgressScreen();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          localization.progress,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
