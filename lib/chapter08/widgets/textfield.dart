import 'package:flutter/material.dart';

/// Flutter TextField Widget.
/// Let app users enter text data.
void main() => runApp(TextFieldDemo());

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTextFieldWidget(),
    );
  }
}

class MyTextFieldWidget extends StatefulWidget {
  MyTextFieldWidget({Key key}) : super(key: key);

  @override
  _MyTextFieldWidgetState createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  TextEditingController _controller;
  String userText = "";

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _controller,
              onSubmitted: (String value) async {
                setState(() {
                  userText = value;
                  _controller.clear();
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("User entered: $userText"),
          ],
        ),
      ),
    );
  }
}
