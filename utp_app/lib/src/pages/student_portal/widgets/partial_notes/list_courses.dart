import '../partial_notes/partial_widgets.dart';

class ListCourses extends StatefulWidget {
  final List<Step> steps;

  ListCourses({@required this.steps});

  @override
  State<ListCourses> createState() => _ListCoursesState();
}

class _ListCoursesState extends State<ListCourses> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Text('');

    // Stepper(
    //     physics: ClampingScrollPhysics(),
    //     currentStep: _index,
    //     onStepTapped: (step) => taped(step),
    //     onStepContinue: continued,
    //     onStepCancel: cancel,
    //     controlsBuilder: (BuildContext context,
    //         {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
    //       return Row(
    //         mainAxisSize: MainAxisSize.max,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: <Widget>[
    //           ElevatedButton(
    //             onPressed: onStepCancel,
    //             child: const Text('Back!'),
    //           ),
    //           ElevatedButton(
    //             onPressed: onStepContinue,
    //             child: const Text('Next!'),
    //           ),
    //         ],
    //       );
    //       //   return Row(
    //       //   mainAxisSize: MainAxisSize.max,
    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //   children: <Widget>[
    //       //     TextButton(
    //       //       onPressed: onStepCancel,
    //       //       child: const Text('Siguiente!'),
    //       //     ),
    //       //     ElevatedButton(
    //       //       onPressed: onStepContinue,
    //       //       child: const Text('Atras!'),
    //       //     ),
    //       //   ],
    //       // );
    //       // return Row(
    //       //   children: <Widget>[
    //       //     Container(
    //       //       child: null,
    //       //     ),
    //       //     Container(
    //       //       child: null,
    //       //     )
    //       //   ],
    //       // );
    //     },
    //     steps: widget.steps);
  }

  cancel() {
    if (_index > 0) {
      setState(() => _index -= 1);
    }
  }

  continued() {
    if (_index < 2) {
      setState(() => _index += 1);
    }
  }

  taped(int step) {
    setState(() => _index = step);
  }
}
