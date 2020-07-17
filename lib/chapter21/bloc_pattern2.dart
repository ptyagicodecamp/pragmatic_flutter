import 'dart:async';

import 'package:flutter/material.dart';

//Uses CounterEvent class for events
//User CounterState class for states

void main() {
  runApp(MyApp());
}

//Option #1 to declare CounterEvent
//enum CounterEvent { increment }

//Option #2 to declare CounterEvent
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

//Option #2 to declare Counter's State
class CounterState {
  final int counter;

  const CounterState({this.counter});

  factory CounterState.initial() => CounterState(counter: 0);
}

class CounterBloc {
  //#0: Setting up event and state controllers and their sink and streams
  //Interface putting events into sink _eventController's sink.
  final _eventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get eventSink => _eventController.sink;

  CounterState _currentState = CounterState.initial();

  //Controller for State
  final _stateController = StreamController<CounterState>();
  //State stream's Sink to add states into
  StreamSink<CounterState> get _stateSink => _stateController.sink;

  //#5: StateController's stream is providing the updated state(s)
  //Stream of states. public
  Stream<CounterState> get counter => _stateController.stream;

  //#2: Event controller's stream is listening to the events and feeding into eventToState mapper
  //Listening to incoming UI events and mapping them into corresponding output States
  CounterBloc() {
    _eventController.stream.listen(
      (event) {
        _mapEventToState(event);
      },
    );

    //shorthand
    //_eventController.stream.listen(_mapEventToState);
  }

  //#3: Mapping events to their corresponding state based on the business logic
  void _mapEventToState(CounterEvent event) {
    //Increment counter if event is matched
    if (event is IncrementEvent) {
      _currentState = CounterState(counter: _currentState.counter + 1);
    }

    //#4: Adding newly formed state is added into State controller's sink
    //update the _counter value into stateController's sink (_stateSink)
    _stateSink.add(_currentState);
  }

  //close stream controllers to stop memory leak
  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BLoC Pattern #2'),
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
  final _bloc = CounterBloc();

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
            //#6: StreamBuilder builds the Text widget based on new state received from _bloc's StateController's stream
            StreamBuilder<CounterState>(
              stream: _bloc.counter,
              initialData: CounterState.initial(),
              builder:
                  (BuildContext context, AsyncSnapshot<CounterState> snapshot) {
                return Text(
                  "${snapshot.data.counter}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //#1: Events added to eventController's sink
        onPressed: () => _bloc.eventSink.add(IncrementEvent()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    //Close bloc's stream controllers
    _bloc.dispose();
  }
}
