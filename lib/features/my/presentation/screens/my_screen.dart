import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show CircleAvatar;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../news/presentation/bloc/bookmark_bloc.dart';
import '../../../news/presentation/widgets/news_list_view.dart';
import '../bloc/settings_bloc.dart';
import 'settings_screen.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return CupertinoPageScaffold(
      backgroundColor: isDarkMode
          ? const Color(0xFF000000)
          : CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode
            ? const Color(0xFF1C1C1E)
            : CupertinoColors.systemBackground,
        middle: const Text('MY'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            CupertinoIcons.settings,
            color: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 프로필 섹션
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: isDarkMode
                          ? const Color(0xFF1C1C1E)
                          : CupertinoColors.systemGrey5,
                      child: Icon(
                        CupertinoIcons.person_alt,
                        color: isDarkMode
                            ? CupertinoColors.white
                            : CupertinoColors.systemGrey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '사용자',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Row(
                              children: [
                                Text(
                                  '프로필 수정',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  CupertinoIcons.chevron_right,
                                  size: 14,
                                ),
                              ],
                            ),
                            onPressed: () {
                              // TODO: 프로필 수정 화면으로 이동
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 북마크된 뉴스 섹션
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '북마크한 뉴스',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BlocBuilder<BookmarkBloc, BookmarkState>(
                      builder: (context, state) {
                        return Text(
                          '${state.bookmarkedArticles.length}개',
                          style: const TextStyle(
                            color: CupertinoColors.systemGrey,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // 북마크된 뉴스 목록
            BlocBuilder<BookmarkBloc, BookmarkState>(
              builder: (context, state) {
                if (state.bookmarkedArticles.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        '북마크한 뉴스가 없습니다.',
                        style: TextStyle(
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final article = state.bookmarkedArticles[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: NewsCard(
                          article: article.copyWith(isBookmarked: true),
                        ),
                      );
                    },
                    childCount: state.bookmarkedArticles.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
