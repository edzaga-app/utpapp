// To parse this JSON data, do
import 'dart:convert';

List<PeriodModel> periodModelFromJson(String str) => List<PeriodModel>.from(json.decode(str).map((x) => PeriodModel.fromJson(x)));

String periodModelToJson(List<PeriodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PeriodModel {
    PeriodModel({
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

    factory PeriodModel.fromJson(Map<String, dynamic> json) => PeriodModel(
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
