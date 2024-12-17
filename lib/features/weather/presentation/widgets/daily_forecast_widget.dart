import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/models/weather_data.dart';
import 'package:intl/intl.dart';

class DailyForecastWidget extends StatelessWidget {
  final WeatherForecast forecast;

  const DailyForecastWidget({
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
            '주간 날씨',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: forecast.daily.length,
          itemBuilder: (context, index) {
            final weather = forecast.daily[index];
            return _DailyWeatherItem(
              weather: weather,
              isToday: index == 0,
            );
          },
        ),
      ],
    );
  }
}

class _DailyWeatherItem extends StatelessWidget {
  final WeatherData weather;
  final bool isToday;

  const _DailyWeatherItem({
    required this.weather,
    required this.isToday,
  });

  String _getDayText() {
    if (isToday) return '오늘';
    final dayOfWeek = DateFormat('EEEE', 'ko_KR').format(weather.timestamp);
    return dayOfWeek;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              _getDayText(),
              style: TextStyle(
                fontSize: 16,
                color: isToday
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.label,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          CachedNetworkImage(
            imageUrl: weather.iconUrl,
            width: 32,
            height: 32,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(CupertinoIcons.cloud),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              weather.description,
              style: const TextStyle(
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
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
