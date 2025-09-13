import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:arch_mc2_tech_test/features/weather/data/datasource/api_weather_ds.dart';
import 'package:arch_mc2_tech_test/features/weather/data/datasource/csv_weather_ds.dart';
import 'package:arch_mc2_tech_test/features/weather/data/repository/weather_repository_impl.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/repository/weather_repository.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/usecase/load_weather.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/bloc/weather_bloc.dart';

final GetIt slInstance = GetIt.instance;

void resetAndRegister({
  required bool useCsv,
  required Future<String> Function(String asset) assetReader,
  String baseUrl = 'http://127.0.0.1:8080',
}) {
  slInstance.reset();

  slInstance.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: baseUrl)),
  );

  if (useCsv) {
    slInstance.registerLazySingleton<CsvWeatherDS>(
      () => CsvWeatherDS(assetReader),
    );
    slInstance.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl.csv(slInstance<CsvWeatherDS>()),
    );
  } else {
    slInstance.registerLazySingleton<ApiWeatherDS>(
      () => ApiWeatherDS(slInstance<Dio>()),
    );
    slInstance.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl.api(slInstance<ApiWeatherDS>()),
    );
  }

  // Use case
  slInstance.registerLazySingleton<LoadWeather>(
    () => LoadWeather(slInstance<WeatherRepository>()),
  );

  slInstance.registerFactory<WeatherBloc>(
    () => WeatherBloc(slInstance<LoadWeather>()),
  );
}