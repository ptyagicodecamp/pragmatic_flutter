import 'package:flutter/material.dart';

import '../layouts/multi/column.dart';
import '../layouts/multi/grid_view.dart';
import '../layouts/multi/indexed_stack.dart';
import '../layouts/multi/listview.dart';
import '../layouts/multi/row.dart';
import '../layouts/multi/stack.dart';
import '../layouts/multi/table.dart';
import '../layouts/single/constrained_box.dart';
import '../layouts/single/container.dart';
import '../layouts/single/intrinsic_height.dart';
import '../layouts/single/intrinsic_width.dart';
import '../layouts/single/padding.dart';
import '../layouts/single/sized_box.dart';
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

const SIZED_BOX = 'SIZED_BOX';

const ROW = 'ROW';
const COLUMN = 'COLUMN';
const LIST_VIEW = 'LIST_VIEW';
const GRID_VIEW = 'GRID_VIEW';
const TABLE = 'TABLE';
const STACK = 'STACK';
const INDEXED_STACK = 'INDEXED_STACK';

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

    case SIZED_BOX:
      return MaterialPageRoute(builder: (context) => SizedBoxDemo());
      break;

    case ROW:
      return MaterialPageRoute(builder: (context) => RowDemo());
      break;

    case INTRINSIC_HEIGHT:
      return MaterialPageRoute(builder: (context) => IntrinsicHeightDemo());
      break;

    case COLUMN:
      return MaterialPageRoute(builder: (context) => ColumnDemo());
      break;

    case INTRINSIC_WEIGHT:
      return MaterialPageRoute(builder: (context) => IntrinsicWidthDemo());
      break;

    case LIST_VIEW:
      return MaterialPageRoute(builder: (context) => ListViewDemo());
      break;

    case GRID_VIEW:
      return MaterialPageRoute(builder: (context) => GridViewDemo());
      break;

    case TABLE:
      return MaterialPageRoute(builder: (context) => TableDemo());
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
