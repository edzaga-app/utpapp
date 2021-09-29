import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../pages/student_portal/models/user_information.model.dart';
import '../../../services/base.service.dart';

class StudentPortalService {
  String endpoint = 'studentportal';

  Future<UserInformationModel> getUserInformation(String token) async {

    final response = await http.get(
      Uri.parse('${BaseService.apiUrl}$endpoint/information'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    if(response.statusCode != 200) return null;

    final decoded = UserInformationModel.fromJson(jsonDecode(response.body));
    return decoded;

  }



}