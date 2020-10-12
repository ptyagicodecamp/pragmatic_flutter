import 'package:flutter/material.dart';

/// Flexible widget controls how child of Row, Column,
/// or Flex widgets flexes.
void main() => runApp(FlexibleDemo());

class FlexibleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFlexible(),
    );
  }
}

class MyFlexible extends StatefulWidget {
  @override
  _MyFlexibleState createState() => _MyFlexibleState();
}

int tight = 0;
int loose = 1;

Map<int, String> dropdown = {
  tight: "FlexFit.tight",
  loose: 'FlexFit.loose',
};

class _MyFlexibleState extends State<MyFlexible> {
  @override
  void didUpdateWidget(MyFlexible oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _currentOption = 0;
  String dropDownValue = dropdown[0];
  bool isLoose = false;

  @override
  void initState() {
    super.initState();
    updateContainer(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible Widget"),
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
                                _currentOption == 0 ? tight : loose);
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
      //Flexible Widget Usage
      body: Row(
        children: [
          Flexible(
            fit: isLoose ? FlexFit.loose : FlexFit.tight,
            flex: 4,
            child: childWidget("4/8"),
          ),
          Flexible(
            fit: isLoose ? FlexFit.loose : FlexFit.tight,
            flex: 3,
            child: childWidget("3/8"),
          ),
          Flexible(
            fit: isLoose ? FlexFit.loose : FlexFit.tight,
            flex: 1,
            child: childWidget("1/8"),
          ),
        ],
      ),
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
          isLoose = false;
        });
        break;
      case 1:
        setState(() {
          isLoose = true;
        });
        break;
    }
  }
}
