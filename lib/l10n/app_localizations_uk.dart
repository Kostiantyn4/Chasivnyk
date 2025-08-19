// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get greetingMessage => 'Вітаю';

  @override
  String get username => 'Максим';

  @override
  String get todayTasksTitle => 'Завдання на сьогодні';

  @override
  String get addTaskButton => 'Додати завдання';

  @override
  String get meetingWithAlexander => 'Зустріч з Александром';

  @override
  String get lunch => 'Обід';

  @override
  String get workOnProject => 'Працювати над проєктом';

  @override
  String get timelineTab => 'Таймлайн';

  @override
  String get foldersTab => 'Папки';

  @override
  String get settingsTab => 'Налаштування';

  @override
  String get projectsTab => 'Проєкти';

  @override
  String get progressTab => 'Прогрес';

  @override
  String currentDate(String date) {
    return '$date';
  }

  @override
  String get calendar => 'Календар';

  @override
  String get timeline => 'Стрічка';

  @override
  String get projects => 'Проєкти';

  @override
  String get progress => 'Прогрес';
}
