import '../task.dart';

abstract class TaskObserver {
  void onDeadlineApproaching(Task task);
  void onStatusChanged(Task task, TaskStatus newStatus);
}

class ReminderService {
  final List<TaskObserver> _observers = [];

  void addObserver(TaskObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(TaskObserver observer) {
    _observers.remove(observer);
  }

  void notifyDeadlineApproaching(Task task) {
    for (var observer in _observers) {
      observer.onDeadlineApproaching(task);
    }
  }

  void notifyStatusChanged(Task task, TaskStatus newStatus) {
    for (var observer in _observers) {
      observer.onStatusChanged(task, newStatus);
    }
  }
}
