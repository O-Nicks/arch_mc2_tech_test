import 'package:arch_mc2_tech_test/core/errors/failures.dart';
import 'package:arch_mc2_tech_test/features/weather/data/datasource/api_weather_ds.dart';
import 'package:arch_mc2_tech_test/features/weather/data/datasource/csv_weather_ds.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

final class WeatherRepositoryImpl implements WeatherRepository {
  final CsvWeatherDS? csv;
  final ApiWeatherDS? api;
  WeatherRepositoryImpl.csv(this.csv) : api = null;
  WeatherRepositoryImpl.api(this.api) : csv = null;

  @override
  Future<Either<Failure, (CurrentWeather, List<HourlyForecast>)>> loadAll() async {
    try {
      if (csv != null) {
        final r = await csv!.load();
        return Right(r);
      } else {
        final r = await api!.load();
        return Right(r);
      }
    } on DioException catch (e) {
      return const Left(NetworkFailure('Network/API error'));
    } on FormatException catch (_) {
      return const Left(ParseFailure('CSV/JSON parse error'));
    } catch (_) {
      return const Left(UnknownFailure('Unknown error'));
    }
  }
}