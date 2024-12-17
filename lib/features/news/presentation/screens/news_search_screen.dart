import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../my/presentation/bloc/settings_bloc.dart';

class NewsSearchScreen extends StatelessWidget {
  const NewsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: CupertinoColors.black.withAlpha(150),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 검색창
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: (isDarkMode
                                  ? CupertinoColors.black
                                  : CupertinoColors.white)
                              .withAlpha(200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CupertinoSearchTextField(
                              autofocus: true,
                              style: TextStyle(
                                color: isDarkMode
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                              placeholder: '뉴스 검색',
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '정치, 경제, 사회 등 관심있는 뉴스를 검색해보세요',
                              style: TextStyle(
                                fontSize: 13,
                                color: isDarkMode
                                    ? CupertinoColors.systemGrey
                                    : CupertinoColors.systemGrey2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // 취소 버튼
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CupertinoButton(
                  child: Text(
                    '취소',
                    style: TextStyle(
                      color: isDarkMode
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
