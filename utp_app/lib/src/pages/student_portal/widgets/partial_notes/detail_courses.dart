import '../partial_notes/partial_widgets.dart';

class DetailCourses extends StatefulWidget {
  final List<DetailGrade> detailGrades;

  DetailCourses({@required this.detailGrades});

  @override
  _DetailCoursesState createState() => _DetailCoursesState();
}

class _DetailCoursesState extends State<DetailCourses> {
  List<DataRow> detail;

  @override
  void initState() {
    super.initState();
    detail = getDetails();
  }

  List<DataRow> getDetails() {
    List<DataRow> dataRow = [];    
    [...widget.detailGrades].forEach((item) {
      
      dataRow.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
      );
    });
    return dataRow;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        columns: <DataColumn>[
          dataColumn('Actividad'),
          dataColumn('%'),
          dataColumn('Nota')
        ],
        rows: detail
        // const <DataRow>[
        //   DataRow(
        //     cells: <DataCell>[
        //       DataCell(Text('Sarah')),
        //       DataCell(Text('19')),
        //       DataCell(Text('Student')),
        //     ],
        //   ),
        //   DataRow(
        //     cells: <DataCell>[
        //       DataCell(Text('Janine')),
        //       DataCell(Text('43')),
        //       DataCell(Text('Professor')),
        //     ],
        //   ),
        //   DataRow(
        //     cells: <DataCell>[
        //       DataCell(Text('William')),
        //       DataCell(Text('27')),
        //       DataCell(Text('Associate Professor')),
        //     ],
        //   ),
        // ],
      ),
    );
  }

  DataColumn dataColumn(String nameColumn) {
    return DataColumn(
      label: Text(
        nameColumn,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontFamily: 'HelveticaNeue',
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
