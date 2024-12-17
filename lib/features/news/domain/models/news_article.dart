class NewsArticle {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime publishedAt;
  final bool isBookmarked;

  const NewsArticle({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    this.isBookmarked = false,
  });

  NewsArticle copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    DateTime? publishedAt,
    bool? isBookmarked,
  }) {
    return NewsArticle(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'publishedAt': publishedAt.toIso8601String(),
        'isBookmarked': isBookmarked,
      };

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        publishedAt: DateTime.parse(json['publishedAt']),
        isBookmarked: json['isBookmarked'] ?? false,
      );
}
