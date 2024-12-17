import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('홈'),
      ),
      child: SafeArea(
        child: CustomScrollView(
          key: const PageStorageKey<String>('home_scroll'),
          slivers: [
            // 검색바
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  placeholder: '검색어를 입력하세요',
                ),
              ),
            ),

            // AI 추천 뉴스 캐러셀
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('AI 추천 뉴스 캐러셀'),
                  ),
                ),
              ),
            ),

            // 실시간 주식 정보 위젯
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text('실시간 주식 정보'),
                  ),
                ),
              ),
            ),

            // 최신 뉴스 피드 (무한 스크롤)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '뉴스 아이템 $index',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 10, // 초기 아이템 수
              ),
            ),
          ],
        ),
      ),
    );
  }
}
