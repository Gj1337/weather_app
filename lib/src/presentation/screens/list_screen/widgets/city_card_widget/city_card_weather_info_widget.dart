import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';
import 'package:weather_app/src/presentation/common/weather_image_widget.dart';
import 'package:weather_app/src/utils/weather_state_tranlsation.dart';

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
              ],
            ),
            const SizedBox(height: 10),
            Text(
              trWeatherState(simpleWeather.simpleWeatherValues.weatherState),
            )
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: WeatherImageWidget(
                    weatherState:
                        simpleWeather.simpleWeatherValues.weatherState,
                    isDay: simpleWeather.simpleWeatherValues.isDay,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.centerRight,
                  width: 100,
                  child: Text(
                    simpleWeather.temperatureText,
                    style: temperatureTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
