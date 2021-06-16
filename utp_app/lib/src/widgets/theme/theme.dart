import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utp_app/src/helpers/storage.dart';
import 'package:utp_app/src/helpers/theme_utp.dart';
import 'package:utp_app/src/pages/home.dart';

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Utp Móvil',
      theme: storage.darkMode ? darkTheme : lightTheme, 
      home: Homepage()
    );
  }
}