import '../widgets/radio_station/radio_widgets.dart';

class RadioStation extends StatefulWidget {
  @override
  _RadioStationState createState() => _RadioStationState();
}

class _RadioStationState extends State<RadioStation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Emisora'),
      ),
    );
  }
}