//Accessing Stream using `listen`

void printStreamEventsUsingListen() {
  //Stream is created
  Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  print("Stream Starting");
  stream.listen(
    (s) => print(s),
  );
  print("Stream Finished");
}
//----END----//

//Entry point function
void main() {
  printStreamEventsUsingListen();
}
