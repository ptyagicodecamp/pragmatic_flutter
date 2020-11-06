import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  /// Image widget
  RecipeWidget(
    title: "Image",
    description: "Loading images using `Image` widget.",
    pageName: router.IMAGE,
    codeFilePath: "lib/chapter08/widgets/image_widget.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// ToggleButtons
  RecipeWidget(
    title: "ToggleButtons",
    description: "Horizontal toggle buttons.",
    pageName: router.TOGGLE_BUTTONS,
    codeFilePath: "lib/chapter08/widgets/togglebuttons_widget.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// TextField
  RecipeWidget(
    title: "TextField",
    description: "TextField widget let users input text data in the app.",
    pageName: router.TEXT_FIELD,
    codeFilePath: "lib/chapter08/widgets/textfield.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// FutureBuilder
  RecipeWidget(
    title: "FutureBuilder",
    description:
        "The `FutureBuilder` is a widget that builds itself based on the snapshot returned from the `Future` class.",
    pageName: router.FUTURE_BUILDER,
    codeFilePath: "lib/chapter08/widgets/futurebuilder_widget.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// Placeholder
  RecipeWidget(
    title: "Placeholder",
    description:
        "Placeholder widget draws a box that indicates that a new widget will be added at some point in future.",
    pageName: router.PLACEHOLDER,
    codeFilePath: "lib/chapter08/widgets/placeholder_widget.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// StreamBuilder
  RecipeWidget(
    title: "StreamBuilder",
    description:
        "The StreamBuilder is a widget that builds itself based on the asynchronous data events.",
    pageName: router.STREAM_BUILDER,
    codeFilePath: "lib/chapter08/widgets/streambuilder_widget.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// AlertDialog
  RecipeWidget(
    title: "AlertDialog",
    description: "AlertDialog widget in Material and Cupertino styles",
    pageName: router.ALERT_DIALOG,
    codeFilePath: "lib/chapter08/widgets/alert_dialog.dart",
    codeGithubPath: "",
    children: [],
  ),
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 9: Flutter Layouts'),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return recipes[index].children.isNotEmpty
                ? ExpansionTile(
                    title: Text(recipes[index].title),
                    children: [
                      Column(
                        children: recipes[index].children,
                      )
                    ],
                  )
                : recipes[index];
          }),
    );
  }

  List<Widget> _buildExpandable(List<RecipeWidget> subWidgets) {
    List<Widget> listing = [];
    for (RecipeWidget recipe in subWidgets)
      listing.add(
        ListTile(
          title: Text(recipe.title),
        ),
      );

    return listing;
  }
}
