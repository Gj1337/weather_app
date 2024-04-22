import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/data/data_source/location_cache_client.dart';
import 'package:weather_app/src/data/data_source/location_rest_client.dart';
import 'package:weather_app/src/data/data_source/weather_cache_client.dart';
import 'package:weather_app/src/data/data_source/weather_rest_client.dart';
import 'package:weather_app/src/data/repository/location_repostiry_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/data/repository/weather_repository_impl.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state_notifier.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/state_managment/pick_city_screen_state.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/state_managment/pick_city_screen_state_notifier.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/state_managment/settings_notifier.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/state_managment/settings_state.dart';

part 'providers.g.dart';

Future<void> initDi() async {
  _sharedPreferences = await SharedPreferences.getInstance();
}

//DataSources
@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

late final SharedPreferences _sharedPreferences;

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    _sharedPreferences;

@Riverpod(keepAlive: true)
LocationRestClient locationRestClient(LocationRestClientRef ref) =>
    LocationRestClient(
      ref.watch(dioProvider),
    );

@Riverpod(keepAlive: true)
LocationCacheClient locationCacheClient(LocationCacheClientRef ref) =>
    LocationCacheClient(
      ref.watch(sharedPreferencesProvider),
    );

@Riverpod(keepAlive: true)
WeatherRestClient weatherRestClient(WeatherRestClientRef ref) =>
    WeatherRestClient(
      ref.watch(dioProvider),
    );

@Riverpod(keepAlive: true)
WeatherCacheClient weatherCacheClient(WeatherCacheClientRef ref) =>
    WeatherCacheClient(
      ref.watch(sharedPreferencesProvider),
    );

//Reposes
@Riverpod(keepAlive: true)
LocationRepositoryImpl locationRepository(LocationRepositoryRef ref) =>
    LocationRepositoryImpl(ref.watch(locationRestClientProvider),
        ref.watch(locationCacheClientProvider));

@Riverpod(keepAlive: true)
WeatherRepositoryImpl weatherRepository(WeatherRepositoryRef ref) =>
    WeatherRepositoryImpl(
      ref.watch(weatherRestClientProvider),
      ref.watch(weatherCacheClientProvider),
    );

//State controllers
final pickCityScreenStateNotifierProvider = AutoDisposeStateNotifierProvider<
    PickCityScreenStateNotifier, PickCityScreenState>(
  (ref) => PickCityScreenStateNotifier(
    ref.watch(locationRepositoryProvider),
  ),
);

final mainScreenStateNotifierProvider =
    StateNotifierProvider<MainScreenStateNotifier, MainScreenState>(
  (ref) => MainScreenStateNotifier(
    ref.watch(weatherRepositoryProvider),
    ref.watch(locationRepositoryProvider),
  ),
);

final settingsStateNotifierProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(
    ref.watch(sharedPreferencesProvider),
  ),
);
