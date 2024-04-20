import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/presentation/common/bottom_navigation_bar_wrapper.dart';
import 'package:weather_app/src/presentation/common/localization_widget.dart';
import 'package:weather_app/src/presentation/common/page_not_found_widget.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/screens/list_screen/list_screen.dart';
import 'package:weather_app/src/presentation/screens/main_screen/main_screen.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/pick_city_screen.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/settings_screen.dart';

part "presentation/routes.dart";

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenSizeProviderWidget(
        child: LocalizationWidget(
          builder: (localizationContext) => MaterialApp.router(
            routerConfig: _router,
            localizationsDelegates: localizationContext.localizationDelegates,
            supportedLocales: localizationContext.supportedLocales,
            locale: localizationContext.locale,
          ),
        ),
      ),
    );
  }
}
