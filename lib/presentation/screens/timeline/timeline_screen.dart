import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/localization/app_localizations_helper.dart';
import '../../widgets/calendar/calendar_panel.dart';
import '../task_creation/create_task_screen.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  void _initState() {
    _selectedDate = DateTime.now();
    _isCalendarVisible = false;
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isCalendarVisible = false;
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70), // Відступ над bottom nav bar
        child: FloatingActionButton(
          onPressed: () async {
            final task = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateTaskScreen(),
              ),
            );
            
            // TODO: Додати задачу в список якщо task != null
            if (task != null) {
              // Тут можна оновити список задач
              debugPrint('Task created: $task');
            }
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            GestureDetector(
            onTap: () {
              if (_isCalendarVisible) {
                setState(() {
                  _isCalendarVisible = false;
                });
              }
            },
            child: Column(
              children: [
                // Header with avatar and greeting
                _buildHeader(),
                
                // Task list
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(),
                        const SizedBox(height: 16),
                        _buildTasksList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calendar button
          if (!_isCalendarVisible)
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
                      onTap: () {
                        setState(() {
                          _isCalendarVisible = true;
                        });
                      },
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

          // Calendar panel
          CalendarPanel(
            isVisible: _isCalendarVisible,
            selectedDate: _selectedDate,
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
                _isCalendarVisible = false;
              });
            },
            onToggleVisibility: () {
              setState(() {
                _isCalendarVisible = !_isCalendarVisible;
              });
            },
          ),


          // Bottom navigation bar
          _buildBottomNavBar(),
        ],
      ),
      ),
    );
  }

  Widget _buildHeader() {
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
                  child: const Placeholder(), // TODO: Replace with actual avatar
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
                    'User', // TODO: Replace with actual username
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
            onPressed: () {
              // TODO: Handle notifications
            },
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Localization.current.todayTasksTitle,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString()).format(_selectedDate),
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildTasksList() {
    // TODO: Replace with actual task list
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTaskItem(
          color: Colors.blue,
          title: Localization.current.meetingWithAlexander,
          time: '10:00 - 11:00',
          isCompleted: false,
        ),
        const SizedBox(height: 12),
        _buildTaskItem(
          color: Colors.green,
          title: Localization.current.lunch,
          time: '14:00 - 15:00',
          isCompleted: false,
        ),
        const SizedBox(height: 12),
        _buildTaskItem(
          color: Colors.purple,
          title: Localization.current.workOnProject,
          time: '16:00 - 17:00',
          isCompleted: false,
        ),
        const SizedBox(height: 16),
        // Add task button
        TextButton(
          onPressed: () {
            // TODO: Handle add task
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: AppColors.textSecondary.withAlpha(77),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                Localization.current.addTaskButton,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem({
    required Color color,
    required String title,
    required String time,
    required bool isCompleted,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCompleted ? AppColors.primaryColor : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? AppColors.primaryColor : Colors.transparent,
              border: Border.all(
                color: isCompleted ? Colors.transparent : AppColors.textSecondary,
                width: 2,
              ),
            ),
            child: isCompleted
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : null,
          ),
        ],
      ),
    );
  }


  Widget _buildBottomNavBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.all(
                const TextStyle(fontSize: 11.0),
              ),
              height: 58,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              iconTheme: WidgetStateProperty.all(
                const IconThemeData(size: 20),
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: AppColors.accentColor,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.calendar_today, size: 20),
                selectedIcon: Icon(Icons.calendar_today, size: 20),
                label: Localization.current.timeline,
              ),
              NavigationDestination(
                icon: Icon(Icons.folder, size: 20),
                selectedIcon: Icon(Icons.folder, size: 20),
                label: Localization.current.projects,
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart, size: 20),
                selectedIcon: Icon(Icons.bar_chart, size: 20),
                label: Localization.current.progress,
              ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (index) {
              // TODO: Handle navigation
            },
          ),
        ),
      ),
    );
  }
}
