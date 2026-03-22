import 'package:chasivnyk/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../projects/projects_screen.dart';
import '../timeline/timeline_screen.dart';

class RootNavigationShell extends StatefulWidget {
  const RootNavigationShell({super.key});

  @override
  State<RootNavigationShell> createState() => _RootNavigationShellState();
}

class _RootNavigationShellState extends State<RootNavigationShell> {
  late final PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                TimelineScreen(),
                ProjectsScreen(),
                _ProgressPlaceholder(),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              height: UIConstants.bottomNavigationBarHeight,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: _selectedIndex,
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.textSecondary,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.calendar_today, size: 20),
                    label: localization.timeline,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.folder, size: 20),
                    label: localization.projects,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.bar_chart, size: 20),
                    label: localization.progress,
                  ),
                ],
                onTap: (index) {
                  setState(() => _selectedIndex = index);
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressPlaceholder extends StatelessWidget {
  const _ProgressPlaceholder();

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
