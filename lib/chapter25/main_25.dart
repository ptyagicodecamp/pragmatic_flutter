import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Demonstrating Widget Testing
void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Counter {
  int number = 0;

  void increment() => number++;
  void decrement() => number--;
}

class _MyHomePageState extends State<MyHomePage> {
  Counter _counter = Counter();

  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyTextWidget(
              myKey: Key('L'),
              textString: 'My Counter:',
              style: Theme.of(context).textTheme.headline4,
            ),
            MyTextWidget(
              myKey: Key('N'),
              textString: '${_counter.number}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  key: Key('D'),
                  color: Colors.red,
                  onPressed: () => _decrementCounter(),
                  child: FaIcon(FontAwesomeIcons.minus),
                ),
                RaisedButton(
                  key: Key('I'),
                  color: Colors.green,
                  onPressed: () => _incrementCounter(),
                  child: FaIcon(FontAwesomeIcons.plus),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  final String textString;
  final TextStyle style;
  final Key myKey;

  const MyTextWidget({this.myKey, this.textString, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: style,
      //Need to specify the directionality because this widget will be tested independently.
      //You don't need to specify textDirection in your Text widget when it's a child to Scaffold widget because textDirection is implicitly provided in that case.
      textDirection: TextDirection.ltr,
      key: myKey,
    );
  }
}
