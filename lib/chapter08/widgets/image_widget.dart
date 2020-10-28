import 'package:flutter/material.dart';

///
void main() => runApp(ImageWidgetDemo());

class ImageWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyImageWidget(),
    );
  }
}

class MyImageWidget extends StatefulWidget {
  MyImageWidget({Key key}) : super(key: key);

  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();
}

bool isLocal = true;

class _MyImageWidgetState extends State<MyImageWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(20.0),
          child: loadInternetImage(),
        ),
      ),
    );
  }

  Widget loadLocalImage() {
    return Image.asset("assets/flutter_icon.png");
  }

  Widget loadInternetImage() {
    return Image.network(
        "https://github.com/ptyagicodecamp/flutter_cookbook2/raw/master/assets/flutter_icon.png");
  }
}
