part of "../weather_app.dart";

abstract final class Routes {
  static const mainScreen = '/main_screen';
}

final _router = GoRouter(
  initialLocation: Routes.mainScreen,
  routes: [
    GoRoute(
      path: Routes.mainScreen,
      name: Routes.mainScreen,
      builder: (_, __) => const MainScreen(),
    ),
  ],
);
