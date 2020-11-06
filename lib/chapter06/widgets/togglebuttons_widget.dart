import 'package:flutter/material.dart';

/// Horizontal toggle buttons
void main() => runApp(ToggleButtonsDemo());

class ToggleButtonsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToggleButtonsWidget(),
    );
  }
}

class MyToggleButtonsWidget extends StatefulWidget {
  MyToggleButtonsWidget({Key key}) : super(key: key);

  @override
  _MyToggleButtonsWidgetState createState() => _MyToggleButtonsWidgetState();
}

bool isLocal = true;

class _MyToggleButtonsWidgetState extends State<MyToggleButtonsWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToggleButtons Widget"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              padding: const EdgeInsets.all(20.0),
              child: isLocal == true
                  ? Image.asset("assets/flutter_icon.png")
                  : Image.network(
                      "https://github.com/ptyagicodecamp/flutter_cookbook2/raw/master/assets/flutter_icon.png"),
            ),
            SizedBox(
              height: 40,
            ),
            isLocal == true
                ? Text(
                    "Local",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    "Internet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
            SizedBox(
              height: 40,
            ),
            ToggleButtons(
              children: [
                Icon(Icons.airplanemode_off),
                Icon(Icons.airplanemode_on),
              ],
              isSelected: [!isLocal, isLocal],
              onPressed: (int index) {
                setState(() {
                  isLocal = !isLocal;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
