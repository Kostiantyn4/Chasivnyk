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

  @override
  String get newTask => 'Нове завдання';

  @override
  String get taskNameLabel => 'Назва завдання';

  @override
  String get taskNameHint => 'Наприклад, розробити дизайн...';

  @override
  String get taskDetailsLabel => 'Деталі завдання';

  @override
  String get taskDetailsHint => 'Додайте більше інформації про завдання...';

  @override
  String get dueTimeOption => 'Час на виконання';

  @override
  String get dueTimeNotSet => 'Не встановлено';

  @override
  String get remindersOption => 'Нагадування';

  @override
  String get remindersNone => 'Відсутні';

  @override
  String get subtasksOption => 'Підзавдання';

  @override
  String get subtasksNone => 'Немає';

  @override
  String get tagsOption => 'Теги';

  @override
  String get tagsNone => 'Немає';

  @override
  String get projectOption => 'Проєкт';

  @override
  String get projectNotSelected => 'Не обрано';

  @override
  String get newProject => 'Новий проєкт';

  @override
  String get projectNameLabel => 'Назва проєкту';

  @override
  String get projectNameHint => 'Наприклад, Переїзд';

  @override
  String get projectDescriptionLabel => 'Опис';

  @override
  String get projectDescriptionHint => 'Додайте контекст до проєкту';

  @override
  String get projectTagsLabel => 'Теги';

  @override
  String get projectTagsHint => 'Натисніть Enter, щоб додати тег';

  @override
  String get projectTagsEmpty => 'Ще немає тегів';

  @override
  String get projectNameRequired => 'Назва проєкту не може бути порожньою';

  @override
  String get projectCreated => 'Проєкт створено';

  @override
  String get selectProjectTitle => 'Оберіть проєкт';

  @override
  String get clearProjectSelection => 'Без проєкту';

  @override
  String get saveButton => 'Зберегти';

  @override
  String get editTaskTitle => 'Редагувати задачу';

  @override
  String get discardChangesTitle => 'Скасувати зміни?';

  @override
  String get discardChangesMessage =>
      'Чернетка збережена. Ви зможете продовжити пізніше.';

  @override
  String get discardChangesMessageNoSave => 'Незбережені зміни будуть втрачені';

  @override
  String get continueEditing => 'Продовжити';

  @override
  String get discard => 'Закрити';

  @override
  String get taskCreated => 'Завдання створено';

  @override
  String get taskUpdated => 'Task updated';

  @override
  String get deleteButton => 'Delete';

  @override
  String get deleteTaskConfirmation => 'This task has subtasks. Delete anyway?';

  @override
  String get taskDeleted => 'Task deleted';

  @override
  String get draftSaved => 'Чернетка збережена';

  @override
  String get draftRestored => 'Чернетку відновлено';

  @override
  String get taskNameRequired => 'Назва завдання не може бути порожньою';

  @override
  String get errorPrefix => 'Помилка';

  @override
  String get completedTasksTitle => 'Завершені';

  @override
  String get projectsScreenTitle => 'Проєкти';

  @override
  String get projectsAddProject => 'Додати проєкт';

  @override
  String projectProgressLabel(int done, int total) {
    return '$done з $total завдань';
  }

  @override
  String get projectSampleGiftForAlina => 'Подарунок для Аліни';

  @override
  String get projectSampleTripToCarpathians => 'Подорож у Карпати';

  @override
  String get projectSampleGiftForMark => 'Подарунок для Марка';

  @override
  String get projectsEmptyTitle => 'Поки що немає проєктів';

  @override
  String get projectsEmptySubtitle => 'Натисніть +, щоб створити перший';
}
