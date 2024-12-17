import 'package:flutter/cupertino.dart';
import 'package:challenge4/features/home/presentation/screens/home_screen.dart';
import 'package:challenge4/features/news/presentation/screens/news_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'FindOS Style App',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: '뉴스',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cloud),
            label: '날씨',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'MY',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const HomeScreen();
              case 1:
                return const NewsScreen();
              default:
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text(['홈', '뉴스', '날씨', 'MY'][index]),
                  ),
                  child: Center(
                    child: Text('${['홈', '뉴스', '날씨', 'MY'][index]} 화면'),
                  ),
                );
            }
          },
        );
      },
    );
  }
}
