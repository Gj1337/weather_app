import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/data/data_source/location_rest_client.dart';
import 'package:weather_app/src/data/data_source/weather_rest_client.dart';
import 'package:weather_app/src/data/repository/location_repostiry_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/src/data/repository/weather_repository_impl.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state_notifier.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/state_managment/pick_city_screen_state.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/state_managment/pick_city_screen_state_notifier.dart';

part 'providers.g.dart';

//DataSources
@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

@Riverpod(keepAlive: true)
LocationRestClient locationRestClient(LocationRestClientRef ref) =>
    LocationRestClient(
      ref.watch(dioProvider),
    );

@Riverpod(keepAlive: true)
WeatherRestClient weatherRestClient(WeatherRestClientRef ref) =>
    WeatherRestClient(
      ref.watch(dioProvider),
    );

//Reposes
@Riverpod(keepAlive: true)
NetworkLocationRepositoryImpl networkLocationRepository(
        NetworkLocationRepositoryRef ref) =>
    NetworkLocationRepositoryImpl(
      ref.watch(locationRestClientProvider),
    );

@Riverpod(keepAlive: true)
NetworkWeatherRepositoryImpl networkWeatherRepository(
        NetworkWeatherRepositoryRef ref) =>
    NetworkWeatherRepositoryImpl(
      ref.watch(weatherRestClientProvider),
    );

//State controllers
final pickCityScreenStateNotifierProvider = AutoDisposeStateNotifierProvider<
    PickCityScreenStateNotifier, PickCityScreenState>(
  (ref) => PickCityScreenStateNotifier(
    ref.watch(networkLocationRepositoryProvider),
  ),
);

final mainScreenStateNotifierProvider =
    StateNotifierProvider<MainScreenStateNotifier, MainScreenState>(
  (ref) => MainScreenStateNotifier(
    ref.watch(networkWeatherRepositoryProvider),
  ),
);
