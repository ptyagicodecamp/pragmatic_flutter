//Using `Future.wait()`

Future<String> getData(data) async {
  return await data;
}

Future<String> getDataAFuture() async {
  return await getData("dataA");
}

Future<String> getDataBFuture() async {
  return await getData("dataB");
}

Future<String> getDataCFuture() async {
  return await getData("dataC");
}

void executeFutureAPIWait() async {
  //Chaining Futures in order
  await Future.wait([
    getDataAFuture(),
    getDataBFuture(),
    getDataCFuture(),
  ])
      .then(
        (List responses) => print(responses),
      )
      .catchError((error) => print(error));
}
//----END----//

//Entry point function
void main() {
  executeFutureAPIWait();
}
