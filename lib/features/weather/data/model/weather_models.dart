import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';

CurrentWeather currentFromMap(Map m) => CurrentWeather(
  tempC: (m['temp_c'] as num).toDouble(),
  condition: m['condition'] as String,
  humidity: m['humidity'] as int,
  uvIndex: (m['uv'] as num).toDouble(),
  aqi: m['aqi'] as int,
  windKph: (m['wind_kph'] as num).toDouble(),
);

HourlyRow toHour(Map m) => HourlyRow(
  time: DateTime.parse(m['time'] as String),
  tempC: (m['temp_c'] as num).toDouble(),
  condition: m['condition'] as String,
);

class HourlyRow extends HourlyForecast {
  HourlyRow({required super.time, required super.tempC, required super.condition});
}