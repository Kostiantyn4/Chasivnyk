import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chasivnyk/presentation/screens/task_creation/create_task_screen.dart';
import 'package:chasivnyk/l10n/app_localizations.dart';

void main() {
  group('CreateTaskScreen', () {
    testWidgets('should render all UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('uk'),
          home: CreateTaskScreen(),
        ),
      );

      // Check header
      expect(find.text('Нове завдання'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Check input fields
      expect(find.text('Назва завдання'), findsOneWidget);
      expect(find.text('Деталі завдання'), findsOneWidget);

      // Check option cards
      expect(find.text('Час на виконання'), findsOneWidget);
      expect(find.text('Нагадування'), findsOneWidget);
      expect(find.text('Підзавдання'), findsOneWidget);
      expect(find.text('Теги'), findsOneWidget);
      expect(find.text('Проєкт'), findsOneWidget);

      // Check save button
      expect(find.text('Зберегти'), findsOneWidget);
    });

    testWidgets('should show dialog when closing with unsaved changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('uk'),
          home: CreateTaskScreen(),
        ),
      );

      // Enter some text
      await tester.enterText(
        find.widgetWithText(TextField, 'Наприклад, розробити дизайн...'),
        'Test task',
      );
      await tester.pump();

      // Tap close button
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Verify dialog is shown
      expect(find.text('Відмінити зміни?'), findsOneWidget);
      expect(find.text('Продовжити'), findsOneWidget);
      expect(find.text('Закрити'), findsOneWidget);

      // Tap "Продовжити" to stay on screen
      await tester.tap(find.text('Продовжити'));
      await tester.pumpAndSettle();

      // Verify still on screen
      expect(find.text('Нове завдання'), findsOneWidget);
    });

    testWidgets('should allow text input in title field', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('uk'),
          home: CreateTaskScreen(),
        ),
      );

      // Find title field by hint text
      final titleField = find.widgetWithText(TextField, 'Наприклад, розробити дизайн...');
      expect(titleField, findsOneWidget);

      // Enter text
      await tester.enterText(titleField, 'Test task title');
      await tester.pump();

      // Verify text is entered
      expect(find.text('Test task title'), findsOneWidget);
    });

    testWidgets('should allow text input in description field', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('uk'),
          home: CreateTaskScreen(),
        ),
      );

      // Find description field by hint text
      final descriptionField = find.widgetWithText(
        TextField,
        'Додайте більше інформації про завдання...',
      );
      expect(descriptionField, findsOneWidget);

      // Enter text
      await tester.enterText(descriptionField, 'Test description');
      await tester.pump();

      // Verify text is entered
      expect(find.text('Test description'), findsOneWidget);
    });

    testWidgets('should display all option cards with correct icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('uk'),
          home: CreateTaskScreen(),
        ),
      );

      // Check icons
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byIcon(Icons.playlist_add_check), findsOneWidget);
      expect(find.byIcon(Icons.label), findsOneWidget);
      expect(find.byIcon(Icons.topic), findsOneWidget);

      // Check chevron icons (5 option cards)
      expect(find.byIcon(Icons.chevron_right), findsNWidgets(5));
    });
  });
}
