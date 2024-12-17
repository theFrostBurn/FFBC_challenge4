import 'package:flutter/cupertino.dart';
import 'package:challenge4/features/home/presentation/screens/home_screen.dart';
import 'package:challenge4/features/news/presentation/screens/news_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/news/presentation/bloc/bookmark_bloc.dart';
import 'package:challenge4/features/my/presentation/screens/my_screen.dart';
import '../features/weather/data/services/weather_service.dart';
import '../features/weather/presentation/screens/weather_screen.dart';
import '../features/my/presentation/bloc/settings_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WeatherService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BookmarkBloc()..add(LoadBookmarks()),
          ),
          BlocProvider(
            create: (context) => SettingsBloc()..add(LoadSettings()),
          ),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return CupertinoApp(
              title: 'FindOS Style App',
              theme: CupertinoThemeData(
                brightness:
                    state.isDarkMode ? Brightness.dark : Brightness.light,
                primaryColor: CupertinoColors.systemBlue,
                scaffoldBackgroundColor: state.isDarkMode
                    ? CupertinoColors.black
                    : CupertinoColors.systemBackground,
                barBackgroundColor: state.isDarkMode
                    ? const Color(0xFF1C1C1E)
                    : CupertinoColors.systemBackground,
                textTheme: CupertinoTextThemeData(
                  primaryColor: state.isDarkMode
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                  textStyle: TextStyle(
                    color: state.isDarkMode
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                ),
              ),
              home: const MainScreen(),
            );
          },
        ),
      ),
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
              case 2:
                return const WeatherScreen();
              case 3:
                return const MyScreen();
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
