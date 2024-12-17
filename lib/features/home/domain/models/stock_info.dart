class StockInfo {
  final String symbol;
  final String name;
  final double currentPrice;
  final double priceChange;
  final double changePercent;
  final bool isUp;

  const StockInfo({
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.priceChange,
    required this.changePercent,
    required this.isUp,
  });
}
