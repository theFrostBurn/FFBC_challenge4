import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../news/domain/models/news_article.dart';
import '../../../news/presentation/bloc/bookmark_bloc.dart';
import '../bloc/settings_bloc.dart';

class BookmarkedNewsItem extends StatelessWidget {
  final NewsArticle article;

  const BookmarkedNewsItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xFF1C1C1E)
            : CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: article.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(CupertinoIcons.photo),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                article.title,
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              CupertinoIcons.bookmark_fill,
              color: isDarkMode
                  ? CupertinoColors.systemBlue
                  : CupertinoColors.activeBlue,
              size: 20,
            ),
            onPressed: () {
              context.read<BookmarkBloc>().add(RemoveBookmark(article.id));
            },
          ),
        ],
      ),
    );
  }
}
