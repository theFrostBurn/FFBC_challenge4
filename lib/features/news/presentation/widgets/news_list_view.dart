import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsListView extends StatelessWidget {
  final String category;

  const NewsListView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // 임시 데이터
    final List<Map<String, dynamic>> newsItems = List.generate(
      20,
      (index) => {
        'title': '$category 관련 뉴스 ${index + 1}',
        'description': '이것은 $category 카테고리의 뉴스 내용입니다. 여기에는 뉴스의 주요 내용이 들어갑니다...',
        'imageUrl': 'https://picsum.photos/200/200?random=$index',
        'publishedAt': DateTime.now().subtract(Duration(hours: index)),
      },
    );

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: newsItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final news = newsItems[index];
        return Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey.withAlpha(25),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // TODO: 뉴스 상세 페이지로 이동
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedNetworkImage(
                      imageUrl: news['imageUrl'],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: CupertinoColors.systemGrey6,
                        child: const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(CupertinoIcons.photo),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.label,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        news['description'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.secondaryLabel,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.time,
                            size: 14,
                            color: CupertinoColors.systemGrey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getTimeAgo(news['publishedAt']),
                            style: const TextStyle(
                              fontSize: 12,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          const Spacer(),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              CupertinoIcons.bookmark,
                              size: 20,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                              // TODO: 북마크 기능 구현
                            },
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Icon(
                              CupertinoIcons.share,
                              size: 20,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                              // TODO: 공유 기능 구현
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inHours < 1) {
      return '방금 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}일 전';
    } else {
      return '${dateTime.month}월 ${dateTime.day}일';
    }
  }
}
