import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;
    final state = context.watch<SettingsBloc>().state;

    return CupertinoPageScaffold(
      backgroundColor:
          isDarkMode ? const Color(0xFF000000) : const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode
            ? const Color(0xFF1C1C1E)
            : CupertinoColors.systemBackground,
        middle: const Text('설정'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildSectionHeader('앱 설정'),
              CupertinoListSection.insetGrouped(
                backgroundColor: isDarkMode
                    ? const Color(0xFF000000)
                    : const Color(0xFFF2F2F7),
                children: [
                  _buildSettingsTile(
                    '다크 모드',
                    state.isDarkMode,
                    (value) => context
                        .read<SettingsBloc>()
                        .add(SettingsThemeChanged(value)),
                  ),
                  _buildSettingsTile(
                    '자동 재생',
                    state.isAutoPlayEnabled,
                    (value) =>
                        context.read<SettingsBloc>().add(UpdateAutoPlay(value)),
                  ),
                  _buildSettingsTile(
                    '데이터 절약',
                    state.isDataSavingEnabled,
                    (value) => context
                        .read<SettingsBloc>()
                        .add(UpdateDataSaving(value)),
                  ),
                ],
              ),
              _buildSectionHeader('알림 설정'),
              CupertinoListSection.insetGrouped(
                backgroundColor: isDarkMode
                    ? const Color(0xFF000000)
                    : const Color(0xFFF2F2F7),
                children: [
                  _buildSettingsTile(
                    '주식 알림',
                    state.isStockNotificationEnabled,
                    (value) => context
                        .read<SettingsBloc>()
                        .add(UpdateStockNotification(value)),
                  ),
                  _buildSettingsTile(
                    '날씨 알림',
                    state.isWeatherNotificationEnabled,
                    (value) => context
                        .read<SettingsBloc>()
                        .add(UpdateWeatherNotification(value)),
                  ),
                  _buildSettingsTile(
                    '뉴스 알림',
                    state.isNewsNotificationEnabled,
                    (value) => context
                        .read<SettingsBloc>()
                        .add(UpdateNewsNotification(value)),
                  ),
                ],
              ),
              _buildSectionHeader('기타'),
              CupertinoListSection.insetGrouped(
                backgroundColor: isDarkMode
                    ? const Color(0xFF000000)
                    : const Color(0xFFF2F2F7),
                children: [
                  CupertinoListTile(
                    title: const Text('앱 버전'),
                    trailing: Text(
                      '1.0.0',
                      style: TextStyle(
                        color: isDarkMode
                            ? CupertinoColors.systemGrey
                            : CupertinoColors.systemGrey2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _buildNavigationTile('개인정보 처리방침'),
                  _buildNavigationTile('이용약관'),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
      String title, bool value, Function(bool) onChanged) {
    return CupertinoListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Transform.scale(
        scale: 0.75,
        child: CupertinoSwitch(
          value: value,
          activeTrackColor: CupertinoColors.systemBlue,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildNavigationTile(String title) {
    return CupertinoListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_forward,
        color: CupertinoColors.systemGrey3,
        size: 20,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: CupertinoColors.systemGrey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
