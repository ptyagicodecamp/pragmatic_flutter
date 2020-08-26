//Sequencing order of asynchronous calls

void getDataA() {
  print("dataA");
}

void getDataB() {
  print("dataB");
}

String getDataC() {
  return "dataC";
}

//Entry point function
Future<void> sequencingOperations() async {
  //Order matters.
  //Functions will execute in the order they were called.
  await getDataA();
  await getDataB();

  //getDataC() will execute first and will
  //pass its data into print() function
  print(await getDataC());
}
//----END----//

//Entry point function
void main() {
  sequencingOperations();
}
