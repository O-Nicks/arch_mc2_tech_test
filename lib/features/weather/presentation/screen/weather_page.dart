import 'package:arch_mc2_tech_test/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/bloc/weather_event.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/bloc/weather_state.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/widget/current_panel.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/widget/hourly_item.dart';
import 'package:arch_mc2_tech_test/features/weather/presentation/widget/metric_row.dart';
import 'package:arch_mc2_tech_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});
  @override State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(LoadWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (_, s) {
            if (s is WeatherLoading || s is WeatherInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (s is WeatherError) {
              return Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(s.message),
                  const SizedBox(height: 8),
                  FilledButton(onPressed: () => context.read<WeatherBloc>().add(LoadWeatherEvent()), child: const Text('Retry')),
                ]),
              );
            }
            final w = (s as WeatherLoaded);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text(l10n.appTitle)
                ),
                SliverToBoxAdapter(child: CurrentPanel(current: w.current)),
                SliverToBoxAdapter(child: MetricRow(current: w.current)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  sliver: SliverToBoxAdapter(
                    child: Text(l10n.hourly, style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
                SliverList.builder(
                  itemCount: w.hourly.length,
                  itemBuilder: (_, i) => HourlyItem(h: w.hourly[i]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}