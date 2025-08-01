import 'package:flutter/material.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.theme.changeTheme(themeMode: ThemeMode.dark);
            },
            child: Text('Dark theme', style: context.textExt.label),
          ),
          TextButton(
            onPressed: () {
              context.theme.changeTheme(themeMode: ThemeMode.light);
            },
            child: Text('Light theme', style: context.textExt.label),
          ),
          TextButton(
            onPressed: () {
              context.theme.changeTheme(themeMode: ThemeMode.system);
            },
            child: Text('System theme', style: context.textExt.label),
          ),
        ],
      ),
    );
  }
}
