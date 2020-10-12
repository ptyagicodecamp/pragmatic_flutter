import 'package:flutter/material.dart';
import 'package:pragmatic_flutter/chapter10/layouts/expanded.dart';
import 'package:pragmatic_flutter/chapter10/layouts/fitted_box.dart';
import 'package:pragmatic_flutter/chapter10/layouts/flexible.dart';

import 'codefile.dart';
import 'home.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = '/';
const SHOW_CODE_FILE = 'SHOW_CODE_FILE';

const FITTED_BOX = 'FITTED_BOX';
const EXPANDED = 'EXPANDED';
const FLEXIBLE = 'FLEXIBLE';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case EXPANDED:
      return MaterialPageRoute(builder: (context) => ExpandedDemo());
      break;

    case FLEXIBLE:
      return MaterialPageRoute(builder: (context) => FlexibleDemo());
      break;

    case FITTED_BOX:
      return MaterialPageRoute(builder: (context) => FittedBoxDemo());
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
