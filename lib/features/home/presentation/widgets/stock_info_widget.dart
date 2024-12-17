import 'package:flutter/material.dart';

class StockInfoWidget extends StatelessWidget {
  const StockInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '주요 지수',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStockItem('KOSPI', '2,564.32', '+1.2%', true),
              _buildStockItem('KOSDAQ', '876.43', '-0.5%', false),
              _buildStockItem('NASDAQ', '14,113.21', '+0.8%', true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStockItem(String name, String price, String change, bool isUp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          change,
          style: TextStyle(
            fontSize: 14,
            color: isUp ? Colors.red : Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
