import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/presentation/common/weather_image_widget.dart';
import 'package:weather_app/src/utils/weather_state_tranlsation.dart';

class WeatherForecastCard extends StatelessWidget {
  const WeatherForecastCard({
    super.key,
    required this.detailWeather,
    required this.location,
  });

  final DetailWeather detailWeather;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: WeatherImageWidget(
                    weatherState:
                        detailWeather.detailWeatherValues.currentWeatherState,
                    isDay: detailWeather.detailWeatherValues.isDay,
                  ),
                ),
                const SizedBox(width: 10),
                Text(detailWeather.temperatureText,
                    style: temperatureTextStyle),
              ],
            ),
            const SizedBox(height: 10),
            Text(trWeatherState(
                detailWeather.detailWeatherValues.currentWeatherState)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined, color: iconColor),
                    Text(detailWeather.humidityText, style: iconTextStyle),
                  ],
                ),
                const SizedBox(width: 15),
                Row(
                  children: [
                    Icon(Icons.air, color: iconColor),
                    Text(detailWeather.windSpeedText, style: iconTextStyle),
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
