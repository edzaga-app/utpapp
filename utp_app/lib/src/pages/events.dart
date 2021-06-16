import '../widgets/events/events_widgets.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('Eventos'),
      ),
    );
  }
}