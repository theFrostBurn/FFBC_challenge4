import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../my/presentation/bloc/settings_bloc.dart';

class NewsCategoryBar extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const NewsCategoryBar({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  static const categories = [
    '정치',
    '경제',
    '사회',
    '생활/문화',
    '세계',
    'IT/과학',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsBloc>().state.isDarkMode;

    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDarkMode
                ? const Color(0xFF38383A)
                : CupertinoColors.systemGrey5,
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => onCategorySelected(category),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (isDarkMode
                          ? CupertinoColors.systemBlue
                          : CupertinoColors.activeBlue)
                      : CupertinoColors.systemBackground.withOpacity(0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    color: isSelected
                        ? CupertinoColors.white
                        : (isDarkMode
                            ? CupertinoColors.white.withOpacity(0.8)
                            : CupertinoColors.black),
                    fontSize: 15,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  child: Text(category),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
