import 'package:flutter/material.dart';

class AppBarParams extends StatelessWidget with PreferredSizeWidget {
  final String name;

  const AppBarParams({
    @required this.name
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(name),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}