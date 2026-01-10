import 'package:flutter/material.dart';

import '../../models/project_context.dart';
import '../timeline/modes/task_list_mode.dart';
import '../timeline/timeline_screen.dart';

class ProjectTasksScreen extends StatelessWidget {
  final ProjectContext projectContext;

  const ProjectTasksScreen({super.key, required this.projectContext});

  @override
  Widget build(BuildContext context) {
    return TimelineScreen(
      mode: ProjectTaskListMode(projectContext),
    );
  }
}
