//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Example: Demonstrating usage of `where()`
void filterUsingWhere() {
  var stream = createNumberStream(5);
  stream
      .where((x) => x > 3) //Filters numbers greater than 3
      .listen((x) => print(x)); //prints numbers filtered
}
//----END----//

//Entry point function
void main() {
  filterUsingWhere();
}
