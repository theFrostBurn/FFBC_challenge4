import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../news/presentation/bloc/bookmark_bloc.dart';
import '../bloc/settings_bloc.dart';
import 'settings_screen.dart';
import '../widgets/bookmarked_news_item.dart';

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
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4B9FE1),
                            Color(0xFF66B6FF),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDarkMode
                                ? const Color(0xFF000000)
                                : CupertinoColors.systemBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              'assets/images/cookie_monster.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cookie Monster',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'cookie.monster@sesame.st',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGrey,
                            ),
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

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final article = state.bookmarkedArticles[index];
                        return BookmarkedNewsItem(article: article);
                      },
                      childCount: state.bookmarkedArticles.length,
                    ),
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
