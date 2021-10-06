import '../student_theme/student_theme_widgets.dart';

class AppBarStudent extends StatelessWidget with PreferredSizeWidget {
  // final String name;

  // const AppBarStudent({
  //   @required this.name
  // });

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
  
    return Consumer<NavigationStudentProvider>(
      builder: (context, navigationProvider, _) { 
        return AppBar(
          title: Text(navigationProvider.nameNavigation),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                storage.deleteToken();
                Navigator.of(context).pop();
              }, 
              icon: Icon(
                Icons.logout_rounded
              )
            ),
          ],
        );
      }
    );

    
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}