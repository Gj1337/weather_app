import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/entity/current_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';

class WeatherForecastCard extends StatelessWidget {
  const WeatherForecastCard({
    super.key,
    required this.currentWeather,
    required this.location,
  });

  final CurrentWeather currentWeather;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;

    final cityNameTextStyle = TextStyle(
      color: colorSheme.secondary,
      fontSize: 40,
    );

    final temperatureTextStyle = TextStyle(
      color: colorSheme.primary,
      fontSize: 80,
      fontWeight: FontWeight.bold,
    );

    final iconColor = colorSheme.secondary;

    final iconTextStyle = TextStyle(color: iconColor);

    return Card(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              location.name,
              style: cityNameTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(currentWeather.temperatureText, style: temperatureTextStyle),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined, color: iconColor),
                    Text(currentWeather.humidityText, style: iconTextStyle),
                  ],
                ),
                const SizedBox(width: 15),
                Row(
                  children: [
                    Icon(Icons.air, color: iconColor),
                    Text(currentWeather.windSpeedText, style: iconTextStyle),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
