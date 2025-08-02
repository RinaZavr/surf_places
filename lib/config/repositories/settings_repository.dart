import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SettingsRepository({required this.prefs});

  final SharedPreferences prefs;

  final String themeKey = 'theme';
  final String onboardingKey = 'onboarding';

  Future<void> saveTheme(ThemeMode mode) async {
    await prefs.setString(themeKey, mode.name);
  }

  ThemeMode getTheme() {
    final theme = prefs.getString(themeKey) ?? ThemeMode.system.name;
    return ThemeMode.values.firstWhere((element) => element.name == theme);
  }

  Future<void> saveOnboarding() async {
    await prefs.setBool(onboardingKey, true);
  }

  bool getOnboarding() => prefs.getBool(onboardingKey) ?? false;
}
