import '../widgets/mobile_portal/mobile_widgets.dart';

class MobilePortal extends StatefulWidget {
  @override
  _MobilePortalState createState() => _MobilePortalState();
}

class _MobilePortalState extends State<MobilePortal> {
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