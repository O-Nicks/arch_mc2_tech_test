// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Weather';

  @override
  String get current => 'Current';

  @override
  String get humidity => 'Humidity';

  @override
  String get uvIndex => 'UV Index';

  @override
  String get aqi => 'Air Quality';

  @override
  String get wind => 'Wind';

  @override
  String get hourly => 'Next hours';

  @override
  String get cloudy => 'Cloudy';

  @override
  String get rain => 'Rain';

  @override
  String get storm => 'Storm';

  @override
  String get sunny => 'Sunny';
}
