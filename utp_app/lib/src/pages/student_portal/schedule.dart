import '../student_portal/widgets/schedule/schedule_widgets.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Future<ScheduleModel> schedules;
  
  @override
  void initState() {
    super.initState();
    schedules = getSchedules();
  } 

  Future<ScheduleModel> getSchedules() async {
    final scheduleService = new ScheduleService();
    final token = Provider.of<Storage>(context, listen: false).token;
    final schedules = await scheduleService.getSchedule(token);
    return schedules;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    
    return FutureBuilder<ScheduleModel>(
      future: schedules,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<FlutterWeekViewEvent> _events = [];
          
          snapshot.data.schedule?.forEach((schedule) {
            DateTime dateWeekNoUtc = schedule.dateWeek.subtract(Duration(hours: 5));
            _events.add(FlutterWeekViewEvent(
              title: schedule.subjec,
              textStyle: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white70
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [ Color(0XFF1976D2), Color(0XFF2196F3) ]
                ),
                border: Border.all(
                  color: Colors.white60,
                  width: 1
                ),
                color: colorTheme.colorScheme.secondary,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(6),
                  topRight: const Radius.circular(6),
                  bottomLeft: const Radius.circular(6),
                  bottomRight: const Radius.circular(6),
                ),
              ),
              description: 'Codigo: ${schedule.code} Grupo: ${schedule.groupNumber}',
              start: dateWeekNoUtc.add(Duration(hours: int.parse(schedule.startTime.split(':')[0]))),
              end: dateWeekNoUtc.add(Duration(hours: int.parse(schedule.endTime.split(':')[0])))
            ));
          });

          return WeekView(
            dates: snapshot.data.dates,
            events: _events,
          );

        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    
  }
}