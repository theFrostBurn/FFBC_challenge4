import '../domain/models/news_article.dart';
import 'news_contents.dart';

// AI 추천 뉴스용 하이라이트 데이터
final List<NewsArticle> aiRecommendedNews = aiNewsContents
    .map((content) => NewsArticle(
          id: content['id']!,
          title: content['title']!,
          description: content['description']!,
          imageUrl: content['imageUrl']!,
          publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
        ))
    .toList();

// 홈 탭의 작은 뉴스 헤드라인용 데이터
final List<NewsArticle> homeSmallNewsHeadlines = homeNewsContents
    .map((content) => NewsArticle(
          id: content['id']!,
          title: content['title']!,
          description: content['description']!,
          imageUrl: content['imageUrl']!,
          publishedAt: DateTime.now().subtract(const Duration(minutes: 30)),
        ))
    .toList();

// 카테고리별 뉴스 데이터
final Map<String, List<NewsArticle>> categoryNewsData = {
  ...categoryNewsContents.map(
    (category, contents) => MapEntry(
      category,
      contents
          .map((content) => NewsArticle(
                id: content['id']!,
                title: content['title']!,
                description: content['description']!,
                imageUrl: content['imageUrl']!,
                publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
              ))
          .toList(),
    ),
  ),
};
