import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../pages/student_portal/models/course.model.dart';
import '../../../services/base.service.dart';

class CourseService {
  String endpoint = 'studentportal';

  Future<List<CourseModel>> getCourses(String token) async {
    final response = await http.get(
      Uri.parse('${BaseService.apiUrl}$endpoint/courses'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    if(response.statusCode != 200) return null;

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    final decoded = parsed.map<CourseModel>((json) => CourseModel.fromJson(json)).toList();
    return decoded;

  }



}