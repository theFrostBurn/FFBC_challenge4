import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/models/weather_data.dart';
import 'package:intl/intl.dart';

class HourlyForecastWidget extends StatelessWidget {
  final WeatherForecast forecast;

  const HourlyForecastWidget({
    super.key,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '시간대별 날씨',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: forecast.hourly.length,
            itemBuilder: (context, index) {
              final weather = forecast.hourly[index];
              return _HourlyWeatherItem(weather: weather);
            },
          ),
        ),
      ],
    );
  }
}

class _HourlyWeatherItem extends StatelessWidget {
  final WeatherData weather;

  const _HourlyWeatherItem({
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            DateFormat('HH:mm').format(weather.timestamp),
            style: const TextStyle(
              color: CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 8),
          CachedNetworkImage(
            imageUrl: weather.iconUrl,
            width: 32,
            height: 32,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(CupertinoIcons.cloud),
          ),
          const SizedBox(height: 8),
          Text(
            '${weather.temperature.round()}°',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
