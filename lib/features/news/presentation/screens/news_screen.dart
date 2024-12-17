import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_category_bloc.dart';
import '../widgets/news_category_bar.dart';
import '../widgets/news_list_view.dart';
import 'news_search_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCategoryBloc(),
      child: BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
        builder: (context, state) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('뉴스'),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.search),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    barrierColor: Colors.transparent,
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    builder: (context) => TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                      tween: Tween(begin: -1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(
                              0, MediaQuery.of(context).size.height * value),
                          child: const NewsSearchScreen(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  NewsCategoryBar(
                    selectedCategory: state.selectedCategory,
                    onCategorySelected: (category) {
                      context
                          .read<NewsCategoryBloc>()
                          .add(CategorySelected(category));
                    },
                  ),
                  Expanded(
                    child: NewsListView(
                      category: state.selectedCategory,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
