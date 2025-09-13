import 'package:arch_mc2_tech_test/features/weather/domain/entities/current_weather_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/functions.dart';
import 'package:flutter/material.dart';

class CurrentPanel extends StatelessWidget {
  final CurrentWeather current;
  const CurrentPanel({super.key, required this.current});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${current.tempC.toStringAsFixed(1)}°C', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(width: 16),
          Text(localizeCondition(context, current.condition), style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}