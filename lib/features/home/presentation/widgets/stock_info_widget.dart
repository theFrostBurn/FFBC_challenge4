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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildStockItem('KOSPI', '2,564.32', '+1.2%', true),
                const SizedBox(width: 16),
                _buildStockItem('KOSDAQ', '876.43', '-0.5%', false),
                const SizedBox(width: 16),
                _buildStockItem('NASDAQ', '14,113.21', '+0.8%', true),
                const SizedBox(width: 16),
                _buildStockItem('S&P 500', '4,783.45', '+0.6%', true),
                const SizedBox(width: 16),
                _buildStockItem('DOW', '37,221.12', '-0.3%', false),
                const SizedBox(width: 16),
                _buildStockItem('NIKKEI', '33,452.58', '+1.4%', true),
                const SizedBox(width: 16),
                _buildStockItem('상해종합', '3,112.33', '-0.7%', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '관심 종목',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildStockItem('삼성전자', '74,300', '+2.1%', true),
                const SizedBox(width: 16),
                _buildStockItem('SK하이닉스', '128,500', '+3.2%', true),
                const SizedBox(width: 16),
                _buildStockItem('LG에너지솔루션', '435,000', '-1.2%', false),
                const SizedBox(width: 16),
                _buildStockItem('현대차', '183,500', '+0.8%', true),
                const SizedBox(width: 16),
                _buildStockItem('NAVER', '234,500', '+1.5%', true),
                const SizedBox(width: 16),
                _buildStockItem('카카오', '56,800', '-0.7%', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockItem(String name, String price, String change, bool isUp) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
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
      ),
    );
  }
}
