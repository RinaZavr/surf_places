import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_places/config/repositories/settings_repository.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    _themeMode = GetIt.I.get<SettingsRepository>().getTheme();
  }

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeTheme({required ThemeMode themeMode}) {
    _themeMode = themeMode;
    GetIt.I.get<SettingsRepository>().saveTheme(themeMode);
    notifyListeners();
  }
}
