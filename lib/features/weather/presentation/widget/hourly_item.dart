import 'package:arch_mc2_tech_test/features/weather/domain/entities/hourly_forcast_entity.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/functions.dart';
import 'package:arch_mc2_tech_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyItem extends StatelessWidget {
  final HourlyForecast h;
  const HourlyItem({super.key, required this.h});
  @override



  Widget build(BuildContext context) {

    final time = DateFormat.Hm().format(h.time);
    return ListTile(
      dense: true,
      leading: Text(time),
      title: Text(
        localizeCondition(context, h.condition)),
        trailing: Text('${h.tempC.toStringAsFixed(0)}°C'
        ),
    );
  }
}