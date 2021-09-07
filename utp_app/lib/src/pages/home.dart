import 'package:utp_app/src/providers/navigation.dart';
import 'package:utp_app/src/widgets/theme/drawer/header.dart';
import 'package:utp_app/src/widgets/theme/drawer/list_modules.dart';
import '../widgets/home/home_widgets.dart';
import '../models/nav/nav_menu_item.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    final titles = menuTitles;
    final icons = menuIcons; 
    final rutes = menuNavigations;
    final navigation = Provider.of<Navigation>(context);
    final storage = Provider.of<Storage>(context);
    
    return Scaffold(
      appBar: AppBarParams(name: navigation.nameNavigation),
      body: Consumer<Navigation>(
        builder: (context, navigationProvider, _) => navigationProvider.getNavigation
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Header(storage: storage),
            ListModules(
              storage: storage, 
              titles: titles, 
              icons: icons, 
              navigation: navigation, 
              rutes: rutes
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}








