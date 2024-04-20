import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/utils/logger_mixin.dart';

final class MainScreenStateNotifier extends StateNotifier<MainScreenState>
    with LoggerMixin {
  MainScreenStateNotifier(
    this._weatherRepository,
  ) : super(MainScreenState()) {
    onCreate();
  }

  final WeatherRepository _weatherRepository;

  Future<void> onCreate() async {
    logger.i('onCreate');
  }

  Future<void> onNewLocationChanged(Location location) async {
    logger.i('onNewLocationChanged ${location.name}');

    try {
      state = state.copyWith(
        fetchError: null,
        location: location,
      );

      final currentWeather =
          await _weatherRepository.getCurrentWeather(location: location);

      state = state.copyWith(currentWeather: currentWeather);
    } catch (exception) {
      logger.e('onNewLocationChanged catch $exception');

      state = state.copyWith(fetchError: LocaleKeys.errors_commonError.tr());
    }
  }
}
