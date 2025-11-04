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

  @override
  String get newTask => 'New Task';

  @override
  String get taskNameLabel => 'Task Name';

  @override
  String get taskNameHint => 'For example, develop design...';

  @override
  String get taskDetailsLabel => 'Task Details';

  @override
  String get taskDetailsHint => 'Add more information about the task...';

  @override
  String get dueTimeOption => 'Due Time';

  @override
  String get dueTimeNotSet => 'Not set';

  @override
  String get remindersOption => 'Reminders';

  @override
  String get remindersNone => 'None';

  @override
  String get subtasksOption => 'Subtasks';

  @override
  String get subtasksNone => 'None';

  @override
  String get tagsOption => 'Tags';

  @override
  String get tagsNone => 'None';

  @override
  String get projectOption => 'Project';

  @override
  String get projectNotSelected => 'Not selected';

  @override
  String get saveButton => 'Save';

  @override
  String get discardChangesTitle => 'Discard changes?';

  @override
  String get discardChangesMessage => 'Draft saved. You can continue later.';

  @override
  String get discardChangesMessageNoSave => 'Unsaved changes will be lost';

  @override
  String get continueEditing => 'Continue';

  @override
  String get discard => 'Close';

  @override
  String get taskCreated => 'Task created';

  @override
  String get draftSaved => 'Draft saved';

  @override
  String get draftRestored => 'Draft restored';

  @override
  String get taskNameRequired => 'Task name cannot be empty';

  @override
  String get errorPrefix => 'Error';
}
