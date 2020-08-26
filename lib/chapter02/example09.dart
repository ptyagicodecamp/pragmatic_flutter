enum Weather {
  sunny,
  cloudy,
  rainy,
}
void main() {
  //Enums can iterate on all types at once.
  //No need to create a list of const
  Weather.values.forEach((w) => print(w));
}
