import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';

class CityCardWeatherInfoWidget extends StatelessWidget {
  const CityCardWeatherInfoWidget({
    super.key,
    required this.simpleWeather,
  });

  final SimpleWeather simpleWeather;

  @override
  Widget build(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;

    final temperatureTextStyle = TextStyle(
      color: colorSheme.primary,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

    final iconColor = colorSheme.secondary;

    final iconTextStyle = TextStyle(color: iconColor);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Icon(Icons.water_drop_outlined, color: iconColor),
            Text(simpleWeather.humidityText, style: iconTextStyle),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            Icon(Icons.air, color: iconColor),
            Text(simpleWeather.windSpeedText, style: iconTextStyle),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              simpleWeather.temperatureText,
              style: temperatureTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
