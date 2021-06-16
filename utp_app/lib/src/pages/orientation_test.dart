import '../widgets/orientation_test/orientation_widgets.dart';

class OrientationTest extends StatefulWidget {
  @override
  _OrientationTestState createState() => _OrientationTestState();
}

class _OrientationTestState extends State<OrientationTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Prueba de orientación'),
      ),
    );
  }
}