import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/config/repositories/settings_repository.dart';
import 'package:surf_places/config/router/routes.dart';
import 'package:surf_places/config/router/routes_consts.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    observers: [TalkerRouteObserver(GetIt.I.get<Talker>())],
    routes: $appRoutes,
    redirect: (context, state) {
      final path = state.matchedLocation;
      final isProtected = [
        AppRoutesConsts.onboarding,
        AppRoutesConsts.placesList,
      ].contains(path);

      if (!isProtected) return null;

      final hasSeenOnboarding = GetIt.I
          .get<SettingsRepository>()
          .getOnboarding();

      final isGoingToOnboarding =
          state.matchedLocation == AppRoutesConsts.onboarding;
      final isManual =
          state.uri.queryParameters['from-settings'] == true.toString();

      // Если онбординг не просмотрен — направляем на него
      if (!hasSeenOnboarding && !isGoingToOnboarding) {
        return AppRoutesConsts.onboarding;
      }

      // Если онбординг уже просмотрен, и идём туда автоматически — редирект на список
      if (hasSeenOnboarding && isGoingToOnboarding && !isManual) {
        return AppRoutesConsts.placesList;
      }
      return null;
    },
    initialLocation: SplashRoute().location,
  );
}
