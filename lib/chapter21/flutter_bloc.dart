import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//void main() {
//  runApp(CounterApp());
//}

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
      home: MyHomePage(title: 'BLoC Library Demo'),
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
  _MyHomePageState({Key key, this.title}) : super();

  final String title;

  //#2: Initializing Bloc (listening)
  final CounterBloc _bloc = CounterBloc(CounterState.initial());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            //#6: Rebuilding Text widget for new state (count)
            BlocBuilder<CounterBloc, CounterState>(
              cubit: _bloc,
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //#1: Events added to eventController's sink
        onPressed: () => _bloc.add(IncrementEvent()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

//Option #2 to declare Counter's State
class CounterState {
  final int counter;

  const CounterState({this.counter});

  factory CounterState.initial() => CounterState(counter: 0);
}

//Note:
// #1 (adding events), #3 (mapping event to state logic-business logic), #6 (re-building widgets to reflect new state on the interface)
//Managed by BLoC library: #2 (initializing to listening to the event stream), #4 (adding state to state stream's sink), #5-providing state's stream to interface

//#2: Taken care by Bloc library (listening to events)
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //Initializing initial CounterState
  CounterBloc(CounterState initialState) : super(initialState);

  //#3: Mapping events to their corresponding state based on the business logic
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      //#4 + #5: Stream<State> provides the stream of state. Heavy lifting done by BLoC library
      yield CounterState(counter: state.counter + 1);
    }
  }
}
