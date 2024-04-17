part of "../weather_app.dart";

abstract final class Routes {
  static const mainScreen = '/main';
  static const listScreen = '/list';
  static const settingsScreen = '/settings';
}

final _router = GoRouter(
  initialLocation: Routes.mainScreen,
  routes: [
    ShellRoute(
      builder: (_, state, child) {
        return ButtonNavigationBarWrapper(
          path: state.fullPath,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: Routes.mainScreen,
          builder: (_, ___) => const MainScreen(),
        ),
        GoRoute(
          path: Routes.listScreen,
          builder: (_, ___) => const ListScreen(),
        ),
        GoRoute(
          path: Routes.settingsScreen,
          builder: (_, ___) => const SettingsScreen(),
        )
      ],
    ),
  ],
);
