import 'package:arch_mc2_tech_test/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

String localizeCondition(BuildContext context, String condition) {
  final l10n = AppLocalizations.of(context)!;
  switch (condition.toLowerCase()) {
    case 'sunny':
      return l10n.sunny;
    case 'cloudy':
      return l10n.cloudy;
    case 'rain':
      return l10n.rain;
    case 'storm':
      return l10n.storm;
    default:
      return condition;
  }
}