import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/config/router/routes.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    observers: [TalkerRouteObserver(GetIt.I.get<Talker>())],
    routes: $appRoutes,
    initialLocation: TestRoute().location,
  );
}
