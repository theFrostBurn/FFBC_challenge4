import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/models/weather_data.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherData weather;

  const CurrentWeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
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
                    '${weather.temperature.round()}°',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weather.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey,
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
                icon: CupertinoIcons.thermometer,
                label: '체감온도',
                value: '${weather.feelsLike.round()}°',
              ),
              _buildWeatherDetail(
                icon: CupertinoIcons.drop,
                label: '습도',
                value: '${weather.humidity}%',
              ),
              _buildWeatherDetail(
                icon: CupertinoIcons.wind,
                label: '풍속',
                value: '${weather.windSpeed}m/s',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: CupertinoColors.systemGrey,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: CupertinoColors.systemGrey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
