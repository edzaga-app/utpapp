import 'package:flutter/material.dart';

Map<int, Color> colorUtp = {
  50:Color.fromRGBO(32, 129, 191, 1), // Color de los controles
  100:Color.fromRGBO(20, 62, 105, 1), // PrimaryColor (Light)
  200:Color.fromRGBO(34, 34, 34, 1) // PrimaryColor (Dark)
};

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: colorUtp[200],
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF212121),
  fontFamily: 'HelveticaNeue',
  accentColor: colorUtp[50],
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: colorUtp[100],
  brightness: Brightness.light,
  backgroundColor: Color(0xFFE5E5E5),
  fontFamily: 'HelveticaNeue',
  accentColor: colorUtp[50],
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54
);


