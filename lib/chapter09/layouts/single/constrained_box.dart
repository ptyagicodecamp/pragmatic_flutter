import 'package:flutter/material.dart';

/// ConstrainedBox puts additional constrained on its child.

//void main() => runApp(ConstrainedBoxDemo());

class ConstrainedBoxDemo extends StatelessWidget {
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

int minConstraint = 0;
int expandsConstraint = 1;
int looseConstraint = 2;

Map<int, String> dropdown = {
  minConstraint: "Min Width & Height",
  expandsConstraint: 'Expands',
  looseConstraint: 'Loose',
};

class _MyPaddingState extends State<MyPadding> {
  @override
  void didUpdateWidget(MyPadding oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;

  String dropDownValue = dropdown[0];

  String message = "";

  /// Imposes minimum width and height on the child
  BoxConstraints minWidthHeight = BoxConstraints(
    minWidth: 100,
    minHeight: 100,
  );

  /// Expands to the given width and height
  BoxConstraints expands = BoxConstraints.expand(
    width: 200,
    height: 200,
  );

  /// Constraints box to the given size. Can't go beyond the provided size
  BoxConstraints loose = BoxConstraints.loose(
    Size(100, 200),
  );

  BoxConstraints currentConstraint;

  @override
  void initState() {
    super.initState();
    updateContainer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BoxConstraints"),
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
                                ? minConstraint
                                : _currentOption == 1
                                    ? expandsConstraint
                                    : looseConstraint);
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
      //ConstrainedBox Widget Usage
      body: Center(
        child: ConstrainedBox(
          constraints: currentConstraint,
          child: Container(
            color: Colors.grey,
            child: Text(message),
          ),
        ),
      ),
    );
  }

  void updateContainer(int option) {
    switch (option) {
      case 0:
        setState(() {
          currentConstraint = minWidthHeight;
          message =
              "Imposes minimum width and height on the child.\nWidth: 100\nHeight:100";
        });
        break;
      case 1:
        setState(() {
          currentConstraint = expands;
          message =
              "Expands to the given width and height.\nWidth: 200\nHeight:200";
        });
        break;

      case 2:
        setState(() {
          currentConstraint = loose;
          message =
              "Constraints box to the given size. Can't go beyond the provided size.\n"
              "Width: 100\nHeight:200";
        });
        break;
    }
  }
}
