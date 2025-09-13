import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:equatable/equatable.dart';
abstract class WeatherState extends Equatable { @override List<Object?> get props => []; }
class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final CurrentWeather current; final List<HourlyForecast> hourly;
  WeatherLoaded({required this.current, required this.hourly});
  @override List<Object?> get props => [current, hourly];
}
class WeatherError extends WeatherState { final String message; WeatherError(this.message); @override List<Object?> get props => [message]; }