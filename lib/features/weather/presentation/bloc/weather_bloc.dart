import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/services/weather_service.dart';
import '../../domain/models/weather_data.dart';

// Events
abstract class WeatherEvent {}

class LoadWeather extends WeatherEvent {}

class RefreshWeather extends WeatherEvent {}

// States
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherData current;
  final WeatherForecast forecast;
  final Position position;

  WeatherLoaded({
    required this.current,
    required this.forecast,
    required this.position,
  });
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}

// BLoC
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService _weatherService;

  WeatherBloc({
    required WeatherService weatherService,
  })  : _weatherService = weatherService,
        super(WeatherInitial()) {
    on<LoadWeather>(_onLoadWeather);
    on<RefreshWeather>(_onRefreshWeather);
  }

  Future<void> _onLoadWeather(
    LoadWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(WeatherLoading());
      final position = await _weatherService.getCurrentLocation();
      final current = await _weatherService.getCurrentWeather(position);
      final forecast = await _weatherService.getWeatherForecast(position);
      emit(WeatherLoaded(
        current: current,
        forecast: forecast,
        position: position,
      ));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  Future<void> _onRefreshWeather(
    RefreshWeather event,
    Emitter<WeatherState> emit,
  ) async {
    if (state is WeatherLoaded) {
      try {
        final currentState = state as WeatherLoaded;
        final current =
            await _weatherService.getCurrentWeather(currentState.position);
        final forecast =
            await _weatherService.getWeatherForecast(currentState.position);
        emit(WeatherLoaded(
          current: current,
          forecast: forecast,
          position: currentState.position,
        ));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    }
  }
}
