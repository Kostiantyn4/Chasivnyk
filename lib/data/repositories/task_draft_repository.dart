import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TaskDraftRepository {
  static const String _draftKey = 'task_creation_draft';

  Future<void> saveDraft(Map<String, dynamic> draft) async {
    final prefs = await SharedPreferences.getInstance();
    final draftJson = jsonEncode(draft);
    await prefs.setString(_draftKey, draftJson);
  }

  Future<Map<String, dynamic>?> loadDraft() async {
    final prefs = await SharedPreferences.getInstance();
    final draftJson = prefs.getString(_draftKey);
    
    if (draftJson == null) return null;
    
    try {
      return jsonDecode(draftJson) as Map<String, dynamic>;
    } catch (e) {
      // Invalid JSON - clear it
      await clearDraft();
      return null;
    }
  }

  Future<void> clearDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_draftKey);
  }

  Future<bool> hasDraft() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_draftKey);
  }
}
