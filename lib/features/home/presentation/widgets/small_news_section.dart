import 'package:flutter/material.dart';
import '../../../news/data/sample_news_data.dart';
import './small_news_card.dart';

class SmallNewsSection extends StatelessWidget {
  const SmallNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            '최신 뉴스',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeSmallNewsHeadlines.length,
          itemBuilder: (context, index) {
            return SmallNewsCard(
              news: homeSmallNewsHeadlines[index],
            );
          },
        ),
      ],
    );
  }
}
