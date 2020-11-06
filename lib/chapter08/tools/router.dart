import 'package:flutter/material.dart';

import '../layouts/expanded.dart';
import '../layouts/fitted_box.dart';
import '../layouts/flexible.dart';
import '../layouts/fractionally_sized_box.dart';
import '../layouts/layoutbuilder.dart';
import '../layouts/wrap.dart';
import 'codefile.dart';
import 'home.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = '/';
const SHOW_CODE_FILE = 'SHOW_CODE_FILE';

const FITTED_BOX = 'FITTED_BOX';
const EXPANDED = 'EXPANDED';
const FLEXIBLE = 'FLEXIBLE';
const FRACTIONALLY_SIZED_BOX = 'FRACTIONALLY_SIZED_BOX';
const LAYOUT_BUILDER = 'LAYOUT_BUILDER';
const WRAP = 'WRAP';

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

    case FRACTIONALLY_SIZED_BOX:
      return MaterialPageRoute(
          builder: (context) => FractionallySizedBoxDemo());
      break;

    case LAYOUT_BUILDER:
      return MaterialPageRoute(builder: (context) => LayoutBuilderDemo());
      break;
    case WRAP:
      return MaterialPageRoute(builder: (context) => WrapDemo());
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
