import 'package:flutter/material.dart';

/// Chapter11: Persisting Data
///
enum AppThemes { light, dark }
//Themes definitions
ThemeData get defaultTheme => ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.lightBlueAccent,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
    );

ThemeData get pinkTheme => ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      primaryColor: Colors.pink,
      accentColor: Colors.pinkAccent,
    );

ThemeData get darkTheme => ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      accentColor: Colors.yellowAccent,
    );
