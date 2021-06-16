import '../widgets/share/share_widgets.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Compartir'),
      ),
    );
  }
}