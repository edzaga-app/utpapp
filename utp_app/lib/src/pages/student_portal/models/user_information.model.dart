import 'dart:convert';

UserInformationModel userInformationModelFromJson(String str) => UserInformationModel.fromJson(json.decode(str));

String userInformationModelToJson(UserInformationModel data) => json.encode(data.toJson());

class UserInformationModel {
    UserInformationModel({
        this.thirdId,
        this.code,
        this.name,
        this.program,
        this.email,
        this.photo,
        this.type
    });

    String thirdId;
    String code;
    String name;
    dynamic program;
    String email;
    dynamic photo;
    String type;

    factory UserInformationModel.fromJson(Map<String, dynamic> json) => UserInformationModel(
        thirdId: json["thirdId"],
        code: json["code"],
        name: json["name"],
        program: json["program"],
        email: json["email"],
        photo: json["photo"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "thirdId": thirdId,
        "code": code,
        "name": name,
        "program": program,
        "email": email,
        "photo": photo,
        "type": type
    };
}