import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/weather_service.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/hourly_forecast_widget.dart';
import '../widgets/daily_forecast_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        weatherService: context.read<WeatherService>(),
      )..add(LoadWeather()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('날씨'),
        trailing: RefreshButton(),
      ),
      child: SafeArea(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            if (state is WeatherError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.exclamationmark_circle,
                      size: 48,
                      color: CupertinoColors.systemRed,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      style: const TextStyle(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton(
                      child: const Text('다시 시도'),
                      onPressed: () {
                        context.read<WeatherBloc>().add(LoadWeather());
                      },
                    ),
                  ],
                ),
              );
            }

            if (state is WeatherLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CurrentWeatherWidget(
                      weather: state.current,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HourlyForecastWidget(
                      forecast: state.forecast,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DailyForecastWidget(
                      forecast: state.forecast,
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Icon(CupertinoIcons.refresh),
      onPressed: () {
        context.read<WeatherBloc>().add(RefreshWeather());
      },
    );
  }
}
