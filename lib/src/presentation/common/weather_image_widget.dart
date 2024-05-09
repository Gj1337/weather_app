import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/src/domain/entity/weather_state.dart';

const _sun = 'assets/image/weather_state/sun.svg';
const _moon = 'assets/image/weather_state/moon.svg';
const _cloud = 'assets/image/weather_state/cloud.svg';
const _rain = 'assets/image/weather_state/rain.svg';
const _snow = 'assets/image/weather_state/snow.svg';
const _thunderstorm = 'assets/image/weather_state/thunderstorm.svg';
const _fog = 'assets/image/weather_state/fog.svg';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({
    super.key,
    required this.weatherState,
    this.isDay = true,
  });

  final WeatherState weatherState;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    final asset = switch (weatherState) {
      WeatherState.clearSky => isDay ? _sun : _moon,
      WeatherState.mainlyClearSky => isDay ? _sun : _moon,
      WeatherState.partlyCloudy => _cloud,
      WeatherState.overcast => _cloud,
      WeatherState.fog => _fog,
      WeatherState.depositingRimeFog => _fog,
      WeatherState.lightDrizzle => _rain,
      WeatherState.moderateDrizzle => _rain,
      WeatherState.denseIntensityDrizzle => _rain,
      WeatherState.lightFreezingDrizzle => _rain,
      WeatherState.heavyFreezingDrizzle => _rain,
      WeatherState.slightRain => _rain,
      WeatherState.moderateRain => _rain,
      WeatherState.heavyIntensityRain => _rain,
      WeatherState.lightFreezingRain => _rain,
      WeatherState.heavyIntensityFreezingRain => _rain,
      WeatherState.slightSnowFall => _snow,
      WeatherState.moderateSnowFall => _snow,
      WeatherState.heavyIntensitySnowFall => _snow,
      WeatherState.snowGrains => _snow,
      WeatherState.slightRainShowers => _rain,
      WeatherState.moderateRainShowers => _rain,
      WeatherState.violentRainShowers => _rain,
      WeatherState.lisghtSnowShowers => _snow,
      WeatherState.heavySnowShowers => _snow,
      WeatherState.thunderstorm => _thunderstorm,
      WeatherState.thunderstormWithSlightHail => _thunderstorm,
      WeatherState.thunderstormWithHeavyHail => _thunderstorm,
    };

    final colorFilter = ColorFilter.mode(
        Theme.of(context).colorScheme.primary, BlendMode.srcIn);

    return SvgPicture.asset(asset, colorFilter: colorFilter);
  }
}
