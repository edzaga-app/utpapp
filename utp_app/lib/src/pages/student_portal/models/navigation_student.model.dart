import 'dart:convert';

NavigationStudentModel navigationStudentModelFromJson(String str) => NavigationStudentModel.fromJson(json.decode(str));

String navigationStudentModelToJson(NavigationStudentModel data) => json.encode(data.toJson());

class NavigationStudentModel {
    NavigationStudentModel({
        this.id,
        this.name,
        this.navigation,
        this.icon,
        this.widget
    });

    int id;
    String name;
    String navigation;
    String icon;
    String widget;

    factory NavigationStudentModel.fromJson(Map<String, dynamic> json) => NavigationStudentModel(
        id: json["id"],
        name: json["name"],
        navigation: json["navigation"],
        icon: json["icon"],
        widget: json["widget"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "navigation": navigation,
        "icon": icon,
        "widget": widget
    };
}
