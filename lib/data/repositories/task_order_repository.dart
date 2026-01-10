import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskOrderRepository {
  static const _storagePrefix = 'task_order_';

  Future<List<String>> loadOrder(DateTime date, {String? projectId}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _buildKey(date, projectId);
    return prefs.getStringList(key) ?? <String>[];
  }

  Future<void> saveOrder(DateTime date, List<String> order, {String? projectId}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _buildKey(date, projectId);
    await prefs.setStringList(key, order);
  }

  String _buildKey(DateTime date, String? projectId) {
    final formatter = DateFormat('yyyy-MM-dd');
    final base = formatter.format(date);
    if (projectId == null || projectId.isEmpty) {
      return '$_storagePrefix$base';
    }
    return '$_storagePrefix${projectId}_$base';
  }
}
