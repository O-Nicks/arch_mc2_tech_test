import 'package:arch_mc2_tech_test/features/weather/domain/usecase/load_weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';

final class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final LoadWeather load;
  WeatherBloc(this.load): super(WeatherInitial()){
    on<LoadWeatherEvent>((e, emit) async {
      emit(WeatherLoading());
      final result = await load();
      result.fold(
        (f) => emit(WeatherError(f.message ?? 'Error')),
        (data) {
          final (current, hourly) = data;
          emit(WeatherLoaded(current: current, hourly: hourly));
        }
      );
    });
  }
}