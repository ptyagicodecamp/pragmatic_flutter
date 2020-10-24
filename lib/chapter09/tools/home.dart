import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  /// Single-child layout widgets. Purple background to group.
  ///Container layout widget
  RecipeWidget(
    title: "Container",
    description:
        "Container is single-child layout widget. Can apply style to its child widget to change the background color or shape and size",
    listTileColor: Colors.deepPurpleAccent,
    pageName: router.CONTAINER,
    codeFilePath: "lib/chapter09/layouts/single/container.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "Padding",
    description:
        "Padding is a single-child layout widget. It insets its child as per the given padding.",
    listTileColor: Colors.deepPurpleAccent,
    pageName: router.CONTAINER,
    codeFilePath: "lib/chapter09/layouts/single/padding.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "ConstrainedBox",
    description:
        "ConstrainedBox is a single-child layout widget. This layout widget puts additional constraints on its child. ",
    listTileColor: Colors.deepPurpleAccent,
    pageName: router.CONTAINER,
    codeFilePath: "lib/chapter09/layouts/single/constrained_box.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "IntrinsicHeight",
    description:
        "IntrinsicHeight is a single-child layout widget. Expands all the child widgets of Row to the same size of the tallest child widget.",
    listTileColor: Colors.deepPurpleAccent,
    pageName: router.INTRINSIC_HEIGHT,
    codeFilePath: "lib/chapter09/layouts/single/intrinsic_height.dart",
    codeGithubPath: "",
    children: [],
  ),
  RecipeWidget(
    title: "IntrinsicWidth",
    description:
        "IntrinsicWidth is a single-child layout widget. Expands all the child widgets of Column to the same size of the widest child widget.",
    listTileColor: Colors.deepPurpleAccent,
    pageName: router.INTRINSIC_WEIGHT,
    codeFilePath: "lib/chapter09/layouts/single/intrinsic_width.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "SizedBox",
    description: "SizedBox is a single-child layout widget. ",
    listTileColor: Colors.deepPurpleAccent,
    pageName: router.SIZED_BOX,
    codeFilePath: "lib/chapter09/layouts/single/sized_box.dart",
    codeGithubPath: "",
    children: [],
  ),

  /// Multi-child layout widgets. LightGreen background to group.
  RecipeWidget(
    title: "Row",
    description:
        "Row is a multi-child layout widget. It arranges its children horizontally",
    listTileColor: Colors.lightGreen,
    pageName: router.ROW,
    codeFilePath: "lib/chapter09/layouts/multi/row.dart",
    codeGithubPath: "",
    children: [],
  ),
  RecipeWidget(
    title: "Column",
    description:
        "Column is a multi-child layout widget. It arranges its children vertically",
    listTileColor: Colors.lightGreen,
    pageName: router.COLUMN,
    codeFilePath: "lib/chapter09/layouts/multi/column.dart",
    codeGithubPath: "",
    children: [],
  ),
  RecipeWidget(
    title: "ListView",
    description: "ListView is a multi-child layout widget.",
    listTileColor: Colors.lightGreen,
    pageName: router.LIST_VIEW,
    codeFilePath: "lib/chapter09/layouts/multi/listview.dart",
    codeGithubPath: "",
    children: [],
  ),
  RecipeWidget(
    title: "GridView",
    description: "GridView is a multi-child layout widget.",
    listTileColor: Colors.lightGreen,
    pageName: router.GRID_VIEW,
    codeFilePath: "lib/chapter09/layouts/multi/grid_view.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "Table",
    description: "Table is a multi-child layout widget.",
    listTileColor: Colors.lightGreen,
    pageName: router.TABLE,
    codeFilePath: "lib/chapter09/layouts/multi/table.dart",
    codeGithubPath: "",
    children: [],
  ),

  RecipeWidget(
    title: "Stack",
    description: "Stack is a multi-child layout widget. ",
    listTileColor: Colors.lightGreen,
    pageName: router.STACK,
    codeFilePath: "lib/chapter09/layouts/multi/stack.dart",
    codeGithubPath: "",
    children: [],
  ),
  RecipeWidget(
    title: "IndexedStack",
    description: "IndexedStack is a multi-child layout widget. ",
    listTileColor: Colors.lightGreen,
    pageName: router.INDEXED_STACK,
    codeFilePath: "lib/chapter09/layouts/multi/indexed_stack.dart",
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
        title: Text('Chapter09: Flutter Layouts'),
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
