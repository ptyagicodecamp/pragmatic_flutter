import 'package:flutter/material.dart';

/// FittedBox fits it child with in the given space during layout to avoid overflows.
void main() => runApp(FittedBoxDemo());

class FittedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFittedBox(),
    );
  }
}

class MyFittedBox extends StatefulWidget {
  @override
  _MyFittedBoxState createState() => _MyFittedBoxState();
}

int noFittedBox = 0;
int withFittedBox = 1;

Map<int, String> dropdown = {
  noFittedBox: "No FittedBox",
  withFittedBox: 'FittedBox',
};

class _MyFittedBoxState extends State<MyFittedBox> {
  @override
  void didUpdateWidget(MyFittedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;
  String dropDownValue = dropdown[0];
  bool isFittedBox = false;

  @override
  void initState() {
    super.initState();
    updateContainer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox Widget"),
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
                                ? noFittedBox
                                : withFittedBox);
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
      //FittedBox Widget Usage
      body: isFittedBox
          ? FittedBox(
              child: rowOfImages(),
            )
          : rowOfImages(),
    );
  }

  Widget rowOfImages() {
    return Row(
      children: [
        Image.asset('assets/flutter_icon.png'),
        Image.asset('assets/flutter_icon.png'),
      ],
    );
  }

  void updateContainer(int option) {
    switch (option) {
      case 0:
        setState(() {
          isFittedBox = false;
        });
        break;
      case 1:
        setState(() {
          isFittedBox = true;
        });
        break;
    }
  }
}
