import 'dart:convert';

List<ProgramModel> programModelFromJson(String str) => List<ProgramModel>.from(json.decode(str).map((x) => ProgramModel.fromJson(x)));

String programModelToJson(List<ProgramModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramModel {
  ProgramModel({
      this.programId,
      this.code,
      this.program,
  });

  int programId;
  String code;
  String program;

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
      programId: json["programId"],
      code: json["code"],
      program: json["program"],
  );

  Map<String, dynamic> toJson() => {
      "programId": programId,
      "code": code,
      "program": program,
  };
}
