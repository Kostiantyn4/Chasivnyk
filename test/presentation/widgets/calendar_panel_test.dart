import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:chasivnyk/presentation/widgets/calendar/calendar_panel.dart';

void main() {
  group('CalendarPanel', () {
    late DateTime selectedDate;
    late Function(DateTime) onDateSelected;
    late VoidCallback onToggleVisibility;

    setUp(() {
      selectedDate = DateTime.now();
      onDateSelected = (date) {};
      onToggleVisibility = () {};
    });

    testWidgets('should render handle when collapsed', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                CalendarPanel(
                  isVisible: false,
                  selectedDate: selectedDate,
                  onDateSelected: onDateSelected,
                  onToggleVisibility: onToggleVisibility,
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should find the handle icon (up arrow when collapsed - to open)
      expect(find.byIcon(Icons.keyboard_arrow_up), findsOneWidget);
      
      // Should not find calendar when collapsed
      expect(find.byType(TableCalendar), findsNothing);
    });

    testWidgets('should render calendar when expanded', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                CalendarPanel(
                  isVisible: true,
                  selectedDate: selectedDate,
                  onDateSelected: onDateSelected,
                  onToggleVisibility: onToggleVisibility,
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should find the handle icon (down arrow when expanded - to close)
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
      
      // Should find calendar when expanded
      expect(find.byType(TableCalendar), findsOneWidget);
    });

    testWidgets('should call onToggleVisibility when handle is tapped', (WidgetTester tester) async {
      bool toggleCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                CalendarPanel(
                  isVisible: false,
                  selectedDate: selectedDate,
                  onDateSelected: onDateSelected,
                  onToggleVisibility: () {
                    toggleCalled = true;
                  },
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap the handle
      await tester.tap(find.byIcon(Icons.keyboard_arrow_up));
      await tester.pump();

      expect(toggleCalled, isTrue);
    });

    testWidgets('should show correct icon based on visibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                CalendarPanel(
                  isVisible: false,
                  selectedDate: selectedDate,
                  onDateSelected: onDateSelected,
                  onToggleVisibility: onToggleVisibility,
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find AnimatedSwitcher widget
      expect(find.byType(AnimatedSwitcher), findsOneWidget);
      
      // When collapsed, should show up arrow
      expect(find.byIcon(Icons.keyboard_arrow_up), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsNothing);
    });

    testWidgets('should show down arrow when expanded', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                CalendarPanel(
                  isVisible: true,
                  selectedDate: selectedDate,
                  onDateSelected: onDateSelected,
                  onToggleVisibility: onToggleVisibility,
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // When expanded, should show down arrow
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_up), findsNothing);
    });
  });
}
