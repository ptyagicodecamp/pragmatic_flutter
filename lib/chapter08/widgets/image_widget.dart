import 'package:flutter/material.dart';

/// Flutter `Image` Widget.
/// Displaying image from local assets folder and URL.
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

  /// Displaying image from local assets folder.
  Widget loadLocalImage() {
    return Image.asset("assets/flutter_icon.png");
  }

  /// Displaying image from URL.
  Widget loadInternetImage() {
    return Image.network(
        "https://github.com/ptyagicodecamp/flutter_cookbook2/raw/master/assets/flutter_icon.png");
  }
}
