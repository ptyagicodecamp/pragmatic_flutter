import 'package:flutter/material.dart';
import 'package:pragmatic_flutter/chapter09/layouts/multi/indexed_stack.dart';
import 'package:pragmatic_flutter/chapter09/layouts/multi/stack.dart';

import '../../chapter09/layouts/single/constrained_box.dart';
import '../../chapter09/layouts/single/padding.dart';
import '../layouts/single/container.dart';
import 'codefile.dart';
import 'home.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = '/';
const SHOW_CODE_FILE = 'SHOW_CODE_FILE';

const CONTAINER = 'CONTAINER';
const PADDING = 'PADDING';
const CONSTRAINED_BOX = "constrained_box";
const INTRINSIC_HEIGHT = 'INTRINSIC_HEIGHT';
const INTRINSIC_WEIGHT = 'INTRINSIC_WEIGHT';
const LIMITED_BOX = 'LIMITED_BOX';
const OVERFLOW_BOX = 'OVERFLOW_BOX';
const SIZED_BOX = 'SIZED_BOX';
const SIZED_OVERFLOW_BOX = 'SIZED_OVERFLOW_BOX';

const LIST_VIEW = 'LIST_VIEW';
const ROW = 'ROW';
const COLUMN = 'COLUMN';
const STACK = 'STACK';
const INDEXED_STACK = 'INDEXED_STACK';
const FLOW = 'FLOW';
const TABLE = 'TABLE';
const GRID_VIEW = 'GRID_VIEW';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case CONSTRAINED_BOX:
      return MaterialPageRoute(builder: (context) => ConstrainedBoxDemo());
      break;

    case PADDING:
      return MaterialPageRoute(builder: (context) => PaddingDemo());
      break;

    case CONTAINER:
      return MaterialPageRoute(builder: (context) => MyContainer());
      break;

    case STACK:
      return MaterialPageRoute(builder: (context) => StackDemo());
      break;

    case INDEXED_STACK:
      return MaterialPageRoute(builder: (context) => IndexedStackDemo());
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
