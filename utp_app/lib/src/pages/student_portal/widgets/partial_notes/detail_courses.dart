import '../partial_notes/partial_widgets.dart';

class DetailCourses extends StatefulWidget {
  final List<DetailGrade> detailGrades;
  final String groupNumber;
  final String courseCode;

  DetailCourses({
    @required this.detailGrades,
    @required this.groupNumber,
    @required this.courseCode,
  });

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

  int spacesCount(String nameString) {
    if (nameString.length == 0) return 0;
    int cont = 0;
    for (var i = 0; i < nameString.length - 1; i++) {
      if (nameString[i] != " ") break;
      if (nameString[i] == " ") {
        cont++;
      }
    }
    return cont;
  }

  int getLevel(String path) {
    int cont = 0;
    if (path.length == 0) return 0;
    List<String> pathList = path.split("/");
    cont = pathList.length - 1;
    return cont;
  }

  List<DataRow> getDetails() {
    List<DataRow> dataRow = [];    
    [...widget.detailGrades].forEach((item) {
 
      double grade = item.grade ?? 0.0;
      double percentage = item.percentage ?? 0.0;

      dataRow.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text('${item.activity }')),
            DataCell(Text('${grade.toStringAsFixed(1)}')),
            DataCell(Text('${percentage.toStringAsFixed(1)}')),
          ],
        ),
      );
    });
    return dataRow;
  }


  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "CODIGO: ${widget.courseCode} GRUPO: ${widget.groupNumber}\n",
                style: TextStyle(
                  fontFamily: 'HelveticaNeue',
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) => colorTheme.primaryColor),  
                    columns: <DataColumn>[
                      dataColumn('Actividad', 0.4),
                      dataColumn('Nota', 0.1),
                      dataColumn('%', 0.1)
                    ],
                    rows: detail
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DataColumn dataColumn(String nameColumn, double sizeColumn) {
    return DataColumn(
      label: Container(
        width: MediaQuery.of(context).size.width * sizeColumn,
        child: Text(
          nameColumn,
          softWrap: false,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontFamily: 'HelveticaNeue',
            color: Colors.white60,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
