import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MetricRow extends StatelessWidget {
  final CurrentWeather current;
  const MetricRow({super.key, required this.current});
  @override

  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    Widget tile(String label, String value, IconData icon) => Expanded(
      child: Column(children: [Icon(icon), const SizedBox(height: 4), Text(label), Text(value, style: const TextStyle(fontWeight: FontWeight.w600))]),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        tile(l10n.humidity, '${current.humidity}%', Icons.water_drop),
        tile(l10n.uvIndex, current.uvIndex.toStringAsFixed(1), Icons.wb_sunny),
        tile(l10n.aqi, '${current.aqi}', Icons.air),
        tile(l10n.wind, '${current.windKph.toStringAsFixed(0)} km/h', Icons.wind_power)
      ]),
    );
  }
}