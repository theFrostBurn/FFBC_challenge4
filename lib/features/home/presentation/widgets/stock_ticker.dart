import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show VerticalDivider;
import '../../domain/models/stock_info.dart';

class StockTicker extends StatefulWidget {
  const StockTicker({super.key});

  @override
  State<StockTicker> createState() => _StockTickerState();
}

class _StockTickerState extends State<StockTicker> {
  // 임시 데이터
  final List<StockInfo> _stockItems = [
    StockInfo(
      symbol: 'KOSPI',
      name: '코스피',
      currentPrice: 2580.83,
      priceChange: 22.75,
      changePercent: 0.89,
      isUp: true,
    ),
    StockInfo(
      symbol: 'KOSDAQ',
      name: '코스닥',
      currentPrice: 842.36,
      priceChange: -5.32,
      changePercent: -0.63,
      isUp: false,
    ),
    StockInfo(
      symbol: 'USD/KRW',
      name: '원/달러',
      currentPrice: 1323.50,
      priceChange: -2.80,
      changePercent: -0.21,
      isUp: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _stockItems.length,
        separatorBuilder: (context, index) => const VerticalDivider(
          width: 24,
          thickness: 1,
          color: CupertinoColors.systemGrey5,
        ),
        itemBuilder: (context, index) {
          final stock = _stockItems[index];
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stock.currentPrice.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      stock.isUp
                          ? CupertinoIcons.arrow_up_right
                          : CupertinoIcons.arrow_down_right,
                      size: 14,
                      color: stock.isUp
                          ? CupertinoColors.systemRed
                          : CupertinoColors.systemBlue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${stock.isUp ? "+" : ""}${stock.changePercent.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: 14,
                        color: stock.isUp
                            ? CupertinoColors.systemRed
                            : CupertinoColors.systemBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
