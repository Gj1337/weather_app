part of "../weather_app.dart";

typedef RouteInfo = ({String name, String path});

abstract final class Routes {
  static const RouteInfo mainScreen = (
    path: '/main',
    name: 'main',
  );
  static const RouteInfo listScreen = (
    path: '/list',
    name: 'list',
  );
  static const RouteInfo settingsScreen = (
    path: '/settings',
    name: '/settings',
  );
  static const RouteInfo pickCityScreen = (
    path: 'pickCity',
    name: 'pickCity',
  );
}

final _router = GoRouter(
  initialLocation: Routes.mainScreen.path,
  errorBuilder: (_, __) => const PageNotFoundWidget(),
  routes: [
    ShellRoute(
      builder: (_, state, child) {
        return SafeArea(
          child: ButtonNavigationBarWrapper(
            path: state.fullPath,
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
            path: Routes.mainScreen.path,
            name: Routes.mainScreen.name,
            builder: (_, ___) => const MainScreen(),
            routes: [
              GoRoute(
                path: Routes.pickCityScreen.path,
                name: Routes.pickCityScreen.name,
                builder: (_, ___) => const PickCityScreen(),
              )
            ]),
        GoRoute(
          path: Routes.listScreen.path,
          name: Routes.listScreen.name,
          builder: (_, ___) => const ListScreen(),
        ),
        GoRoute(
          path: Routes.settingsScreen.path,
          name: Routes.settingsScreen.name,
          builder: (_, ___) => const SettingsScreen(),
        )
      ],
    ),
  ],
);
