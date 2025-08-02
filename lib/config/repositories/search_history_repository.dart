import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryRepository {
  SearchHistoryRepository({required this.prefs});

  final SharedPreferences prefs;

  final String historyKey = 'search_history';

  List<String> history = [];

  Future<void> updateHistory({
    required String query,
    bool isDelete = false,
  }) async {
    if (isDelete) {
      history.remove(query);
      await prefs.setStringList(historyKey, history);
    } else if (!history.contains(query)) {
      history.add(query);
      await prefs.setStringList(historyKey, history);
    }
  }

  List<String> getHistory() {
    history = prefs.getStringList(historyKey) ?? [];
    return history;
  }

  Future<void> deleteHistory() async {
    await prefs.remove(historyKey);
  }
}
