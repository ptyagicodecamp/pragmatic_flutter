import 'package:flutter/material.dart';

import 'router.dart' as router;
import 'screen_args.dart';

class RecipeWidget extends StatelessWidget {
  final String title;
  final String description;
  final String pageName;
  final String codeFilePath;
  final String codeGithubPath;
  final List<RecipeWidget> children;
  final Color listTileColor;

  RecipeWidget(
      {this.title,
      this.description,
      this.pageName,
      this.codeFilePath,
      this.codeGithubPath,
      this.listTileColor,
      this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: ListTile(
        tileColor: this.listTileColor ?? Colors.white,
        isThreeLine: true,
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            this.title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.slideshow),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    this.pageName,
                    arguments: ScreenArguments(this.title, this.pageName,
                        this.codeFilePath, this.codeGithubPath),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.code),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    router.SHOW_CODE_FILE,
                    arguments: ScreenArguments(this.title, this.pageName,
                        this.codeFilePath, this.codeGithubPath),
                  ),
                ),
              ],
            ),
            Text(
              this.description,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
