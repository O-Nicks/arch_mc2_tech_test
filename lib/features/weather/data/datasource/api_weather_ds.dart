import 'package:arch_mc2_tech_test/features/weather/data/model/weather_models.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:dio/dio.dart';

final class ApiWeatherDS {
  final Dio dio;
  ApiWeatherDS(this.dio);

  Future<(CurrentWeather, List<HourlyForecast>)> load() async {
    final res = await dio.get('/weather');
    final map = res.data as Map;
    final current = currentFromMap(map['current'] as Map);
    final hours = (map['hourly'] as List).cast<Map>().map((m) => HourlyForecast(
      time: DateTime.parse(m['time'] as String),
      tempC: (m['temp_c'] as num).toDouble(),
      condition: m['condition'] as String,
    )).toList();
    return (current, hours);
  }
}