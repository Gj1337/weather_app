import 'package:flutter/material.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO: hide behind the splash screen
  await initDi();

  return runApp(const WeatherApp());
}
