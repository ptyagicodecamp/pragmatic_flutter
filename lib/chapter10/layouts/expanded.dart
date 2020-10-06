import 'package:flutter/material.dart';

void main() => runApp(ExpandedDemo());

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyExpanded(),
    );
  }
}

class MyExpanded extends StatefulWidget {
  @override
  _MyExpandedState createState() => _MyExpandedState();
}

int noFlex = 0;
int withFlex = 1;

Map<int, String> dropdown = {
  noFlex: "No `flex` Property",
  withFlex: 'Using `flex`',
};

class _MyExpandedState extends State<MyExpanded> {
  @override
  void didUpdateWidget(MyExpanded oldWidget) {
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
                hint: dropDownValue == null
                    ? Text('Select')
                    : Text(dropDownValue),
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
        //Expanded Widget Usage
        body: isFlex ? expandedWithFlex() : expandedDefault());
  }

  Widget expandedWithFlex() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: childWidget("4/8"),
        ),
        Expanded(
          flex: 3,
          child: childWidget("3/8"),
        ),
        Expanded(
          flex: 1,
          child: childWidget("1/8"),
        ),
      ],
    );
  }

  Widget expandedDefault() {
    return Row(
      children: [
        Expanded(
          child: childWidget(""),
        ),
        Expanded(
          child: childWidget(""),
        ),
        Expanded(
          child: childWidget(""),
        ),
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
