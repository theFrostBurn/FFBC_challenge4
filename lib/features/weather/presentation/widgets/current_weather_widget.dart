import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../my/presentation/bloc/settings_bloc.dart';
import '../../domain/models/weather_data.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherData weather;

  const CurrentWeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: weather.iconUrl,
                width: 80,
                height: 80,
                placeholder: (context, url) =>
                    const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(CupertinoIcons.cloud),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weather.temperature.toStringAsFixed(1)}°',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  Text(
                    weather.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode
                          ? CupertinoColors.systemGrey
                          : CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeatherDetail(
                context,
                icon: CupertinoIcons.thermometer,
                label: '체감온도',
                value: '${weather.feelsLike.round()}°',
              ),
              _buildWeatherDetail(
                context,
                icon: CupertinoIcons.drop,
                label: '습도',
                value: '${weather.humidity}%',
              ),
              _buildWeatherDetail(
                context,
                icon: CupertinoIcons.wind,
                label: '풍속',
                value: '${weather.windSpeed}m/s',
              ),
              _buildWeatherDetail(
                context,
                icon: CupertinoIcons.cloud_rain,
                label: '강수확률',
                value: '${weather.precipitationProbability}%',
              ),
              _buildWeatherDetail(
                context,
                icon: CupertinoIcons.gauge,
                label: '기압',
                value: '${weather.pressure}hPa',
              ),
              _buildWeatherDetail(
                context,
                icon: CupertinoIcons.sun_max,
                label: '자외선',
                value: '${weather.uvIndex}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return Column(
      children: [
        Icon(
          icon,
          color: isDarkMode
              ? CupertinoColors.systemGrey
              : CupertinoColors.systemGrey,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isDarkMode
                ? CupertinoColors.systemGrey
                : CupertinoColors.systemGrey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
          ),
        ),
      ],
    );
  }
}
