import '../domain/models/news_article.dart';

final sampleNewsArticles = [
  NewsArticle(
    id: '1',
    title: '삼성전자, 차세대 AI 반도체 개발 착수',
    description:
        '삼성전자가 차세대 AI 반도체 개발에 본격 착수했다. 업계에 따르면 이번 프로젝트는 기존 반도체 대비 성능을 2배 이상 향상시키는 것을 목표로 하고 있다.',
    imageUrl: 'https://picsum.photos/400/300',
    publishedAt: DateTime.now(),
  ),
  NewsArticle(
    id: '2',
    title: '기후변화로 인한 이상기후 현상 증가',
    description:
        '전 세계적으로 기후변화로 인한 이상기후 현상이 증가하고 있다. 전문가들은 즉각적인 대응이 필요하다고 경고했다.',
    imageUrl: 'https://picsum.photos/400/300',
    publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NewsArticle(
    id: '3',
    title: '애플, 새로운 AI 기능 탑재한 iOS 업데이트 발표',
    description:
        '애플이 iOS의 새로운 업데이트를 발표했다. 이번 업데이트에는 일상생활을 더욱 편리하게 만들어줄 새로운 AI 기능들이 대거 포함되었다.',
    imageUrl: 'https://picsum.photos/400/300',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  // ... 더 많은 뉴스 추가
];
