import 'package:utp_app/src/providers/navigation.dart';
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

    AnimationController _controller;

    @override
    void initState() { 
      super.initState();
      _controller = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this
      );
    }

    void _runAnimation() async {
      for (var i = 0; i < 3; i++) {
        await _controller.forward();
        await _controller.reverse();
      }
    }

    @override
    void dispose() { 
      _controller.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Utp Móvil'),
      ),
      body: Consumer<Navigation>(
        builder: (context, navigationProvider, _) => navigationProvider.getNavigation
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
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
            ),
            Expanded(
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
                          navigation.updateNavigation(rutes[index]);
                        },
                      ),
                    );
                  },

                ),
              ),
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


