import 'package:arch_mc2_tech_test/features/weather/data/model/weather_models.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:csv/csv.dart';

typedef AssetReader = Future<String> Function(String assetPath);

final class CsvWeatherDS {
  final AssetReader readAsset;
  CsvWeatherDS(this.readAsset);

  Future<(CurrentWeather, List<HourlyForecast>)> load() async {
    final nowCsv = await readAsset('assets/data/current.csv');
    final hourlyCsv = await readAsset('assets/data/hourly.csv');

    final currentRows = const CsvToListConverter(eol: '\n').convert(nowCsv, shouldParseNumbers: true);
    final hourlyRows = const CsvToListConverter(eol: '\n').convert(hourlyCsv, shouldParseNumbers: true);

    // current.csv header: temp_c,condition,humidity,uv,aqi,wind_kph
    final c = {
      'temp_c': currentRows[1][0],
      'condition': currentRows[1][1],
      'humidity': currentRows[1][2],
      'uv': currentRows[1][3],
      'aqi': currentRows[1][4],
      'wind_kph': currentRows[1][5],
    };
    final current = currentFromMap(c);

    // hourly.csv header: time_iso,temp_c,condition (72 lignes)
    final list = <HourlyForecast>[];
    for (var i = 1; i < hourlyRows.length; i++) {
      final r = hourlyRows[i];
      list.add(HourlyForecast(
        time: DateTime.parse(r[0] as String),
        tempC: (r[1] as num).toDouble(),
        condition: r[2] as String,
      ));
    }
    return (current, list);
  }
}