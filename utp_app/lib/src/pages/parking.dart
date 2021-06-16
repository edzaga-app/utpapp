import '../widgets/parking/parking_widgets.dart';

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Container(
         child: Text('Parqueadero'),
       ),
    );
  }
}