import '../student_portal/widgets/academic_history/academic_widgets.dart';

class AcademicHistory extends StatefulWidget {
  @override
  _AcademicHistoryState createState() => _AcademicHistoryState();
}

class _AcademicHistoryState extends State<AcademicHistory> {
  Future<List<ProgramModel>> programs; 
  List<ClipRRect> periods;
  bool initialValue;
  String dropdownValue;
  int selectedId = 0;
  bool _customTileExpanded = false;

  @override
  void initState() {
    super.initState();
    initialValue = true;
    programs = getPrograms();
  }

  Future<List<ProgramModel>> getPrograms() async {
    final academicHistoryService = new AcademicHistoryService();
    final token = Provider.of<Storage>(context, listen: false).token;
    final programs = await academicHistoryService.getPrograms(token);
    return programs;
  }

  List<ClipRRect> getPeriods(List<Period> periods) {
    return periods.map((period) => ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(15),
        topRight: const Radius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(
          'Periodo academico ${period.one}-${period.three}',
          style: const TextStyle(
            fontFamily: 'HelveticaNeue',
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          '${period.periodLong} de ${period.one}',
          style: const TextStyle(
            fontFamily: 'HelveticaNeue',
            color: Colors.black54,
            fontSize: 13,
            fontWeight: FontWeight.bold
          ),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        children: const <Widget>[
          ListTile(title: Text('This is tile number 2')),
        ],
      )
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final colorTheme = Theme.of(context);
    return Center(
      child: FutureBuilder<List<ProgramModel>>(
        future: programs,
        builder: (BuildContext context, AsyncSnapshot<List<ProgramModel>> snapshot) {
          if (snapshot.hasData) {
            if (initialValue) {
              selectedId = snapshot.data[0].programId;
              dropdownValue = snapshot.data[0].program;
              periods = getPeriods(snapshot.data[0].periods);
              initialValue = false;
            }

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
                    padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 8.0),
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
                                  color: Colors.white60
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                          selectedId = snapshot.data.firstWhere((element) => element.program == newValue).programId;
                                          dropdownValue = newValue;
                                          print(selectedId);
                                        });
                                      },
                                      hint: Text('Seleccione un programa'),
                                      items: snapshot.data.map<DropdownMenuItem<String>>((ProgramModel value) {
                                        return DropdownMenuItem<String>(
                                          value: value.program,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
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
                                                  value.program,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily: 'HelveticaNeue',
                                                    color: Colors.black54,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    width: MediaQuery.of(context).size.width * 0.97,
                    decoration: BoxDecoration(
                      color: colorTheme.backgroundColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15),
                        bottomLeft: const Radius.circular(15),
                        bottomRight: const Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Center(
                        child: Column(
                          children: periods ?? [],
                        )
                      ),
                    ),
                  ),
                )
              ],
            );

          } else {
            if(snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          }
        }
      )
    );

  
    // return FutureBuilder(
    //   future: programs,
    //   builder: (BuildContext context, AsyncSnapshot<List<ProgramModel>> snapshot) {
    //     if(snapshot.hasData) {
    //       return Text('${snapshot.data[0].code}');
    //     } else {
    //       // mensaje de error cambiar
    //       if(snapshot.hasError) {
    //         return Text('${snapshot.error}');
    //       }
    //       return CircularProgressIndicator();
    //     }



    //     // return Stack(
    //     //   children: <Widget>[
    //     //     Container(
    //     //       width: MediaQuery.of(context).size.width,
    //     //       height: MediaQuery.of(context).size.height * 1,
    //     //       decoration: BoxDecoration(
    //     //         gradient: LinearGradient(
    //     //           begin: Alignment.topCenter,
    //     //           end: Alignment.bottomRight,
    //     //           colors: storage.darkMode ? [colorUtp[200], colorUtp[200]] : [colorUtp[100], colorUtp[50]]
    //     //         )
    //     //       ),
    //     //       child: selectedPrograms(colorTheme, context),
    //     //     ),
    //     //     Align(
    //     //       alignment: Alignment.bottomCenter,
    //     //       child: Container(
    //     //         height: MediaQuery.of(context).size.height * 0.72,
    //     //         width: MediaQuery.of(context).size.width * 0.97,
    //     //         decoration: BoxDecoration(
    //     //           color: colorTheme.backgroundColor,
    //     //           borderRadius: new BorderRadius.only(
    //     //             topLeft: const Radius.circular(15),
    //     //             topRight: const Radius.circular(15),
    //     //             bottomLeft: const Radius.circular(15),
    //     //             bottomRight: const Radius.circular(15),
    //     //           ),
    //     //         ),
    //     //         child: Padding(
    //     //           padding: EdgeInsets.all(3),
    //     //           child: Center(
    //     //             child: Column(
    //     //               children: periods ?? [],
    //     //               // <Widget>[
    //     //               //   ClipRRect(
    //     //               //     borderRadius: BorderRadius.only(
    //     //               //       topLeft: const Radius.circular(15),
    //     //               //       topRight: const Radius.circular(15),
    //     //               //     ),
    //     //               //     child: const ExpansionTile(
    //     //               //       title: Text('ExpansionTile 1'),
    //     //               //       subtitle: Text('Trailing expansion arrow icon'),
    //     //               //       children: <Widget>[
    //     //               //         ListTile(title: Text('This is tile number 1')),
    //     //               //       ],
    //     //               //     ),
    //     //               //   ),
    //     //               //   ClipRRect(
    //     //               //     borderRadius: BorderRadius.only(
    //     //               //       topLeft: const Radius.circular(15),
    //     //               //       topRight: const Radius.circular(15),
    //     //               //     ),
    //     //               //     child: ExpansionTile(
    //     //               //       title: const Text('ExpansionTile 2'),
    //     //               //       subtitle: const Text('Custom expansion arrow icon'),
    //     //               //       trailing: Icon(
    //     //               //         _customTileExpanded
    //     //               //             ? Icons.arrow_drop_down_circle
    //     //               //             : Icons.arrow_drop_down,
    //     //               //       ),
    //     //               //       children: const <Widget>[
    //     //               //         ListTile(title: Text('This is tile number 2')),
    //     //               //       ],
    //     //               //       onExpansionChanged: (bool expanded) {
    //     //               //         setState(() => _customTileExpanded = expanded);
    //     //               //       },
    //     //               //     ),
    //     //               //   ),
    //     //               //   const ExpansionTile(
    //     //               //     title: Text('ExpansionTile 3'),
    //     //               //     subtitle: Text('Leading expansion arrow icon'),
    //     //               //     controlAffinity: ListTileControlAffinity.leading,
    //     //               //     children: <Widget>[
    //     //               //       ListTile(title: Text('This is tile number 3')),
    //     //               //     ],
    //     //               //   ),
    //     //               // ],
    //     //             )
    //     //           ),
    //     //         ),
    //     //       ),
    //     //     )

    //     //     // Align(
    //     //     //   alignment: Alignment.bottomCenter,
    //     //     //   child: Container(
    //     //     //     height: MediaQuery.of(context).size.height * 0.72,
    //     //     //     width: MediaQuery.of(context).size.width * 0.97,
    //     //     //     child: Padding(
    //     //     //       padding: const EdgeInsets.all(5),
    //     //     //       child: SingleChildScrollView(
    //     //     //         child: _buildPanel(colorTheme),
    //     //     //       ),
    //     //     //     ),
    //     //     //   ),
    //     //     // )
    //     //   ],

    //     // );
    //   }
    // );
  }

  // Padding selectedPrograms(ThemeData colorTheme, BuildContext context) {
  //   final token = Provider.of<Storage>(context).token;
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 8.0),
  //     child: Column(
  //       children: <Widget>[
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 'Seleccione el programa',
  //                 style: TextStyle(
  //                   fontFamily: 'HelveticaNeue',
  //                   fontSize: 17,
  //                   // fontWeight: FontWeight.bold,
  //                   color: Colors.white60
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(15),
  //                   color: colorTheme.backgroundColor,
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.95,
  //                 child: FutureBuilder<List<ProgramModel>>(
  //                   future: programs,
  //                   builder: (BuildContext context, AsyncSnapshot<List<ProgramModel>> snapshot) {
  //                     if (snapshot.hasData) {
  //                       if (initialValue) {
  //                         selectedId = snapshot.data[0].programId;
  //                         dropdownValue = snapshot.data[0].program;

  //                         // final periods = getPeriods(token, selectedId.toString());
  //                         initialValue = false;
                          
  //                       }
  //                       return DropdownButtonHideUnderline(
  //                         child: ButtonTheme(
  //                           alignedDropdown: true,
  //                           child: DropdownButton<String>(
  //                             itemHeight: 50,
  //                             borderRadius: BorderRadius.circular(10),
  //                             isDense: false,
  //                             value: dropdownValue,
  //                             icon: const Icon(
  //                               Icons.unfold_more,
  //                               color: Colors.black54,
  //                             ),
  //                             iconSize: 27,
  //                             elevation: 16,
  //                             isExpanded: true,
  //                             style: const TextStyle(
  //                               fontFamily: 'HelveticaNeue',
  //                               color: Colors.black54,
  //                               fontSize: 15,
  //                             ),
  //                             onChanged: (String newValue) {
  //                               setState(() {
  //                                 selectedId = snapshot.data.firstWhere((element) => element.program == newValue).programId;
  //                                 dropdownValue = newValue;
  //                                 print(selectedId);
  //                               });
  //                             },
  //                             hint: Text('Seleccione un programa'),
  //                             items: snapshot.data.map<DropdownMenuItem<String>>((ProgramModel value) {
  //                               return DropdownMenuItem<String>(
  //                                 value: value.program,
  //                                 child: FittedBox(
  //                                   fit: BoxFit.contain,
  //                                   child: Row(
  //                                     children: <Widget>[
  //                                       Padding(
  //                                         padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
  //                                         child: Icon(
  //                                           Icons.feed_rounded,
  //                                           color: Colors.black54,
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         value.program,
  //                                         overflow: TextOverflow.ellipsis,
  //                                         style: TextStyle(
  //                                           fontFamily: 'HelveticaNeue',
  //                                           color: Colors.black54,
  //                                           fontSize: 15,
  //                                           fontWeight: FontWeight.bold
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               );
  //                             }).toList(),
  //                           ),
  //                         ),
  //                       );
  //                     } else {
  //                       // mensaje de error cambiar
  //                       if(snapshot.hasError) {
  //                         return Text('${snapshot.error}');
  //                       }
  //                       return CircularProgressIndicator();
  //                     }
  //                   }
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     )
  //   );
  // }

  // Widget _buildPanel(ThemeData colorTheme) {
  //   return ExpansionPanelList(
  //     elevation: 4,
  //     dividerColor: colorTheme.colorScheme.primary,
  //     expansionCallback: (int index, bool isExpanded) {
  //       setState(() {
  //         _data[index].isExpanded = !isExpanded;
  //       });
  //     },
  //     children: _data.map<ExpansionPanel>((Item item) {
  //       return ExpansionPanel(
  //         headerBuilder: (BuildContext context, bool isExpanded) {
  //           return ListTile(
  //             title: Text(item.headerValue),
  //           );
  //         },
  //         body: ListTile(
  //             title: Text(item.expandedValue),
  //             subtitle:
  //                 const Text('To delete this panel, tap the trash can icon'),
  //             trailing: const Icon(Icons.delete),
  //             onTap: () {
  //               setState(() {
  //                 _data.removeWhere((Item currentItem) => item == currentItem);
  //               });
  //             }),
  //         isExpanded: item.isExpanded,
  //       );
  //     }).toList(),
  //   );
  // }

}