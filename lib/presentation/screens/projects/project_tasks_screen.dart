import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../models/project_context.dart';
import '../timeline/modes/task_list_mode.dart';
import '../timeline/timeline_screen.dart';

class ProjectTasksScreen extends ConsumerWidget {
  final String projectId;

  const ProjectTasksScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(singleProjectProvider(projectId));

    return projectAsync.when(
      data: (project) {
        if (project == null) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: const Center(child: Text('Project not found')),
          );
        }
        return TimelineScreen(
          mode: ProjectTaskListMode(
            ProjectContext(
              id: project.id.value,
              title: project.title.value,
              accentColor: AppColors.primaryColor,
            ),
          ),
        );
      },
      loading: () => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, _) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(child: Text('Error: $e')),
      ),
    );
  }
}
