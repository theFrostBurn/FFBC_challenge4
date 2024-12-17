import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return CupertinoPageScaffold(
      backgroundColor: isDarkMode
          ? const Color(0xFF000000)
          : CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode
            ? const Color(0xFF1C1C1E).withOpacity(0.8)
            : CupertinoColors.systemBackground.withOpacity(0.8),
        middle: const Text('설정'),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 헤더 이미지
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const NetworkImage('https://picsum.photos/800/400'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        isDarkMode
                            ? const Color(0xFF000000)
                            : CupertinoColors.systemBackground,
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 설정 목록
            SliverToBoxAdapter(
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 16),
                      _buildSection(
                        context,
                        title: '일반',
                        children: [
                          _buildSettingItem(
                            context,
                            title: '다크 모드',
                            trailing: CupertinoSwitch(
                              value: state.isDarkMode,
                              onChanged: (value) {
                                context
                                    .read<SettingsBloc>()
                                    .add(UpdateThemeMode(value));
                              },
                            ),
                          ),
                        ],
                      ),
                      _buildSection(
                        context,
                        title: '알림',
                        children: [
                          _buildSettingItem(
                            context,
                            title: '주식 알림',
                            trailing: CupertinoSwitch(
                              value: state.isStockNotificationEnabled,
                              onChanged: (value) {
                                context
                                    .read<SettingsBloc>()
                                    .add(UpdateStockNotification(value));
                              },
                            ),
                          ),
                          _buildSettingItem(
                            context,
                            title: '날씨 알림',
                            trailing: CupertinoSwitch(
                              value: state.isWeatherNotificationEnabled,
                              onChanged: (value) {
                                context
                                    .read<SettingsBloc>()
                                    .add(UpdateWeatherNotification(value));
                              },
                            ),
                          ),
                          _buildSettingItem(
                            context,
                            title: '뉴스 알림',
                            trailing: CupertinoSwitch(
                              value: state.isNewsNotificationEnabled,
                              onChanged: (value) {
                                context
                                    .read<SettingsBloc>()
                                    .add(UpdateNewsNotification(value));
                              },
                            ),
                          ),
                        ],
                      ),
                      _buildSection(
                        context,
                        title: '정보',
                        children: [
                          _buildSettingItem(
                            context,
                            title: '앱 버전',
                            trailing: const Text(
                              '1.0.0',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ),
                          _buildSettingItem(
                            context,
                            title: '개인정보 처리방침',
                            onTap: () {
                              // TODO: 개인정보 처리방침 페이지로 이동
                            },
                          ),
                          _buildSettingItem(
                            context,
                            title: '이용약관',
                            onTap: () {
                              // TODO: 이용약관 페이지로 이동
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: isDarkMode
                  ? CupertinoColors.systemGrey
                  : CupertinoColors.systemGrey,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xFF1C1C1E)
                : CupertinoColors.systemBackground,
            border: Border(
              top: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF38383A)
                    : CupertinoColors.systemGrey5,
              ),
              bottom: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF38383A)
                    : CupertinoColors.systemGrey5,
              ),
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isDarkMode
                  ? const Color(0xFF38383A)
                  : CupertinoColors.systemGrey5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color:
                    isDarkMode ? CupertinoColors.white : CupertinoColors.black,
              ),
            ),
            if (trailing != null)
              trailing
            else if (onTap != null)
              Icon(
                CupertinoIcons.chevron_right,
                color: isDarkMode
                    ? const Color(0xFF98989F)
                    : CupertinoColors.systemGrey,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
