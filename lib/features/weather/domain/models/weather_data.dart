class WeatherData {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String description;
  final String iconCode;
  final DateTime timestamp;

  const WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.iconCode,
    required this.timestamp,
  });

  String get iconUrl => 'https://openweathermap.org/img/wn/$iconCode@2x.png';

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final main = json['main'];
    final weather = json['weather'][0];

    return WeatherData(
      temperature: main['temp'].toDouble(),
      feelsLike: main['feels_like'].toDouble(),
      humidity: main['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      description: weather['description'],
      iconCode: weather['icon'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
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
