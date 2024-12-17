import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class UpdateThemeMode extends SettingsEvent {
  final bool isDarkMode;
  UpdateThemeMode(this.isDarkMode);
}

class UpdateNotification extends SettingsEvent {
  final bool isEnabled;
  UpdateNotification(this.isEnabled);
}

// State
class SettingsState {
  final bool isDarkMode;
  final bool isNotificationEnabled;

  const SettingsState({
    required this.isDarkMode,
    required this.isNotificationEnabled,
  });

  SettingsState copyWith({
    bool? isDarkMode,
    bool? isNotificationEnabled,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
    );
  }
}

// BLoC
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static const String _darkModeKey = 'dark_mode';
  static const String _notificationKey = 'notification_enabled';

  SettingsBloc()
      : super(const SettingsState(
          isDarkMode: false,
          isNotificationEnabled: true,
        )) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateThemeMode>(_onUpdateThemeMode);
    on<UpdateNotification>(_onUpdateNotification);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    emit(SettingsState(
      isDarkMode: prefs.getBool(_darkModeKey) ?? false,
      isNotificationEnabled: prefs.getBool(_notificationKey) ?? true,
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

  Future<void> _onUpdateNotification(
    UpdateNotification event,
    Emitter<SettingsState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationKey, event.isEnabled);
    emit(state.copyWith(isNotificationEnabled: event.isEnabled));
  }
}
