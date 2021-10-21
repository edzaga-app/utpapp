import '../partial_notes/partial_widgets.dart';

class DetailCourses extends StatefulWidget {
  final int index;
  
  DetailCourses({
    @required this.index
  });

  @override
  _DetailCoursesState createState() => _DetailCoursesState();
}

class _DetailCoursesState extends State<DetailCourses> {
  int initial;

  @override
  void initState() {
    super.initState();
    initial = widget.index;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$initial'),
    );
  }
}