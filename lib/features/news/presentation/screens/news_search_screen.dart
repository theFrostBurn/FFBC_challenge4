import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'news_search_result_screen.dart';

class NewsSearchScreen extends StatefulWidget {
  const NewsSearchScreen({super.key});

  @override
  State<NewsSearchScreen> createState() => _NewsSearchScreenState();
}

class _NewsSearchScreenState extends State<NewsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [];
  final List<String> _trendingSearches = [
    '애플',
    '삼성전자',
    'AI',
    '테슬라',
    '반도체',
    '주식시장',
    '부동산',
    '금리',
  ];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches.addAll(prefs.getStringList('recent_searches') ?? []);
    });
  }

  Future<void> _saveSearch(String query) async {
    if (query.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches.remove(query);
      _recentSearches.insert(0, query);
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }
    });
    await prefs.setStringList('recent_searches', _recentSearches);
  }

  Future<void> _removeRecentSearch(String query) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches.remove(query);
    });
    await prefs.setStringList('recent_searches', _recentSearches);
  }

  void _navigateToSearchResult(String query) {
    if (query.isEmpty) return;
    _saveSearch(query);
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => NewsSearchResultScreen(searchQuery: query),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSearchTextField(
          controller: _searchController,
          placeholder: '뉴스 검색',
          onSubmitted: _navigateToSearchResult,
          autofocus: true,
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('취소'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            if (_recentSearches.isNotEmpty) ...[
              _buildSectionHeader(
                '최근 검색어',
                onClearPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(() {
                    _recentSearches.clear();
                  });
                  await prefs.remove('recent_searches');
                },
              ),
              _buildSearchList(_recentSearches, isRecent: true),
            ],
            _buildSectionHeader('인기 검색어'),
            _buildSearchList(_trendingSearches),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onClearPressed}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
          ),
          if (onClearPressed != null)
            CupertinoButton(
              onPressed: onClearPressed,
              padding: EdgeInsets.zero,
              child: const Text('전체 삭제'),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchList(List<String> items, {bool isRecent = false}) {
    return Column(
      children: items.map((item) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            _searchController.text = item;
            _navigateToSearchResult(item);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(
                  isRecent ? CupertinoIcons.time : CupertinoIcons.chart_bar,
                  size: 20,
                  color: CupertinoColors.systemGrey,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                    ),
                  ),
                ),
                if (isRecent)
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.clear_circled,
                      size: 20,
                      color: CupertinoColors.systemGrey,
                    ),
                    onPressed: () => _removeRecentSearch(item),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
