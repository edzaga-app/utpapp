import '../widgets/suggestions/suggestions_widgets.dart';

class Suggestions extends StatefulWidget {
  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: Text('sugerencias'),
      ),
    );
  }
}