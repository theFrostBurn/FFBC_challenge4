import 'package:flutter/cupertino.dart';
import '../widgets/news_list_view.dart';

class NewsSearchResultScreen extends StatelessWidget {
  final String searchQuery;

  const NewsSearchResultScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('"$searchQuery" 검색 결과'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // TODO: 검색 필터 기능 구현
          },
          child: const Icon(CupertinoIcons.slider_horizontal_3),
        ),
      ),
      child: SafeArea(
        child: NewsListView(
          category: 'search',
          searchQuery: searchQuery,
        ),
      ),
    );
  }
}
