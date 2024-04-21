import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/weather_app.dart';

void main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await initDi();

  FlutterNativeSplash.remove();

  return runApp(const WeatherApp());
}
