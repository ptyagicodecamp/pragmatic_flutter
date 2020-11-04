//Local extension method
extension<T> on List<T> {
  //Extension Method demonstration
  List<T> priceList() => this.map((item) => item).toList();
}

void main() {
  //List of prices
  List prices = [1, 1.99, 4];

  print("Price listing:");

  //priceList() is being called on `prices` list
  print(prices.priceList());
}
