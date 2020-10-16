import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  RecipeWidget(
    title: "FittedBox",
    description:
        "FittedBox fits it child with in the given space during layout to avoid overflows.",
    pageName: router.FITTED_BOX,
    codeFilePath: "lib/chapter10/layouts/fitted_box.dart",
    codeGithubPath:
        "https://github.com/ptyagicodecamp/pragmatic_flutter/blob/master/lib/chapter10/layouts/fitted_box.dart",
    children: [],
  ),
  RecipeWidget(
    title: "Expanded",
    description:
        "Expanded widget allows child of Row, Column, or Flex widgets expand to fill the available space along the main axis of parent widget.",
    pageName: router.EXPANDED,
    codeFilePath: "lib/chapter10/layouts/expanded.dart",
    codeGithubPath:
        "https://github.com/ptyagicodecamp/pragmatic_flutter/blob/master/lib/chapter10/layouts/expanded.dart",
    children: [],
  ),
  RecipeWidget(
    title: "Flexible",
    description:
        "Expanded widget allows child of Row, Column, or Flex widgets expand to fill the available space along the main axis of parent widget.",
    pageName: router.FLEXIBLE,
    codeFilePath: "lib/chapter10/layouts/flexible.dart",
    codeGithubPath:
        "https://github.com/ptyagicodecamp/pragmatic_flutter/blob/master/lib/chapter10/layouts/flexible.dart",
    children: [],
  ),
  RecipeWidget(
    title: "FractionallySizedBox",
    description: "Sizes its child to a fraction of total available space.",
    pageName: router.FRACTIONALLY_SIZED_BOX,
    codeFilePath: "lib/chapter10/layouts/fractionally_sized_box.dart",
    codeGithubPath:
        "https://github.com/ptyagicodecamp/pragmatic_flutter/blob/master/lib/chapter10/layouts/fractionally_sized_box.dart",
    children: [],
  ),
  RecipeWidget(
    title: "LayoutBuilder",
    description:
        "LayoutBuilder builds widgets dynamically as per the constraint passed by the parent.",
    pageName: router.LAYOUT_BUILDER,
    codeFilePath: "lib/chapter10/layouts/layoutbuilder.dart",
    codeGithubPath:
        "https://github.com/ptyagicodecamp/pragmatic_flutter/blob/master/lib/chapter10/layouts/layoutbuilder.dart",
    children: [],
  ),
  RecipeWidget(
    title: "Wrap",
    description:
        "Wrap widget is helpful when Row and Column widgets run out of room.",
    pageName: router.WRAP,
    codeFilePath: "lib/chapter10/layouts/wrap.dart",
    codeGithubPath:
        "https://github.com/ptyagicodecamp/pragmatic_flutter/blob/master/lib/chapter10/layouts/wrap.dart",
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
