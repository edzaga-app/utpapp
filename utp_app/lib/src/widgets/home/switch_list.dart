import 'package:utp_app/src/widgets/home/home_widgets.dart';

class SwitchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<Storage>(context);
    return Column(
      children: <Widget> [
        SwitchListTile(
          activeColor: colorUtp[50],
          title: Text('Modo Oscuro'),
          value: changeTheme.darkMode, 
          onChanged: (val) {
            changeTheme.toggleChangeTheme();
          }
        )
      ]
    );
  }
}