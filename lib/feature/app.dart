import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/notifiers/theme_notifier.dart';
import 'package:surf_places/config/styles/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) => _App(),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final brightness = context.theme.themeMode == ThemeMode.dark
        ? Brightness.light
        : Brightness.dark;
    final color = context.theme.themeMode == ThemeMode.dark
        ? Colors.black
        : Colors.white;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: brightness,
      ),
      child: SafeArea(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          darkTheme: AppThemes.dark(context),
          theme: AppThemes.light(context),
          themeMode: context.theme.themeMode,
        ),
      ),
    );
  }
}
