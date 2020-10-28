import 'package:flutter/material.dart';

///
void main() => runApp(PlaceholderDemo());

class PlaceholderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPlaceholderWidget(),
    );
  }
}

class MyPlaceholderWidget extends StatefulWidget {
  MyPlaceholderWidget({Key key}) : super(key: key);

  @override
  _MyPlaceholderWidgetState createState() => _MyPlaceholderWidgetState();
}

class _MyPlaceholderWidgetState extends State<MyPlaceholderWidget> {
  Future<String> _futureData = Future<String>.delayed(
      Duration(seconds: 3), () => 'assets/flutter_icon.png');

  Future<String> _futureError = Future<String>.delayed(
      Duration(seconds: 3), () => throw ("This is error message"));

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Placeholder Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<String>(
          future: _futureData,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Widget futureChild;
            if (snapshot.hasData) {
              //success
              futureChild = Image.asset(snapshot.data);
            } else if (snapshot.hasError) {
              //show error message
              futureChild =
                  Text("Error occurred fetching data [${snapshot.error}]");
            } else {
              //Placeholder widget while waiting for data to arrive
              futureChild = Container(
                height: 200,
                width: 200,
                child: Placeholder(
                  color: Colors.deepPurple,
                ),
              );
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
