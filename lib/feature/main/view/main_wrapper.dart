import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/common/consts/icons_consts.dart';
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
      icon: AppIcons.wrapperList,
      selectedIcon: AppIcons.wrapperListSelected,
      location: PlacesListRoute().location,
    ),
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.wrapperMap,
      selectedIcon: AppIcons.wrapperMapSelected,
      location: MapRoute().location,
    ),
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.wrapperFavorites,
      selectedIcon: AppIcons.wrapperFavoritesSelected,
      location: FavoritesRoute().location,
    ),
    MainWrapperModel(
      id: UniqueKey().toString(),
      icon: AppIcons.wrapperSettings,
      selectedIcon: AppIcons.wrapperSettingsSelected,
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
                  ? SvgPicture.asset(item.selectedIcon)
                  : SvgPicture.asset(item.icon),
              label: '',
            ),
        ],
      ),
    );
  }
}
