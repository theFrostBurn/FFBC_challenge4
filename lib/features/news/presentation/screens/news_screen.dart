import 'package:flutter/cupertino.dart';
import '../widgets/news_category_bar.dart';
import '../widgets/news_list_view.dart';
import 'news_search_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<String> categories = [
    '전체',
    '정치',
    '경제',
    '사회',
    '생활/문화',
    '세계',
    'IT/과학',
    '연예',
    '스포츠',
    '날씨',
  ];
  String selectedCategory = '전체';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('뉴스'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.search),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const NewsSearchScreen(),
              ),
            );
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            NewsCategoryBar(
              categories: categories,
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            Expanded(
              child: NewsListView(
                category: selectedCategory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
