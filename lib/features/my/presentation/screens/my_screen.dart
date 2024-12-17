import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show CircleAvatar;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../news/presentation/bloc/bookmark_bloc.dart';
import '../../../news/presentation/widgets/news_list_view.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('MY'),
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
                      child: Icon(CupertinoIcons.person_alt),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '사용자',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '설정 및 북마크 관리',
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
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
