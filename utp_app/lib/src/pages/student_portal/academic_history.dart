import 'package:flutter/material.dart';
import '../student_portal/widgets/academic_history/academic_widgets.dart';

class AcademicHistory extends StatefulWidget {
  @override
  _AcademicHistoryState createState() => _AcademicHistoryState();
}

class _AcademicHistoryState extends State<AcademicHistory> {
  Future<List<ProgramModel>> programs; 

  String dropdownValue = 'One';

  @override
  @override
  void initState() {
    super.initState();
    programs = getPrograms();
  }

  Future<List<ProgramModel>> getPrograms() async {
    final academicHistoryService = new AcademicHistoryService();
    final token = Provider.of<Storage>(context, listen: false).token;
    final programs = await academicHistoryService.getPrograms(token);
    return programs;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    final storage = Provider.of<Storage>(context);

    // final futureBuilderPrograms = FutureBuilder<List<ProgramModel>>(
    //   future: programs,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final programs = snapshot.data;
    //       programs.map((e) => 
    //          DropdownMenuItem<String>(
    //           value: value,
    //           child: Row(
    //             children: <Widget>[
    //               Padding(
    //                 padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
    //                 child: Icon(
    //                   Icons.feed_rounded,
    //                   color: Colors.black54,
    //                 ),
    //               ),
    //               Text(
    //                 value,
    //                 style: TextStyle(
    //                   fontFamily: 'HelveticaNeue',
    //                   color: Colors.black54,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold
    //                 ),
    //               ),
    //             ],
    //           ),
    //           // Text(value),
    //         );
    //       );


    //       return snapshot.data.map<DropdownMenuItem<String>>((String value) {
            
    //       })
    //       .toList()


    //     } else if (snapshot.hasError) {
    //       return Text("${snapshot.error}");
    //     }
    //     return CircularProgressIndicator();
    //   },
    // );

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
            padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Seleccione el programa',
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 17,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white60
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colorTheme.backgroundColor,
                        ),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              itemHeight: 50,
                              borderRadius: BorderRadius.circular(10),
                              isDense: false,
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.unfold_more,
                                color: Colors.black54,
                              ),
                              iconSize: 27,
                              elevation: 16,
                              isExpanded: true,
                              style: const TextStyle(
                                fontFamily: 'HelveticaNeue',
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: 

                              // programs.then((programs) {
                              //   return programs.map<DropdownMenuItem<String>>((ProgramModel program) {
                              //     return DropdownMenuItem<String>(
                              //       value: program.id.toString(),
                              //       child: Text(
                              //         program.name,
                              //         style: TextStyle(
                              //           fontFamily: 'HelveticaNeue',
                              //           color: Colors.black54,
                              //           fontSize: 15,
                              //         ),
                              //       ),
                              //     );
                              //   }).toList();
                              // }).whenComplete(() {
                              //   return Center(
                              //     child: CircularProgressIndicator(
                              //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              //     ),
                              //   );
                              // }),
                              <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                          child: Icon(
                                            Icons.feed_rounded,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          value,
                                          style: TextStyle(
                                            fontFamily: 'HelveticaNeue',
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Text(value),
                                  );
                                })
                                .toList(),
                            ),
                          ),
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
                child: Text('data')
              ),
            ),
          ),
        )
      ],

    );
  }
}