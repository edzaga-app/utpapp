import 'dart:convert';

List<ProgramModel> programModelFromJson(String str) => List<ProgramModel>.from(json.decode(str).map((x) => ProgramModel.fromJson(x)));

String programModelToJson(List<ProgramModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramModel {
    ProgramModel({
        this.programId,
        this.code,
        this.program,
        this.periods,
    });

    int programId;
    String code;
    String program;
    List<Period> periods;

    factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        programId: json["programId"],
        code: json["code"],
        program: json["program"],
        periods: List<Period>.from(json["periods"].map((x) => Period.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "programId": programId,
        "code": code,
        "program": program,
        "periods": List<dynamic>.from(periods.map((x) => x.toJson())),
    };
}

class Period {
    Period({
        this.academicPeriodId,
        this.code,
        this.period,
        this.one,
        this.three,
        this.periodLong,
    });

    int academicPeriodId;
    String code;
    String period;
    String one;
    String three;
    String periodLong;

    factory Period.fromJson(Map<String, dynamic> json) => Period(
        academicPeriodId: json["academicPeriodId"],
        code: json["code"],
        period: json["period"],
        one: json["one"],
        three: json["three"],
        periodLong: json["periodLong"],
    );

    Map<String, dynamic> toJson() => {
        "academicPeriodId": academicPeriodId,
        "code": code,
        "period": period,
        "one": one,
        "three": three,
        "periodLong": periodLong,
    };
}
