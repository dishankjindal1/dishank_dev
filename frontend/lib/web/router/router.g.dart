// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $landingPageRouteDate,
    ];

RouteBase get $landingPageRouteDate => GoRouteData.$route(
      path: '/',
      factory: $LandingPageRouteDateExtension._fromState,
    );

extension $LandingPageRouteDateExtension on LandingPageRouteDate {
  static LandingPageRouteDate _fromState(GoRouterState state) =>
      const LandingPageRouteDate();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
