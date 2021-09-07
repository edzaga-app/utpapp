import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:utp_app/src/services/base.service.dart';


class MobilePortalService {
  String endpoint = 'mobileportal';

  Future<String> getKey(String id) async {
    var response = await http.get(Uri.parse('${BaseService.apiUrl}$endpoint/key/$id'));
    if(response.statusCode != 200) return '';

    final decoded = await json.decode(response.body);
    return decoded['key'];

  }

  Future<String> loginStudent(String username, String password) async {
    var response = await http.post(
      Uri.parse('${BaseService.apiUrl}$endpoint/loginstudent'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String> {
        'username': username,
        'password': password
      }),
    );

    if(response.statusCode != 201) return '';

    final decoded = await json.decode(response.body);
    return decoded['token'];

  } 

}