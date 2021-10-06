import '../student_portal/widgets/student_home/student_widgets.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  Future<UserInformationModel> futureInformation;
  Future<List<NavigationStudentModel>> futureMenus;
  List<NavigationStudentModel> menus;
  String nameNavigation;

  Map<String, dynamic> stundent = {
    'name': '',
    'program': '',
    'email': '',
    'photo': null,
    'type': ''
  };

  @override
  void initState() {
    futureInformation = userInformation();
    futureMenus = studentMenus();
    super.initState();
  }

  Future<UserInformationModel> userInformation() async {
    final userInformation = new StudentPortalService();
    final token = Provider.of<Storage>(context, listen: false).token;
    return await userInformation.getUserInformation(token);
  }

  Future<List<NavigationStudentModel>> studentMenus() async {
    final storage = Provider.of<Storage>(context, listen: false);
    final menus = new NavigationStudentProvider(storage: storage);
    return await menus.getStudentMenus();
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final futureBuilder = new FutureBuilder<UserInformationModel>(
      future: futureInformation,
      builder: (BuildContext context, AsyncSnapshot<UserInformationModel> snapshot) {
        if(snapshot.hasData) {
          stundent['name'] = snapshot.data.name;
          stundent['program'] = snapshot.data.program;
          stundent['email'] = snapshot.data.email;
          if (snapshot.data.photo != null) {
            List<int> bytePhoto = new List<int>.from(snapshot.data.photo['data']);
            Uint8List bytes = Uint8List.fromList(bytePhoto);
            stundent['photo'] = bytes;
          }

          return Text('${snapshot.data.name}');

        } else if (snapshot.hasError) {
          // mensaje de error cambiar
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );

    final futureBuilderMenus = new FutureBuilder<List<NavigationStudentModel>>(
      future: futureMenus,
      builder: (BuildContext context, AsyncSnapshot<List<NavigationStudentModel>> snapshot) {
        if (snapshot.hasData) {
          menus = snapshot.data;
          return ListModulesStudent(menus: menus);

        } else {
          // mensaje de error cambiar
          return Text('${snapshot.error}');
        }
      }
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationStudentProvider>(create: (_) => NavigationStudentProvider(storage: storage)),
      ],
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBarStudent(),
          body: Consumer<NavigationStudentProvider>(
            builder: (context, navigationProvider, _) { 
              if(navigationProvider.currentNavigation != 'studentHome'){
                return navigationProvider.getNavigation;
              }
              return Center(child: futureBuilder);
            }
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Header(student: stundent),
                Expanded(
                  child: futureBuilderMenus
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  


}