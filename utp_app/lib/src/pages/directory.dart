import '../widgets/directory/directory_widgets.dart';

class Directory extends StatefulWidget {
  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        alignment: Alignment(0, 0),
        child: Text("Portal Móvil",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.green,
      ),
    );
  }
}