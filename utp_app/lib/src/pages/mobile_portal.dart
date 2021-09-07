import 'package:utp_app/src/widgets/mobile_portal/user_card.dart';

import '../widgets/mobile_portal/mobile_widgets.dart';

class MobilePortal extends StatefulWidget {
  @override
  _MobilePortalState createState() => _MobilePortalState();
}

class _MobilePortalState extends State<MobilePortal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            UserCard(
              isStudent: true,
              title: 'Estudiante Utp',
              subtitle: 'Presione para generar su llave móvil',
            ),
            UserCard(
              isStudent: false,
              title: 'Docente Utp',
              subtitle: 'Presione para generar su llave móvil',
            ),
          ],        
        )
      )
    );
  }
}