import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import '../../domain/models/weather_data.dart';

class WeatherService {
  static const String _apiKey = 'b7508a37ff6a0dcb6655f1ecb336a33e';
  final Dio _dio = Dio();

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('위치 서비스가 비활성화되어 있습니다.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('위치 권한이 거부되었습니다.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<WeatherData> getCurrentWeather(Position position) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': _apiKey,
        'units': 'metric',
        'lang': 'kr',
      },
    );

    return WeatherData.fromJson(response.data);
  }

  Future<WeatherForecast> getWeatherForecast(Position position) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': _apiKey,
        'units': 'metric',
        'lang': 'kr',
        'cnt': 40,
      },
    );

    final List<WeatherData> hourlyList = [];
    final List<WeatherData> dailyList = [];

    for (var item in response.data['list']) {
      final weather = WeatherData.fromJson(item);

      if (hourlyList.length < 24) {
        hourlyList.add(weather);
      }

      if (weather.timestamp.hour == 12) {
        dailyList.add(weather);
      }
    }

    return WeatherForecast(
      hourly: hourlyList,
      daily: dailyList,
    );
  }
}
