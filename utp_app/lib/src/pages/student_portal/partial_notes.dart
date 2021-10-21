import 'package:utp_app/src/pages/student_portal/widgets/partial_notes/detail_courses.dart';

import '../student_portal/widgets/partial_notes/partial_widgets.dart';

class PartialNotes extends StatefulWidget {
  @override
  _PartialNotesState createState() => _PartialNotesState();
}

class _PartialNotesState extends State<PartialNotes> {
  List<CourseModel> courses;
  List<Step> steps;
  Future<List<Step>> futureSteps;
  int _index = 0;
  int _sizeCourses = 0;
  
  @override
  void initState() {
    super.initState();
    futureSteps = getSteps();
  }

  Future<List<CourseModel>> getCourses() async {
    final courseService = new CourseService();
    final token = Provider.of<Storage>(context, listen: false).token;
    final courses = await courseService.getCourses(token);
    return courses;
  }

  Future<List<Step>> getSteps() async {
    List<Step> _steps = [];
    final courses = await getCourses();
    _sizeCourses = courses.length;
    Future.forEach(courses, (item) => {
      _steps.add(Step(
        title: Text(
          "${item.course} : ${item.grade.toStringAsFixed(1)}",
          style: TextStyle(
            fontFamily: 'HelveticaNeue',
            color: Colors.black54,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          child: DetailCourses(detailGrades: item.detailGrades)
        ),
        isActive: _index >= 0,
      ))
    });
    return _steps;
  }

  


  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    final storage = Provider.of<Storage>(context);

    final futureBuilderSteps = new FutureBuilder<List<Step>>(
      future: futureSteps,
      builder: (BuildContext context, AsyncSnapshot<List<Step>> snapshot) {
        if (snapshot.hasData) {
          steps = snapshot.data;
          return Stepper(
            physics: ClampingScrollPhysics(),
            currentStep: _index,
            onStepTapped: (step) => taped(step),
            onStepContinue: continued,
            onStepCancel: cancel,
            steps: steps
          );
          // return ListCourses(steps: steps);
        } else {
          // mensaje de error cambiar
          if(snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();

        } 
      }
    );

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: storage.darkMode ? [colorUtp[200], colorUtp[200]] : [colorUtp[100], colorUtp[50]]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 30, 8.0, 8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Consulta tus Notas',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Presiona cada asignatura para ver la descoposición completa de la nota',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 13,
                          color: Colors.white60
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.73,
            width: MediaQuery.of(context).size.width * 0.97,
            decoration: BoxDecoration(
              color: colorTheme.backgroundColor,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30),
                bottomLeft: const Radius.circular(30),
                bottomRight: const Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Center(
                child: futureBuilderSteps
              ),
            ),
          ),
        )
      ],

    );
  }

  cancel() {
    if (_index > 0) {
      setState(() => _index -= 1);
    }
  }

  continued() {
    if(_index < _sizeCourses -1) {
      setState(() => _index += 1);
    }
  }

  taped(int step) {
    setState(() => _index = step);
  }

}

