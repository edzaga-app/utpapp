import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utp_app/src/helpers/storage.dart';
import 'package:utp_app/src/providers/navigation.dart';
import 'package:utp_app/src/widgets/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Storage>(create: (_) => Storage()),
        ChangeNotifierProvider<Navigation>(create: (_) => Navigation())
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

