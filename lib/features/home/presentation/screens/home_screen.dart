import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/news_carousel.dart';
import '../widgets/stock_info_widget.dart';
import '../widgets/small_news_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('홈'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AI 추천 뉴스 캐러셀
              const NewsCarousel(),

              // 주식 정보 위젯
              const StockInfoWidget(),

              // 작은 뉴스 카드들
              const SmallNewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
