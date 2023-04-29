import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/landing/landing_page.dart';

part 'router.g.dart';

class MyRouter {
  const MyRouter._();

  static const MyRouter _instance = MyRouter._();

  static MyRouter of() => _instance;

  GoRouter get router => GoRouter(
        routes: $appRoutes,
      );

  static const String landingPagePath = '/';
}

@TypedGoRoute<LandingPageRouteDate>(path: MyRouter.landingPagePath)
class LandingPageRouteDate extends GoRouteData {
  const LandingPageRouteDate();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LandingPage();
  }
}
