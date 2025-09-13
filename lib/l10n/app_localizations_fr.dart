// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Météo';

  @override
  String get current => 'Actuel';

  @override
  String get humidity => 'Humidité';

  @override
  String get uvIndex => 'Indice UV';

  @override
  String get aqi => 'Qualité de l\'air';

  @override
  String get wind => 'Vent';

  @override
  String get hourly => 'Prochaines heures';

  @override
  String get cloudy => 'Nuageux';

  @override
  String get rain => 'Pluie';

  @override
  String get storm => 'Orage';

  @override
  String get sunny => 'Ensoleillé';
}
