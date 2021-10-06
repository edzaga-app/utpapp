import 'package:provider/provider.dart';
import 'package:utp_app/src/helpers/storage.dart';
import 'package:utp_app/src/helpers/theme_utp.dart';

import '../student_portal/widgets/partial_notes/partial_widgets.dart';

class PartialNotes extends StatefulWidget {
  @override
  _PartialNotesState createState() => _PartialNotesState();
}

class _PartialNotesState extends State<PartialNotes> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    final storage = Provider.of<Storage>(context);
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
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Stepper(
                  
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 0) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      title: const Text('Auditoría de Sistemas: 4.3'),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('Content for Step 1')),
                    ),
                    const Step(
                      title: Text('Step 2 title'),
                      content: Text('Content for Step 2'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],

    );
  }
}

