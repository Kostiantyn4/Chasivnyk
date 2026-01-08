import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskOrderRepository {
  static const _storagePrefix = 'task_order_';

  Future<List<String>> loadOrder(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _buildKey(date);
    return prefs.getStringList(key) ?? <String>[];
  }

  Future<void> saveOrder(DateTime date, List<String> order) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _buildKey(date);
    await prefs.setStringList(key, order);
  }

  String _buildKey(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return '$_storagePrefix${formatter.format(date)}';
  }
}
