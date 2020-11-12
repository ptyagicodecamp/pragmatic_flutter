import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chapter18: Provider + ChangeNotifier
///
//The CounterApp uses Provider package + ChangeNotifier
//void main() {
//  //Providers are above CounterApp.
//  runApp(
//    ChangeNotifierProvider(
//      create: (_) => CountNotifier(),
//      child: CounterApp(),
//    ),
//  );
//}

//ChangeNotifier. Notifies about the change/update in counter
class CountNotifier with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    print("Incrementing and notifying");
    _counter++;
    //Notifies about the change in counter
    notifyListeners();
  }
}

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
      home: MyHomePage(title: 'CounterApp (Provider + ChangeNotifier)'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building MyHomePage widget");
    //Widget#1
    return Scaffold(
      //Widget#2
      appBar: AppBar(
        title: Text(this.title),
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

            //Widget#7
            //Extracting into separate widget helps it to rebuild independently of [HomePage]
            const CountWidget(),
          ],
        ),
      ),
      //Widget#4
      floatingActionButton: FloatingActionButton(
        //Using read() instead of watch() helps NOT TO rebuild the widget when there's change in count (or Counter ChangeNotifier notifies)
        onPressed: () => context.read<CountNotifier>().incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//Implementation of Widget#7
class CountWidget extends StatelessWidget {
  const CountWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Building Count widget");
    //Widget#8
    return Text(
      //Rebuilds [CountWidget] when [CountNotifier] ChangeNotifier notifies about the change in count
      '${context.watch<CountNotifier>().counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
