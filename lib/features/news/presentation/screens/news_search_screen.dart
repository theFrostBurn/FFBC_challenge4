import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '어떤 뉴스를 검색할까요?',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: (isDarkMode
                                  ? CupertinoColors.black
                                  : CupertinoColors.white)
                              .withAlpha(200),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDarkMode
                                ? CupertinoColors.systemGrey.withAlpha(50)
                                : CupertinoColors.systemGrey6,
                            width: 0.5,
                          ),
                        ),
                        child: CupertinoSearchTextField(
                          autofocus: true,
                          style: TextStyle(
                            color: isDarkMode
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                            fontSize: 18,
                          ),
                          placeholder: '뉴스 검색',
                          placeholderStyle: TextStyle(
                            color: isDarkMode
                                ? CupertinoColors.systemGrey
                                : CupertinoColors.systemGrey2,
                            fontSize: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixInsets: const EdgeInsets.only(left: 8),
                          suffixInsets: const EdgeInsets.only(right: 8),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: isDarkMode
                                ? CupertinoColors.systemGrey
                                : CupertinoColors.systemGrey2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
