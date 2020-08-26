extension MyDouble on double {
  double tenTimes() => this * 10;
}

void main() {
  //TRY: enable following line to observe the runtime exception
  //dynamic myDouble = 10.0;
  double myDouble = 10.0;

  print(myDouble.tenTimes());
}
