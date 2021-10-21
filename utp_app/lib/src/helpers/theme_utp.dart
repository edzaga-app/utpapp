import 'package:flutter/material.dart';

Map<int, Color> colorUtp = {
  50:Color.fromRGBO(32, 129, 191, 1), // Color de los controles
  100:Color.fromRGBO(20, 62, 105, 1), // PrimaryColor (Light)
  200:Color.fromRGBO(34, 34, 34, 1) // PrimaryColor (Dark)
};

final darkTheme = ThemeData(
  primaryColor: colorUtp[200],
  colorScheme: ColorScheme.dark(
    primary: Colors.black12, //colorUtp[200],
    secondary: colorUtp[50],
    onPrimary: Colors.white70,
  ),
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF212121),
  fontFamily: 'HelveticaNeue',
  primaryIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primaryColor: colorUtp[100],
  colorScheme: ColorScheme.light(
    primary: colorUtp[100],
    secondary: colorUtp[50],
    onPrimary: Colors.white70,
  ),
  brightness: Brightness.light,
  backgroundColor: Color(0xFFE5E5E5),
  fontFamily: 'HelveticaNeue',
  primaryIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  
);


