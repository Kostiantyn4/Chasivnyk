import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/router/routes.dart';
import '../../../domain/entities/project.dart';
import '../../../domain/entities/task.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/buttons/add_task_button.dart';

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
      floatingActionButton: AddTaskButton(
        onPressed: () => _openCreateProject(),
        heroTag: 'projects_fab',
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
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _ProjectCard(
            project: project,
            localization: localization,
            onTap: () => _openProject(project),
            onDelete: () => _deleteProject(project),
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

  void _openCreateProject() {
    context.pushCreateProject();
  }

  void _openProject(Project project) {
    context.pushProjectTasks(project.id.value);
  }

  Future<void> _deleteProject(Project project) async {
    final localization = AppLocalizations.of(context)!;
    try {
      final taskRepo = await ref.read(taskRepositoryProvider.future);
      final allTasks = await taskRepo.findByProject(project.id.value);
      final incompleteCount = allTasks
          .where((t) =>
              t.status != TaskStatus.done &&
              t.status != TaskStatus.archived)
          .length;

      if (!mounted) return;

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: AppColors.accentColor,
          title: Text(
            localization.deleteProjectConfirmTitle,
            style: const TextStyle(color: AppColors.textPrimary),
          ),
          content: Text(
            incompleteCount > 0
                ? localization.deleteProjectHasTasksWarning(incompleteCount)
                : localization.deleteProjectConfirmMessage,
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                localization.continueEditing,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(
                localization.deleteButton,
                style: const TextStyle(color: AppColors.errorColor),
              ),
            ),
          ],
        ),
      );

      if (confirmed != true || !mounted) return;

      for (final task in allTasks) {
        await taskRepo.delete(task.id);
      }

      final projectService = ref.read(projectServiceProvider);
      await projectService.deleteProject(project);

      ref.invalidate(projectsProvider);
      ref.invalidate(projectTasksProvider(project.id.value));
      ref.invalidate(tasksProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(localization.projectDeleted),
            backgroundColor: AppColors.successColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${localization.errorPrefix}: $e'),
            backgroundColor: AppColors.errorColor,
          ),
        );
      }
    }
  }

}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final AppLocalizations localization;
  final VoidCallback onTap;
  final Future<void> Function() onDelete;

  const _ProjectCard({
    required this.project,
    required this.localization,
    required this.onTap,
    required this.onDelete,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  bool _isDeleteMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.2, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _enterDeleteMode() {
    setState(() => _isDeleteMode = true);
    _controller.forward();
  }

  void _exitDeleteMode() {
    _controller.reverse().then((_) {
      if (mounted) setState(() => _isDeleteMode = false);
    });
  }

  Future<void> _handleDeleteTap() async {
    _exitDeleteMode();
    await widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deleteWidth = constraints.maxWidth * 0.2;
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: deleteWidth,
                child: Material(
                  color: AppColors.errorColor,
                  child: InkWell(
                    onTap: _handleDeleteTap,
                    child: const Center(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _slideAnimation,
                child: GestureDetector(
                  onTap: _isDeleteMode ? _exitDeleteMode : widget.onTap,
                  onLongPress: _isDeleteMode ? null : _enterDeleteMode,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.accentColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
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
                                      widget.project.title.value,
                                      style: const TextStyle(
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
                                widget.localization.projectProgressLabel(0, 0),
                                style: const TextStyle(
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
                                    color: AppColors.secondaryColor
                                        .withValues(alpha: 0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
