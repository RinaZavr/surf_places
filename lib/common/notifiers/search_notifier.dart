import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier {
  String? _query;

  String? get query => _query;

  List<String> _filters = [];

  List<String> get filters => _filters;

  void changeQuery({required String? query}) {
    _query = query;
    notifyListeners();
  }

  void changeFilters({required List<String> filters}) {
    _filters = filters;
    notifyListeners();
  }
}
