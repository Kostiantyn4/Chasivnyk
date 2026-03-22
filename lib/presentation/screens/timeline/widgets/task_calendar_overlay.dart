import 'package:flutter/material.dart';

import '../../../widgets/calendar/calendar_panel.dart';

class TaskCalendarOverlay extends StatelessWidget {
  final bool isCalendarVisible;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onToggleVisibility;

  const TaskCalendarOverlay({
    super.key,
    required this.isCalendarVisible,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
