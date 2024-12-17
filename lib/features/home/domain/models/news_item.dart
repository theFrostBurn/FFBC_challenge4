class NewsItem {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime publishedAt;

  const NewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
  });
}
