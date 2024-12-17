import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/models/news_item.dart';

class NewsCarousel extends StatefulWidget {
  const NewsCarousel({super.key});

  @override
  State<NewsCarousel> createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  // 임시 데이터
  final List<NewsItem> _newsItems = [
    NewsItem(
      id: '1',
      title: '애플, 새로운 AI 기술 발표',
      description: '애플이 혁신적인 AI 기술을 공개했습니다. 이번 기술은...',
      imageUrl: 'https://picsum.photos/800/400',
      publishedAt: DateTime.now(),
    ),
    NewsItem(
      id: '2',
      title: '삼성전자, 새로운 폴더블폰 출시 예정',
      description: '삼성전자가 혁신적인 폴더블 스마트폰을 출시할 예정입니다...',
      imageUrl: 'https://picsum.photos/800/400?random=1',
      publishedAt: DateTime.now(),
    ),
    NewsItem(
      id: '3',
      title: '테슬라, 신형 전기차 공개',
      description: '테슬라가 새로운 전기차 모델을 공개했습니다. 이번 모델은...',
      imageUrl: 'https://picsum.photos/800/400?random=2',
      publishedAt: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // 자동 슬라이드 설정
    Future.delayed(const Duration(seconds: 1), () {
      _startAutoSlide();
    });
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final nextPage = (_currentPage + 1) % _newsItems.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _newsItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: NewsCard(newsItem: _newsItems[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        // 페이지 인디케이터
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _newsItems.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.systemGrey4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class NewsCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // 이미지
            CachedNetworkImage(
              imageUrl: newsItem.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => Container(
                color: CupertinoColors.systemGrey5,
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(CupertinoIcons.photo),
            ),
            // 그라데이션 오버레이
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CupertinoColors.black.withOpacity(0),
                    CupertinoColors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // 텍스트
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem.title,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    newsItem.description,
                    style: TextStyle(
                      color: CupertinoColors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
