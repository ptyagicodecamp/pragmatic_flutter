//Demonstrating handling exception thrown in asynchronous operations

//Expansive operations ended up throwing exception
String getExpansiveDataWithException() {
  throw Exception("Error occurred in fetching data");
}

//Asynchronous function that makes the expensive data call
Future<void> makeDataCallWithException() async {
  try {
    await getExpansiveDataWithException();
  } catch (e) {
    print(e.toString());
  }
}
//----END----//

//Entry point function
void main() {
  makeDataCallWithException();
}
