//Example#3. Processing (Adding) Stream using `await for`

void addNumbersInStream() async {
  //Create a Stream consists of numbers
  Stream stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  var total = await addEvents(stream);
  print(total);
}

//Receiving events from Stream, adding and returning total sum
Future<int> addEvents(Stream<int> stream) async {
  var total = 0;
  await for (var num in stream) {
    total += num;
  }

  return total;
}
//----END----//

//Entry point function
void main() {
  //Run Example#3.
  addNumbersInStream();
}
