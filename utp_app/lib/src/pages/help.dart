import '../widgets/help/help_widgets.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Ayuda'),
      ),
    );
  }
}