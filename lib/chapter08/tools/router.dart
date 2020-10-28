import 'package:flutter/material.dart';
import 'package:pragmatic_flutter/chapter08/widgets/alert_dialog.dart';
import 'package:pragmatic_flutter/chapter08/widgets/futurebuilder_widget.dart';
import 'package:pragmatic_flutter/chapter08/widgets/image_widget.dart';
import 'package:pragmatic_flutter/chapter08/widgets/placeholder_widget.dart';
import 'package:pragmatic_flutter/chapter08/widgets/streambuilder_widget.dart';
import 'package:pragmatic_flutter/chapter08/widgets/textfield.dart';
import 'package:pragmatic_flutter/chapter08/widgets/togglebuttons_widget.dart';

import 'codefile.dart';
import 'home.dart';
import 'screen_args.dart';
import 'unknown.dart';

const String HOME = '/';
const SHOW_CODE_FILE = 'SHOW_CODE_FILE';
const IMAGE = 'IMAGE';
const TOGGLE_BUTTONS = 'TOGGLE_BUTTONS';
const TEXT_FIELD = 'TEXT_FIELD';
const FUTURE_BUILDER = 'FUTURE_BUILDER';
const PLACEHOLDER = 'PLACEHOLDER';
const STREAM_BUILDER = 'STREAM_BUILDER';
const ALERT_DIALOG = 'ALERT_DIALOG';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case IMAGE:
      return MaterialPageRoute(builder: (context) => ImageWidgetDemo());
      break;

    case TOGGLE_BUTTONS:
      return MaterialPageRoute(builder: (context) => ToggleButtonsDemo());
      break;

    case TEXT_FIELD:
      return MaterialPageRoute(builder: (context) => TextFieldDemo());
      break;

    case FUTURE_BUILDER:
      return MaterialPageRoute(builder: (context) => FutureBuilderDemo());
      break;

    case PLACEHOLDER:
      return MaterialPageRoute(builder: (context) => PlaceholderDemo());
      break;

    case STREAM_BUILDER:
      return MaterialPageRoute(builder: (context) => StreamBuilderDemo());
      break;

    case ALERT_DIALOG:
      return MaterialPageRoute(builder: (context) => AlertDialogDemo());
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
