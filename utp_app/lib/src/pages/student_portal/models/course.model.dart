import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
    CourseModel({
        this.courseId,
        this.course,
        this.groupNumber,
        this.courseCode,
        this.teacher,
        this.grade,
        this.detailGrades,
    });

    int courseId;
    String course;
    String groupNumber;
    String courseCode;
    String teacher;
    double grade;
    List<DetailGrade> detailGrades;

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courseId: json["courseId"],
        course: json["course"],
        groupNumber: json["groupNumber"],
        courseCode: json["courseCode"],
        teacher: json["teacher"],
        grade: json["grade"].toDouble(),
        detailGrades: List<DetailGrade>.from(json["detailGrades"].map((x) => DetailGrade.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "course": course,
        "groupNumber": groupNumber,
        "courseCode": courseCode,
        "teacher": teacher,
        "grade": grade,
        "detailGrades": List<dynamic>.from(detailGrades.map((x) => x.toJson())),
    };
}

class DetailGrade {
    DetailGrade({
        this.courseId,
        this.courseModuleId,
        this.activity,
        this.path,
        this.percentage,
        this.grade,
    });

    int courseId;
    int courseModuleId;
    String activity;
    String path;
    int percentage;
    double grade;

    factory DetailGrade.fromJson(Map<String, dynamic> json) => DetailGrade(
        courseId: json["courseId"],
        courseModuleId: json["courseModuleId"],
        activity: json["activity"],
        path: json["path"],
        percentage: json["percentage"],
        grade: json["grade"] == null ? null : json["grade"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseModuleId": courseModuleId,
        "activity": activity,
        "path": path,
        "percentage": percentage,
        "grade": grade == null ? null : grade,
    };
}
