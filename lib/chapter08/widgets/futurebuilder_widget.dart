import 'package:flutter/material.dart';

///
void main() => runApp(FutureBuilderDemo());

class FutureBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFutureBuilderWidget(),
    );
  }
}

class MyFutureBuilderWidget extends StatefulWidget {
  MyFutureBuilderWidget({Key key}) : super(key: key);

  @override
  _MyFutureBuilderWidgetState createState() => _MyFutureBuilderWidgetState();
}

class _MyFutureBuilderWidgetState extends State<MyFutureBuilderWidget> {
  Future<int> _futureData = Future<int>.delayed(Duration(seconds: 3), () => 3);

  Future<int> _futureError =
      Future<int>.delayed(Duration(seconds: 3), () => throw ("Sample error"));

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<int>(
          future: _futureData,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            Widget futureChild;
            if (snapshot.hasData) {
              //success
              futureChild = Text("Number received is ${snapshot.data}");
            } else if (snapshot.hasError) {
              //show error message
              futureChild =
                  Text("Error occurred fetching data [${snapshot.error}]");
            } else {
              //waiting for data to arrive
              futureChild = CircularProgressIndicator();
            }

            return Center(
              child: futureChild,
            );
          },
        ),
      ),
    );
  }
}
