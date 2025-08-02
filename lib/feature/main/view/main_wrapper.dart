import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/common/widgets/custom_svg_icon.dart';
import 'package:surf_places/config/router/routes.dart';
import 'package:surf_places/feature/main/data/main_wrapper_model.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({required this.child, super.key});

  final Widget child;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final List<MainWrapperModel> items = [
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.list,
      selectedIcon: AppIcons.listSelected,
      location: PlacesListRoute().location,
    ),
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.map,
      selectedIcon: AppIcons.mapSelected,
      location: MapRoute().location,
    ),
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.favorites,
      selectedIcon: AppIcons.favoritesSelected,
      location: FavoritesRoute().location,
    ),
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.settings,
      selectedIcon: AppIcons.settingsSelected,
      location: SettingsRoute().location,
    ),
  ];

  late MainWrapperModel selectedItem;

  @override
  void initState() {
    selectedItem = items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colorExt.primaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            selectedItem = items[value];
          });
          context.go(selectedItem.location);
        },
        items: [
          for (final item in items)
            BottomNavigationBarItem(
              icon: selectedItem.id == item.id
                  ? CustomSvgIcon(icon: item.selectedIcon)
                  : CustomSvgIcon(icon: item.icon),
              label: '',
            ),
        ],
      ),
    );
  }
}
