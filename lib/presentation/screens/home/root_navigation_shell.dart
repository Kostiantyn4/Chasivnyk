import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';

class RootNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const RootNavigationShell({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: UIConstants.bottomNavigationBarHeight,
          decoration: const BoxDecoration(
            color: AppColors.accentColor,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: navigationShell.currentIndex,
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
            onTap: (index) => navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            ),
          ),
        ),
      ),
    );
  }
}
