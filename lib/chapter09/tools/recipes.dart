import 'package:flutter/material.dart';

import 'router.dart' as router;
import 'screen_args.dart';

class RecipeWidget extends StatelessWidget {
  final String name;
  final String description;
  final String pageName;
  final String codeFilePath;
  final String codeGithubPath;

  RecipeWidget(this.name, this.description, this.pageName, this.codeFilePath,
      this.codeGithubPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.grey[100],
          child: ListTile(
            isThreeLine: true,
            title: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                this.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            subtitle: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.description,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.slideshow),
                          onPressed: () => Navigator.pushNamed(
                            context,
                            this.pageName,
                            arguments: ScreenArguments(this.name, this.pageName,
                                this.codeFilePath, this.codeGithubPath),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(Icons.code),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          router.SHOW_CODE_FILE,
                          arguments: ScreenArguments(this.name, this.pageName,
                              this.codeFilePath, this.codeGithubPath),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
