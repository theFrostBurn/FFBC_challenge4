import 'package:flutter/cupertino.dart';
import '../widgets/news_category_bar.dart';
import '../widgets/news_list_view.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<String> categories = ['전체', '비즈니스', '테크', '정치', '문화'];
  String selectedCategory = '전체';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('뉴스'),
        trailing: Icon(CupertinoIcons.search),
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
