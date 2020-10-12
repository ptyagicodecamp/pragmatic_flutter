import 'package:flutter/material.dart';

/// Row widget creates horizontal array of children
void main() => runApp(RowDemo());

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyRow(),
    );
  }
}

class MyRow extends StatefulWidget {
  @override
  _MyRowState createState() => _MyRowState();
}

int noFlex = 0;
int withFlex = 1;

Map<int, String> dropdown = {
  noFlex: "No `flex` Property",
  withFlex: 'Using `flex`',
};

class _MyRowState extends State<MyRow> {
  @override
  void didUpdateWidget(MyRow oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;
  String dropDownValue = dropdown[0];
  bool isFlex = false;

  @override
  void initState() {
    super.initState();
    updateContainer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Widget"),
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

                            updateContainer(
                                _currentOption == 0 ? noFlex : withFlex);
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
      //Row Widget Usage
      body: rowWidget(),
    );
  }

  Widget rowWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        childWidget("1"),
        childWidget("2"),
        childWidget("3"),
      ],
    );
  }

  Widget childWidget(String text) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/flutter_icon.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
      ),
      child: Text(text),
    );
  }

  void updateContainer(int option) {
    switch (option) {
      case 0:
        setState(() {
          isFlex = false;
        });
        break;
      case 1:
        setState(() {
          isFlex = true;
        });
        break;
    }
  }
}
