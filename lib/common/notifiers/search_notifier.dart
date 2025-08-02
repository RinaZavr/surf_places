import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier {
  String? _query;

  String? get query => _query;

  void changeQuery({required String? query}) {
    _query = query;
    notifyListeners();
  }
}
