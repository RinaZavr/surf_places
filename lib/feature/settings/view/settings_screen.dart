import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки', style: context.textExt.subtitle),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Темная тема', style: context.textExt.text),
                  CupertinoSwitch(
                    value: context.theme.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      context.theme.changeTheme(
                        themeMode: value ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(color: context.colorExt.trinityColor),
            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 12, top: 12),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Смотреть туториал', style: context.textExt.text),
                    CustomSvgIcon(
                      icon: AppIcons.info,
                      color: context.colorExt.accentColor,
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: context.colorExt.trinityColor),
          ],
        ),
      ),
    );
  }
}
