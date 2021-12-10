import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
    ScheduleModel({
        this.schedule,
        this.dates,
    });

    List<Schedule> schedule;
    List<DateTime> dates;

    factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
        dates: List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
        "dates": List<dynamic>.from(dates.map((x) => x.toIso8601String())),
    };
}

class Schedule {
    Schedule({
        this.registrationId,
        this.startTime,
        this.endTime,
        this.groupNumber,
        this.startMinute,
        this.endMinute,
        this.status,
        this.days,
        this.dateWeek,
        this.courseId,
        this.groupId,
        this.code,
        this.subjec,
    });

    int registrationId;
    String startTime;
    String endTime;
    String groupNumber;
    String startMinute;
    String endMinute;
    int status;
    String days;
    DateTime dateWeek;
    int courseId;
    int groupId;
    String code;
    String subjec;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        registrationId: json["registrationId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        groupNumber: json["groupNumber"],
        startMinute: json["startMinute"],
        endMinute: json["endMinute"],
        status: json["status"],
        days: json["days"],
        dateWeek: DateTime.parse(json["dateWeek"]),
        courseId: json["courseId"],
        groupId: json["groupId"],
        code: json["code"],
        subjec: json["subjec"],
    );

    Map<String, dynamic> toJson() => {
        "registrationId": registrationId,
        "startTime": startTime,
        "endTime": endTime,
        "groupNumber": groupNumber,
        "startMinute": startMinute,
        "endMinute": endMinute,
        "status": status,
        "days": days,
        "dateWeek": dateWeek.toIso8601String(),
        "courseId": courseId,
        "groupId": groupId,
        "code": code,
        "subjec": subjec,
    };
}
