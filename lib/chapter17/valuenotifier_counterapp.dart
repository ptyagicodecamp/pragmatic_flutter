import 'package:flutter/material.dart';

/// Chapter17: ValueNotifier
///
//Uncomment the line below to run from this file
//void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CounterApp (ValueNotifier)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  void _incrementCounter() {
    _counter.value += 1;
  }

  @override
  Widget build(BuildContext context) {
    print("Building _MyHomePageState");
    //Widget#1
    return Scaffold(
      //Widget#2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Widget#3
      body: Center(
        //Widget#5
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Widget#6
            Text(
              'You have pushed the button this many times:',
            ),
            //Widget#7. Builds when valueNotifier is changed/updated
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget child) {
                print("Building ONLY Text widget");
                //Widget#8
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              valueListenable: _counter,
            ),
          ],
        ),
      ),
      //Widget#4
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
