import '../widgets/campus/campus_widgets.dart';

class Campus extends StatefulWidget {
  @override
  _CampusState createState() => _CampusState();
}

class _CampusState extends State<Campus> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Campus'),
      ),
    );
  }
}