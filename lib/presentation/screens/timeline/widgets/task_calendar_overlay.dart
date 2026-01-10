import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../widgets/calendar/calendar_panel.dart';

class TaskCalendarOverlay extends StatelessWidget {
  final bool isCalendarVisible;
  final DateTime selectedDate;
  final VoidCallback onShowRequest;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onToggleVisibility;

  const TaskCalendarOverlay({
    super.key,
    required this.isCalendarVisible,
    required this.selectedDate,
    required this.onShowRequest,
    required this.onDateSelected,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isCalendarVisible)
          Positioned(
            left: 0,
            right: 0,
            bottom: kBottomNavigationBarHeight + 8,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onShowRequest,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        CalendarPanel(
          isVisible: isCalendarVisible,
          selectedDate: selectedDate,
          onDateSelected: onDateSelected,
          onToggleVisibility: onToggleVisibility,
        ),
      ],
    );
  }
}
