extension<T> on List<T> {
  //Extension Operator: Hike up the price by n
  List<num> operator ^(int n) =>
      this.map((item) => num.parse("${item}") * n).toList();
}

void main() {
  //List of prices
  List prices = [1, 1.99, 4];

  print("\nPrice listing after hiking up prices 3x of the original value");

  //argument is passed after the operator sign
  print(prices ^ 3);
}
