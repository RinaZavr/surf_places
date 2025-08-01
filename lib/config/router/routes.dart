import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surf_places/config/router/routes_consts.dart';
import 'package:surf_places/feature/test.dart';

part 'routes.g.dart';

@TypedGoRoute<TestRoute>(path: AppRoutesConsts.test)
class TestRoute extends GoRouteData with _$TestRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TestScreen();
  }
}
