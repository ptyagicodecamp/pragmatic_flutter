import 'package:flutter/material.dart';

void main() => runApp(ContainerDemo());

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyContainer(),
    );
  }
}

class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

Map<int, String> dropdown = {
  -1: 'RESET',
  0: 'Add Color',
  1: 'Add Padding',
  2: 'Add Margin',
  3: 'Align Center',
  4: 'BoxConstraints',
  5: 'Transform',
  6: 'Decoration'
};

class _MyContainerState extends State<MyContainer> {
  @override
  void didUpdateWidget(MyContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;
  bool showColor = false;
  bool addPadding = false;
  bool addMargin = false;
  bool alignCenter = false;
  bool boxConstraints = false;
  bool transform = false;
  bool decoration = false;
  String dropDownValue;

  //Box constraints to create a box for the given width and/or height.
  BoxConstraints _boxConstraints =
      BoxConstraints.tightFor(width: 100.0, height: 100.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            hint: dropDownValue == null ? Text('Select') : Text(dropDownValue),
            items: dropdown.keys
                .map((e) => DropdownMenuItem(
                      child: Text(dropdown[e]),
                      onTap: () {
                        setState(() {
                          _currentOption = e;

                          updateContainer(_currentOption);
                        });
                      },
                      value: e,
                    ))
                .toList(),
            onChanged: (newValue) {
              print(newValue);
              dropDownValue = dropdown[newValue];
            },
          )
        ],
      ),
      body: Container(
        color: showColor == true && decoration == false ? Colors.red : null,
        padding: addPadding == true ? const EdgeInsets.all(16.0) : null,
        margin: addMargin == true ? const EdgeInsets.all(20.0) : null,
        alignment: alignCenter == true ? Alignment.center : null,
        constraints: boxConstraints == true ? _boxConstraints : null,
        transform: transform == true ? Matrix4.rotationZ(0.3) : null,
        decoration: decoration == true && showColor == false
            ? BoxDecoration(
                border: Border.all(
                  color: Colors.amber,
                  width: 5.0,
                  style: BorderStyle.solid,
                ),
              )
            : null,
        child: Text(
          "Hello Container",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  void updateContainer(int option) {
    switch (option) {
      case 0:
        showColor = true;
        break;
      case 1:
        addPadding = true;
        break;
      case 2:
        addMargin = true;
        break;
      case 3:
        alignCenter = true;
        break;
      case 4:
        boxConstraints = true;
        break;
      case 5:
        transform = true;
        break;
      case 6:
        decoration = true;
        break;
      default:
        showColor = false;
        addPadding = false;
        addMargin = false;
        alignCenter = false;
        boxConstraints = false;
        transform = false;
        decoration = false;
    }
  }
}
