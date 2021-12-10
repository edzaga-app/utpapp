import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../pages/student_portal/models/schedule.model.dart';
import '../../../services/base.service.dart';

class ScheduleService {
  String endpoint = 'studentportal';

  Future<ScheduleModel> getSchedule(String token) async {
    final response = await http.get(
      Uri.parse('${BaseService.apiUrl}$endpoint/schedules'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    if(response.statusCode != 200) return null;
    
    final parsed = json.decode(response.body);
    final schedule = ScheduleModel.fromJson(parsed);  
    return schedule;

  }



}