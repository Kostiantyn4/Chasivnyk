import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/constants/ui_constants.dart';
import '../../core/theme/app_colors.dart';

class CalendarPanel extends StatelessWidget {
  final bool isVisible;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final VoidCallback onToggleVisibility;

  const CalendarPanel({
    super.key,
    required this.isVisible,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: UIConstants.calendarAnimationDuration,
        curve: UIConstants.calendarAnimationCurve,
        height: isVisible ? UIConstants.calendarPanelHeight : 0,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(UIConstants.calendarPanelRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            if (isVisible) _buildCalendar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return GestureDetector(
      onTap: onToggleVisibility,
      child: Container(
        width: UIConstants.calendarHandleWidth,
        height: UIConstants.calendarHandleHeight,
        alignment: Alignment.center,
        child: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.textSecondary,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Expanded(
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: selectedDate,
        calendarFormat: CalendarFormat.month,
        selectedDayPredicate: (day) => isSameDay(selectedDate, day),
        onDaySelected: (selectedDay, focusedDay) {
          onDateSelected(selectedDay);
        },
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
