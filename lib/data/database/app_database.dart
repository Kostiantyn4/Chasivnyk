import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'entities/task_entity.dart';

class AppDatabase {
  static Isar? _instance;
  static Future<Isar>? _openingFuture;

  static Future<Isar> getInstance() async {
    if (_instance != null) return _instance!;

    _openingFuture ??= _openInstance();
    _instance ??= await _openingFuture!;
    return _instance!;
  }

  static Future<Isar> _openInstance() async {
    final dir = await getApplicationDocumentsDirectory();

    return Isar.open(
      [TaskEntitySchema],
      directory: dir.path,
      name: 'chasivnyk_db',
    );
  }

  static Future<void> clearAll() async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }
}
