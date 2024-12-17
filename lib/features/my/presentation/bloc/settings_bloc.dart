import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class UpdateThemeMode extends SettingsEvent {
  final bool isDarkMode;
  UpdateThemeMode(this.isDarkMode);
}

class UpdateStockNotification extends SettingsEvent {
  final bool isEnabled;
  UpdateStockNotification(this.isEnabled);
}

class UpdateWeatherNotification extends SettingsEvent {
  final bool isEnabled;
  UpdateWeatherNotification(this.isEnabled);
}

class UpdateNewsNotification extends SettingsEvent {
  final bool isEnabled;
  UpdateNewsNotification(this.isEnabled);
}

// State
class SettingsState {
  final bool isDarkMode;
  final bool isStockNotificationEnabled;
  final bool isWeatherNotificationEnabled;
  final bool isNewsNotificationEnabled;

  const SettingsState({
    required this.isDarkMode,
    required this.isStockNotificationEnabled,
    required this.isWeatherNotificationEnabled,
    required this.isNewsNotificationEnabled,
  });

  SettingsState copyWith({
    bool? isDarkMode,
    bool? isStockNotificationEnabled,
    bool? isWeatherNotificationEnabled,
    bool? isNewsNotificationEnabled,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isStockNotificationEnabled:
          isStockNotificationEnabled ?? this.isStockNotificationEnabled,
      isWeatherNotificationEnabled:
          isWeatherNotificationEnabled ?? this.isWeatherNotificationEnabled,
      isNewsNotificationEnabled:
          isNewsNotificationEnabled ?? this.isNewsNotificationEnabled,
    );
  }
}

// BLoC
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String _darkModeKey = 'dark_mode';
  static const String _stockNotificationKey = 'stock_notification';
  static const String _weatherNotificationKey = 'weather_notification';
  static const String _newsNotificationKey = 'news_notification';

  SettingsBloc()
      : super(const SettingsState(
          isDarkMode: false,
          isStockNotificationEnabled: true,
          isWeatherNotificationEnabled: true,
          isNewsNotificationEnabled: true,
        )) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateThemeMode>(_onUpdateThemeMode);
    on<UpdateStockNotification>(_onUpdateStockNotification);
    on<UpdateWeatherNotification>(_onUpdateWeatherNotification);
    on<UpdateNewsNotification>(_onUpdateNewsNotification);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    emit(SettingsState(
      isDarkMode: prefs.getBool(_darkModeKey) ?? false,
      isStockNotificationEnabled: prefs.getBool(_stockNotificationKey) ?? true,
      isWeatherNotificationEnabled:
          prefs.getBool(_weatherNotificationKey) ?? true,
      isNewsNotificationEnabled: prefs.getBool(_newsNotificationKey) ?? true,
    ));
  }

  Future<void> _onUpdateThemeMode(
    UpdateThemeMode event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, event.isDarkMode);
    emit(state.copyWith(isDarkMode: event.isDarkMode));
  }

  Future<void> _onUpdateStockNotification(
    UpdateStockNotification event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_stockNotificationKey, event.isEnabled);
    emit(state.copyWith(isStockNotificationEnabled: event.isEnabled));
  }

  Future<void> _onUpdateWeatherNotification(
    UpdateWeatherNotification event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_weatherNotificationKey, event.isEnabled);
    emit(state.copyWith(isWeatherNotificationEnabled: event.isEnabled));
  }

  Future<void> _onUpdateNewsNotification(
    UpdateNewsNotification event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_newsNotificationKey, event.isEnabled);
    emit(state.copyWith(isNewsNotificationEnabled: event.isEnabled));
  }
}
