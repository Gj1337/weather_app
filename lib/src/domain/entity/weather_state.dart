import 'package:freezed_annotation/freezed_annotation.dart';

enum WeatherState {
  clearSky(0),
  mainlyClearSky(1),
  partlyCloudy(2),
  overcast(3),
  fog(45),
  depositingRimeFog(48),
  lightDrizzle(51),
  moderateDrizzle(53),
  denseIntensityDrizzle(55),
  lightFreezingDrizzle(56),
  heavyFreezingDrizzle(57),
  slightRain(61),
  moderateRain(63),
  heavyIntensityRain(65),
  lightFreezingRain(66),
  heavyIntensityFreezingRain(67),
  slightSnowFall(71),
  moderateSnowFall(73),
  heavyIntensitySnowFall(75),
  snowGrains(77),
  slightRainShowers(80),
  moderateRainShowers(81),
  violentRainShowers(82),
  lisghtSnowShowers(85),
  heavySnowShowers(86),
  thunderstorm(95),
  thunderstormWithSlightHail(96),
  thunderstormWithHeavyHail(99);

  final int code;

  const WeatherState(this.code);
}

class WeatherStateConverter implements JsonConverter<WeatherState, int> {
  const WeatherStateConverter();

  @override
  WeatherState fromJson(int json) =>
      WeatherState.values.firstWhere((element) => element.code == json);

  @override
  int toJson(WeatherState weatherState) => weatherState.code;
}
