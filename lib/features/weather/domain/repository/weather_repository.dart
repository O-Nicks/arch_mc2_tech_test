import 'package:arch_mc2_tech_test/core/errors/failures.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, (CurrentWeather current, List<HourlyForecast> hourly)>> loadAll();
}