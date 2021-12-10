import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/program.model.dart';
import '../../../services/base.service.dart';

class AcademicHistoryService {
  String endpoint = 'studentportal';

  Future<List<ProgramModel>> getPrograms(String token) async {

    final response = await http.get(
      Uri.parse('${BaseService.apiUrl}$endpoint/programs'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    if(response.statusCode != 200) return null;

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    final decoded = parsed.map<ProgramModel>((json) => ProgramModel.fromJson(json)).toList();

    return decoded;

  }


}