extension<T> on List<T> {
  //Extension Method: Adding $ prefix
  List<String> priceLabels(String symbol) =>
      this.map((item) => "$symbol${item}").toList();
}

void main() {
  //List of prices
  List prices = [1, 1.99, 4];

  print("\nPrice listing with \$ prefix");

  //The $ symbol is passed
  print(prices.priceLabels("\$"));
}
