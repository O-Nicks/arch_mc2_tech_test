import 'package:arch_mc2_tech_test/features/local/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:arch_mc2_tech_test/core/di/service_locator.dart';
import 'package:arch_mc2_tech_test/features/weather/domain/usecase/load_weather.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/screen/weather_page.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await resetAndRegister(useCsv: false, assetReader: rootBundle.loadString);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: WeatherBloc(slInstance<LoadWeather>())),
        BlocProvider(create: (_) => slInstance<LocaleCubit>()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (_, locale) => MaterialApp(
        locale: locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('fr')],
        home: const WeatherPage(),
      ),
    );
  }
}
