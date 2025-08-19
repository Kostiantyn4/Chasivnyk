// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get greetingMessage => 'Welcome';

  @override
  String get username => 'Maxim';

  @override
  String get todayTasksTitle => 'Today\'s Tasks';

  @override
  String get addTaskButton => 'Add task';

  @override
  String get meetingWithAlexander => 'Meeting with Alexander';

  @override
  String get lunch => 'Lunch';

  @override
  String get workOnProject => 'Work on project';

  @override
  String get timelineTab => 'Timeline';

  @override
  String get foldersTab => 'Folders';

  @override
  String get settingsTab => 'Settings';

  @override
  String get projectsTab => 'Projects';

  @override
  String get progressTab => 'Progress';

  @override
  String currentDate(String date) {
    return '$date';
  }

  @override
  String get calendar => 'Calendar';

  @override
  String get timeline => 'Timeline';

  @override
  String get projects => 'Projects';

  @override
  String get progress => 'Progress';
}
