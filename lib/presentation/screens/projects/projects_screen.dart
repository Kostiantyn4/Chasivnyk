import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/project.dart';
import '../../../l10n/app_localizations.dart';
import '../../models/project_context.dart';
import '../../widgets/buttons/primary_fab.dart';
import 'create_project_screen.dart';
import 'project_tasks_screen.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  const ProjectsScreen({super.key});

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: PrimaryFab(
          onPressed: () => _openCreateProject(localization),
          heroTag: 'projects_fab',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(localization),
            Expanded(
              child: projectsAsync.when(
                data: (projects) {
                  if (projects.isEmpty) {
                    return _buildEmptyState(localization);
                  }
                  return _buildProjectsList(localization, projects);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: Text(
                    error.toString(),
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations localization) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.projectsScreenTitle,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            localization.projectsAddProject,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsList(
    AppLocalizations localization,
    List<Project> projects,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        final accent = _colorForProject(project);
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _ProjectCard(
            project: project,
            accentColor: accent,
            localization: localization,
            onTap: () => _openProject(project, accent),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(AppLocalizations localization) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_off,
              size: 56,
              color: AppColors.textSecondary.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 16),
            Text(
              localization.projectsEmptyTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              localization.projectsEmptySubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openCreateProject(AppLocalizations localization) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CreateProjectScreen(),
      ),
    );
    if (result != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(localization.projectCreated),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _openProject(Project project, Color accentColor) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProjectTasksScreen(
          projectContext: ProjectContext(
            id: project.id.value,
            title: project.title.value,
            accentColor: accentColor,
          ),
        ),
      ),
    );
  }

  Color _colorForProject(Project project) {
    const palette = [
      Color(0xFF1F3755),
      Color(0xFF183D3D),
      Color(0xFF412A4C),
      Color(0xFF4B1D3F),
      Color(0xFF22577A),
      Color(0xFF2E294E),
    ];
    final hash = project.id.value.hashCode.abs();
    return palette[hash % palette.length];
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final Color accentColor;
  final AppLocalizations localization;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.project,
    required this.accentColor,
    required this.localization,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final completed = 0;
    final total = 0;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.folder,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          project.title.value,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white54,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    localization.projectProgressLabel(
                      completed,
                      total,
                    ),
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor.withValues(alpha: 0.5),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: total == 0 ? 0 : (completed / total).clamp(0.0, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryColor,
                                AppColors.primaryColor.withValues(alpha: 0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
