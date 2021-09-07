import 'package:flutter/material.dart';
import 'package:utp_app/src/providers/navigation.dart';
import 'package:utp_app/src/widgets/theme/theme_widgets.dart';

class ListModules extends StatelessWidget {
  const ListModules({
    Key key,
    @required this.storage,
    @required this.titles,
    @required this.icons,
    @required this.navigation,
    @required this.rutes,
  }) : super(key: key);

  final Storage storage;
  final List<String> titles;
  final List<IconData> icons;
  final Navigation navigation;
  final List<String> rutes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomRight,
            colors: storage.darkMode ? [colorUtp[200], colorUtp[200]] : [ Colors.grey[200] , Colors.grey[300] ]
          )
        ),
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  titles[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(icons[index]),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  navigation.updateNavigation(rutes[index], index);
                },
              ),
            );
          },

        ),
      ),
    );
  }
}