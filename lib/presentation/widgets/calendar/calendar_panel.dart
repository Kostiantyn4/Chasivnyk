import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/constants/app_colors.dart';

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
        height: isVisible ? UIConstants.calendarPanelHeight : UIConstants.calendarHandleHeight,
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
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(UIConstants.calendarPanelRadius),
          ),
          child: Column(
            children: [
              _buildHandle(),
              if (isVisible) 
                Expanded(
                  child: _buildCalendar(),
                ),
            ],
          ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            AnimatedSwitcher(
              duration: UIConstants.calendarAnimationDuration,
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: child,
                );
              },
              child: Icon(
                isVisible ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                key: ValueKey(isVisible),
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 350, // Fixed height to prevent overflow
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
              titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              headerPadding: EdgeInsets.symmetric(vertical: 8.0),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              weekendTextStyle: TextStyle(color: AppColors.textSecondary),
              holidayTextStyle: TextStyle(color: AppColors.textSecondary),
              selectedDecoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(128),
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: AppColors.textPrimary),
              cellMargin: const EdgeInsets.all(4.0),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
              weekendStyle: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
            rowHeight: 40,
          ),
        ),
      ),
    );
  }
}
