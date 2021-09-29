import 'package:utp_app/src/pages/student_portal/models/navigation_student.model.dart';

import '../../student_theme/student_theme_widgets.dart';

class ListModulesStudent extends StatelessWidget {
  final List<NavigationStudentModel> menus;

  ListModulesStudent({
    @required this.menus
  });

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    List<String> names = [...menus].map((item) => item.name).toList();
    final icons = [...menus].map((item) => item.icon).toList();


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: storage.darkMode ? [colorUtp[200], colorUtp[200]] : [ Colors.grey[200] , Colors.grey[300] ]
        )
      ),
      child: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                names[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(IconData( int.parse(icons[index]), fontFamily: 'MaterialIcons')),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                // navigation.updateNavigation(rutes[index], index);
              },
            ),
          );
        },
      ),
    );
  }
}