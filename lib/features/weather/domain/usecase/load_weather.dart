import 'package:arch_mc2_tech_test/core/errors/failures.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/repository/weather_repository.dart';
import 'package:fpdart/fpdart.dart';

final class LoadWeather {
  final WeatherRepository repo;
  LoadWeather(this.repo);

  Future<Either<Failure, (CurrentWeather, List<HourlyForecast>)>> call() => repo.loadAll();
}