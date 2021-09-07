import 'package:flutter/material.dart';
import 'package:utp_app/src/widgets/home/home_widgets.dart';


class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.storage,
  }) : super(key: key);

  final Storage storage;

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: storage.darkMode ? [colorUtp[200], colorUtp[200]] : [colorUtp[100], colorUtp[50]]
        )
      ),
      accountName: Text(
        'Universidad Tecnológica de Pereira',
        style: TextStyle(fontSize: 15),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/escudoUtpFondo9.png'),
        radius: 90.0,
        backgroundColor: Colors.white,
      ),
      accountEmail: Text('Un Mundo de Inagotables Experiencias'),
      otherAccountsPictures: <Widget>[
        IconButton(
          icon: storage.darkMode ? 
            Icon(Icons.wb_sunny_rounded, color: Colors.white) : 
            Icon(Icons.nights_stay_rounded, color: Colors.white), 
          onPressed: () {
             storage.toggleChangeTheme();
          }
        )
      ],
    );
  }
}