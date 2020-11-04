extension<T> on List<T> {
  //Extension Property: 3 printed labels for each price.
  int get labelCount => length * 3;
}

void main() {
  //List of prices
  List prices = [1, 1.99, 4];

  print("\nNumber of Printed Labels:");
  print(prices.labelCount);
}
