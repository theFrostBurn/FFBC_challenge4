import 'package:flutter/cupertino.dart';
import '../widgets/news_carousel.dart';
import '../widgets/stock_ticker.dart';
import '../widgets/news_feed.dart';

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
                child: NewsCarousel(),
              ),
            ),

            // 실시간 주식 정보 위젯
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: StockTicker(),
              ),
            ),

            // 최신 뉴스 피드
            const NewsFeed(),
          ],
        ),
      ),
    );
  }
}
