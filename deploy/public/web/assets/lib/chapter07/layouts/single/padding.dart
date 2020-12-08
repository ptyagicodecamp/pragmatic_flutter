import 'package:flutter/material.dart';

/// Padding insets its child as per the given padding.

void main() => runApp(PaddingDemo());

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPadding(),
    );
  }
}

class MyPadding extends StatefulWidget {
  @override
  _MyPaddingState createState() => _MyPaddingState();
}

Map<int, String> dropdown = {
  -1: "RESET",
  0: 'Increase Padding',
  1: 'Decrease Padding',
};

enum PaddingConfig {
  increment,
  decrement,
  reset,
}

class _MyPaddingState extends State<MyPadding> {
  @override
  void didUpdateWidget(MyPadding oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;

  String dropDownValue;

  double padding = 8.0;
  bool increasePadding = false;
  bool decreasePadding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            "Padding: $padding",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.start,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: DropdownButton(
              hint:
                  dropDownValue == null ? Text('Select') : Text(dropDownValue),
              items: dropdown.keys
                  .map((e) => DropdownMenuItem(
                        child: Text(dropdown[e]),
                        onTap: () {
                          setState(() {
                            _currentOption = e;

                            updateContainer(_currentOption == 0
                                ? PaddingConfig.increment
                                : _currentOption == 1
                                    ? PaddingConfig.decrement
                                    : PaddingConfig.reset);
                          });
                        },
                        value: e,
                      ))
                  .toList(),
              onChanged: (newValue) {
                print(newValue);
                dropDownValue = dropdown[newValue];
              },
            ),
          )
        ],
      ),
      //Padding Widget Usage
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          "Hello Padding",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  void updateContainer(PaddingConfig option) {
    switch (option) {
      case PaddingConfig.increment:
        setState(() {
          padding += 16.0;
        });
        break;
      case PaddingConfig.decrement:
        setState(() {
          if (padding > 16) padding -= 16.0;
        });
        break;

      default:
        setState(() {
          padding = 8.0;
        });
    }
  }
}
