import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/config/router/routes_consts.dart';
import 'package:surf_places/feature/favorites/view/favorites_screen.dart';
import 'package:surf_places/feature/main/view/main_wrapper.dart';
import 'package:surf_places/feature/map/view/map_screen.dart';
import 'package:surf_places/feature/onboarding/view/onboarding_screen.dart';
import 'package:surf_places/feature/places/list/view/places_list_screen.dart';
import 'package:surf_places/feature/places/place/view/place_screen.dart';
import 'package:surf_places/feature/places/place/view/widgets/images_viewer.dart';
import 'package:surf_places/feature/places/search/filters/view/search_filters_screen.dart';
import 'package:surf_places/feature/places/search/view/places_search_screen.dart';
import 'package:surf_places/feature/settings/view/settings_screen.dart';
import 'package:surf_places/feature/splash/view/splash_screen.dart';

part 'routes.g.dart';

@TypedShellRoute<MainWrapperRoute>(
  routes: [
    TypedGoRoute<PlacesListRoute>(path: AppRoutesConsts.placesList),
    TypedGoRoute<PlacesSearchRoute>(path: AppRoutesConsts.placesSearch),
    TypedGoRoute<MapRoute>(path: AppRoutesConsts.map),
    TypedGoRoute<FavoritesRoute>(path: AppRoutesConsts.favorites),
    TypedGoRoute<SettingsRoute>(path: AppRoutesConsts.settings),
  ],
)
class MainWrapperRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainWrapper(child: navigator);
  }
}

@TypedGoRoute<PlacesListRoute>(path: AppRoutesConsts.placesList)
class PlacesListRoute extends GoRouteData with _$PlacesListRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const PlacesListScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<PlacesSearchRoute>(path: AppRoutesConsts.placesSearch)
class PlacesSearchRoute extends GoRouteData with _$PlacesSearchRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PlacesSearchScreen();
  }
}

@TypedGoRoute<MapRoute>(path: AppRoutesConsts.map)
class MapRoute extends GoRouteData with _$MapRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const MapScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<FavoritesRoute>(path: AppRoutesConsts.favorites)
class FavoritesRoute extends GoRouteData with _$FavoritesRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const FavoritesScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<SettingsRoute>(path: AppRoutesConsts.settings)
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const SettingsScreen(),
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}

@TypedGoRoute<PlaceRoute>(path: AppRoutesConsts.place)
class PlaceRoute extends GoRouteData with _$PlaceRoute {
  PlaceRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PlaceScreen(id: id);
  }
}

@TypedGoRoute<ImagesViewerRoute>(path: AppRoutesConsts.images)
class ImagesViewerRoute extends GoRouteData with _$ImagesViewerRoute {
  ImagesViewerRoute({required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ImagesViewer(images: images);
  }
}

@TypedGoRoute<OnboardingRoute>(path: AppRoutesConsts.onboarding)
class OnboardingRoute extends GoRouteData with _$OnboardingRoute {
  OnboardingRoute({this.fromSettings = false});
  final bool fromSettings;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OnboardingScreen(fromSettings: fromSettings);
  }
}

@TypedGoRoute<PlacesSearchFiltersRoute>(
  path: AppRoutesConsts.placesSearchFilters,
)
class PlacesSearchFiltersRoute extends GoRouteData
    with _$PlacesSearchFiltersRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchFiltersScreen();
  }
}

@TypedGoRoute<SplashRoute>(path: AppRoutesConsts.splash)
class SplashRoute extends GoRouteData with _$SplashRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SplashScreen();
  }
}
