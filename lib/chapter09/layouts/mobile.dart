import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'reusable_widgets.dart';

Widget alertDialog(BuildContext context, String title, String content) {
  if (Platform.isIOS || Platform.isMacOS)
    return cupertinoAlertDialog(context, title, content);
  if (Platform.isAndroid ||
      Platform.isFuchsia ||
      Platform.isLinux ||
      Platform.isWindows) return materialAlertDialog(context, title, content);

  return materialAlertDialog(context, title, content);
}
