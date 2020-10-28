import 'package:flutter/material.dart';

///
void main() => runApp(StreamBuilderDemo());

class StreamBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStreamBuilderWidget(),
    );
  }
}

class MyStreamBuilderWidget extends StatefulWidget {
  MyStreamBuilderWidget({Key key}) : super(key: key);

  @override
  _MyStreamBuilderWidgetState createState() => _MyStreamBuilderWidgetState();
}

class _MyStreamBuilderWidgetState extends State<MyStreamBuilderWidget> {
  Stream<int> _streamData = (() async* {
    await Future<void>.delayed(Duration(seconds: 3));
    yield 3;
    await Future<void>.delayed(Duration(seconds: 3));
  })();

  Stream<int> _streamError = (() async* {
    await Future<void>.delayed(Duration(seconds: 3));
    yield throw ("Error in calculating number");
  })();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<int>(
          stream: _streamData,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            Widget futureChild;
            if (snapshot.hasError) {
              //show error message
              futureChild =
                  Text("Error occurred fetching data [${snapshot.error}]");
            } else if (snapshot.connectionState == ConnectionState.done) {
              //success
              futureChild = Text("Number received is ${snapshot.data}");
            } else if (snapshot.connectionState == ConnectionState.active) {
              //stream is connected but not finished yet.
              futureChild = Text("Loading....");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              //waiting for data to arrive
              futureChild = CircularProgressIndicator();
            } else {
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
