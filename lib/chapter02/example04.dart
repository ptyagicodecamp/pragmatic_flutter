extension<T> on List<T> {
  //Extension Operator: Reduce all prices by half
  List<num> operator -() =>
      this.map((item) => num.parse("${item}") / 2).toList();
}

void main() {
  //List of prices
  List prices = [1, 1.99, 4];

  print(
      "\nSale Price listing: prices are reduced by half of the original value");

  //no-arg operator is put before the list variable
  print(-prices);
}
