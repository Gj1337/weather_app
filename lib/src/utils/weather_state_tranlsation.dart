import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/domain/entity/weather_state.dart';

String trWeatherState(WeatherState weatherState) => switch (weatherState) {
      WeatherState.clearSky => LocaleKeys.weather_state_clearSky.tr(),
      WeatherState.mainlyClearSky =>
        LocaleKeys.weather_state_mainlyClearSky.tr(),
      WeatherState.partlyCloudy => LocaleKeys.weather_state_partlyCloudy.tr(),
      WeatherState.overcast => LocaleKeys.weather_state_overcast.tr(),
      WeatherState.fog => LocaleKeys.weather_state_clearSky.tr(),
      WeatherState.depositingRimeFog =>
        LocaleKeys.weather_state_depositingRimeFog.tr(),
      WeatherState.lightDrizzle => LocaleKeys.weather_state_lightDrizzle.tr(),
      WeatherState.moderateDrizzle =>
        LocaleKeys.weather_state_moderateDrizzle.tr(),
      WeatherState.denseIntensityDrizzle =>
        LocaleKeys.weather_state_denseIntensityDrizzle.tr(),
      WeatherState.lightFreezingDrizzle =>
        LocaleKeys.weather_state_lightFreezingDrizzle.tr(),
      WeatherState.heavyFreezingDrizzle =>
        LocaleKeys.weather_state_clearSky.tr(),
      WeatherState.slightRain => LocaleKeys.weather_state_slightRain.tr(),
      WeatherState.moderateRain => LocaleKeys.weather_state_moderateRain.tr(),
      WeatherState.heavyIntensityRain =>
        LocaleKeys.weather_state_heavyIntensityRain.tr(),
      WeatherState.lightFreezingRain =>
        LocaleKeys.weather_state_lightFreezingRain.tr(),
      WeatherState.heavyIntensityFreezingRain =>
        LocaleKeys.weather_state_heavyIntensityFreezingRain.tr(),
      WeatherState.slightSnowFall =>
        LocaleKeys.weather_state_slightSnowFall.tr(),
      WeatherState.moderateSnowFall =>
        LocaleKeys.weather_state_moderateSnowFall.tr(),
      WeatherState.heavyIntensitySnowFall =>
        LocaleKeys.weather_state_heavyIntensitySnowFall.tr(),
      WeatherState.snowGrains => LocaleKeys.weather_state_snowGrains.tr(),
      WeatherState.slightRainShowers =>
        LocaleKeys.weather_state_slightRainShowers.tr(),
      WeatherState.moderateRainShowers =>
        LocaleKeys.weather_state_moderateRainShowers.tr(),
      WeatherState.violentRainShowers =>
        LocaleKeys.weather_state_violentRainShowers.tr(),
      WeatherState.lisghtSnowShowers =>
        LocaleKeys.weather_state_lisghtSnowShowers.tr(),
      WeatherState.heavySnowShowers =>
        LocaleKeys.weather_state_heavySnowShowers.tr(),
      WeatherState.thunderstorm => LocaleKeys.weather_state_thunderstorm.tr(),
      WeatherState.thunderstormWithSlightHail =>
        LocaleKeys.weather_state_thunderstormWithSlightHail.tr(),
      WeatherState.thunderstormWithHeavyHail =>
        LocaleKeys.weather_state_thunderstormWithHeavyHail.tr(),
    };
