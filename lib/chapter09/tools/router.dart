import 'package:flutter/material.dart';
import 'package:pragmatic_flutter/chapter09/layouts/single/padding.dart';

import '../layouts/multi/listbody.dart';
import '../layouts/single/container.dart';
import 'codefile.dart';
import 'home.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = '/';
const SHOW_CODE_FILE = 'SHOW_CODE_FILE';
const ALERT_DIALOG = 'ALERT_DIALOG';
const CONTAINER = 'CONTAINER';
const PADDING = 'PADDING';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case PADDING:
      return MaterialPageRoute(builder: (context) => MyPadding());
      break;

    case ALERT_DIALOG:
      return MaterialPageRoute(builder: (context) => AlertDialogDemo());
      break;
    case CONTAINER:
      return MaterialPageRoute(builder: (context) => MyContainer());
      break;

    case SHOW_CODE_FILE:
      final ScreenArguments screenArgs = routeSettings.arguments;

      return MaterialPageRoute(
          builder: (context) => CodeFileWidget(
                pageName: screenArgs.pageName,
                recipeName: screenArgs.recipeName,
                codeFilePath: screenArgs.codeFilePath,
                codeGithubPath: screenArgs.codeGithubPath,
              ));
      break;
    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
