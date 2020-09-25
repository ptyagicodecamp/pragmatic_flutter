import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  ///Container layout widget
  RecipeWidget(
    title: "Container",
    description:
        "Can apply style to its child widget to change the background color or shape and size",
    pageName: router.CONTAINER,
    codeFilePath: "lib/chapter09/layouts/single/container.dart",
    codeGithubPath: "",
    children: [
      // RecipeWidget(
      //   title: 'color',
      //   description: "Color property",
      //   pageName: router.CONTAINER,
      //   codeFilePath: "",
      //   codeGithubPath: "",
      //   children: [],
      // )
    ],
  ),

  RecipeWidget(
    title: "Padding",
    description: "Padding insets its child as per the given padding.",
    pageName: router.CONTAINER,
    codeFilePath: "lib/chapter09/layouts/single/padding.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "ConstrainedBox",
    description:
        "This layout widget puts additional constraints on its child. ",
    pageName: router.CONTAINER,
    codeFilePath: "lib/chapter09/layouts/single/constrained_box.dart",
    codeGithubPath: "",
    children: [],
  ),

  ///ListBody widget (Need a parent like AlertDialog)
  RecipeWidget(
      title: "ListBody",
      description: "Added as child to AlertDialog",
      pageName: router.ALERT_DIALOG,
      codeFilePath: "lib/chapter09/layouts/multi/listbody.dart",
      codeGithubPath: "",
      children: []),
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
