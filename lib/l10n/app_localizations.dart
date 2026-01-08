import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// No description provided for @greetingMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get greetingMessage;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Maxim'**
  String get username;

  /// No description provided for @todayTasksTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Tasks'**
  String get todayTasksTitle;

  /// No description provided for @addTaskButton.
  ///
  /// In en, this message translates to:
  /// **'Add task'**
  String get addTaskButton;

  /// No description provided for @meetingWithAlexander.
  ///
  /// In en, this message translates to:
  /// **'Meeting with Alexander'**
  String get meetingWithAlexander;

  /// No description provided for @lunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// No description provided for @workOnProject.
  ///
  /// In en, this message translates to:
  /// **'Work on project'**
  String get workOnProject;

  /// No description provided for @timelineTab.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timelineTab;

  /// No description provided for @foldersTab.
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get foldersTab;

  /// No description provided for @settingsTab.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTab;

  /// No description provided for @projectsTab.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projectsTab;

  /// No description provided for @progressTab.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressTab;

  /// No description provided for @currentDate.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String currentDate(String date);

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @timeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timeline;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @newTask.
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get newTask;

  /// No description provided for @taskNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Task Name'**
  String get taskNameLabel;

  /// No description provided for @taskNameHint.
  ///
  /// In en, this message translates to:
  /// **'For example, develop design...'**
  String get taskNameHint;

  /// No description provided for @taskDetailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Task Details'**
  String get taskDetailsLabel;

  /// No description provided for @taskDetailsHint.
  ///
  /// In en, this message translates to:
  /// **'Add more information about the task...'**
  String get taskDetailsHint;

  /// No description provided for @dueTimeOption.
  ///
  /// In en, this message translates to:
  /// **'Due Time'**
  String get dueTimeOption;

  /// No description provided for @dueTimeNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get dueTimeNotSet;

  /// No description provided for @remindersOption.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get remindersOption;

  /// No description provided for @remindersNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get remindersNone;

  /// No description provided for @subtasksOption.
  ///
  /// In en, this message translates to:
  /// **'Subtasks'**
  String get subtasksOption;

  /// No description provided for @subtasksNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get subtasksNone;

  /// No description provided for @tagsOption.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tagsOption;

  /// No description provided for @tagsNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get tagsNone;

  /// No description provided for @projectOption.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get projectOption;

  /// No description provided for @projectNotSelected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get projectNotSelected;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @discardChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get discardChangesTitle;

  /// No description provided for @discardChangesMessage.
  ///
  /// In en, this message translates to:
  /// **'Draft saved. You can continue later.'**
  String get discardChangesMessage;

  /// No description provided for @discardChangesMessageNoSave.
  ///
  /// In en, this message translates to:
  /// **'Unsaved changes will be lost'**
  String get discardChangesMessageNoSave;

  /// No description provided for @continueEditing.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueEditing;

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get discard;

  /// No description provided for @taskCreated.
  ///
  /// In en, this message translates to:
  /// **'Task created'**
  String get taskCreated;

  /// No description provided for @taskUpdated.
  ///
  /// In en, this message translates to:
  /// **'Task updated'**
  String get taskUpdated;

  /// No description provided for @deleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButton;

  /// No description provided for @deleteTaskConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This task has subtasks. Delete anyway?'**
  String get deleteTaskConfirmation;

  /// No description provided for @taskDeleted.
  ///
  /// In en, this message translates to:
  /// **'Task deleted'**
  String get taskDeleted;

  /// No description provided for @draftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft saved'**
  String get draftSaved;

  /// No description provided for @draftRestored.
  ///
  /// In en, this message translates to:
  /// **'Draft restored'**
  String get draftRestored;

  /// No description provided for @taskNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Task name cannot be empty'**
  String get taskNameRequired;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorPrefix;

  /// No description provided for @completedTasksTitle.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedTasksTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
