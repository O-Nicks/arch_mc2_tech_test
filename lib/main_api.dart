import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:arch_mc2_tech_test/core/di/service_locator.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/usecase/load_weather.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/screen/weather_page.dart';

import 'l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  resetAndRegister(useCsv: false, assetReader: rootBundle.loadString);

  // ✅ récupère le usecase déjà enregistré, puis crée le bloc
  final weatherBloc = WeatherBloc(slInstance<LoadWeather>());

  // ✅ fournit le bloc par valeur : aucun appel à sl<WeatherBloc>() dans le build
  runApp(
    BlocProvider.value(
      value: weatherBloc,
      child: const App(),
    ),
  );

  // runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale = const Locale('fr'); // par défaut en anglais

  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }
  @override
  Widget build(BuildContext context) => MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: _locale,
    supportedLocales: const [Locale('en'), Locale('fr')],
    home: const WeatherPage(),
  );
}