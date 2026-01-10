import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../models/project_context.dart';

abstract class TaskListMode {
  const TaskListMode();

  bool get usesDateFilter;
  bool get showsCalendarOverlay;
  ProjectContext? get projectContext;
  String? get projectId => projectContext?.id;

  Widget buildHeader(BuildContext context, VoidCallback onBack);
  Widget buildTitle(BuildContext context, DateTime selectedDate);
}

class TodayTaskListMode extends TaskListMode {
  const TodayTaskListMode();

  @override
  bool get usesDateFilter => true;

  @override
  bool get showsCalendarOverlay => true;

  @override
  ProjectContext? get projectContext => null;

  @override
  Widget buildHeader(BuildContext context, VoidCallback onBack) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundColor,
            AppColors.backgroundColor.withAlpha(0),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: const Placeholder(),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Localization.current.greetingMessage,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'User',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTitle(BuildContext context, DateTime selectedDate) {
    return Text(
      Localization.current.todayTasksTitle,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
    );
  }
}

class ProjectTaskListMode extends TaskListMode {
  final ProjectContext project;

  const ProjectTaskListMode(this.project);

  @override
  bool get usesDateFilter => false;

  @override
  bool get showsCalendarOverlay => false;

  @override
  ProjectContext? get projectContext => project;

  @override
  Widget buildHeader(BuildContext context, VoidCallback onBack) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 16),
            color: AppColors.textPrimary,
            onPressed: onBack,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Localization.current.projects,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
                Text(
                  project.title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTitle(BuildContext context, DateTime selectedDate) {
    return Text(
      project.title,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
    );
  }
}
