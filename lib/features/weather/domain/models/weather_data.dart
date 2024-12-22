class WeatherData {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String description;
  final String iconUrl;
  final DateTime timestamp;
  final int precipitationProbability;
  final int pressure;
  final int uvIndex;

  const WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.iconUrl,
    required this.timestamp,
    this.precipitationProbability = 0,
    this.pressure = 1013,
    this.uvIndex = 0,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    final weather = json['weather'][0];

    return WeatherData(
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      humidity: main['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      description: weather['description'] as String,
      iconUrl: 'https://openweathermap.org/img/wn/${weather['icon']}@2x.png',
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      precipitationProbability: ((json['pop'] ?? 0) * 100).round(),
      pressure: main['pressure'] ?? 1013,
      uvIndex: (json['uvi'] ?? 0).round(),
    );
  }
}

class WeatherForecast {
  final List<WeatherData> hourly;
  final List<WeatherData> daily;

  const WeatherForecast({
    required this.hourly,
    required this.daily,
  });
}
