import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/navigation_student.model.dart';
import '../../../services/base.service.dart';
import '../../../helpers/storage.dart';


class NavigationStudentProvider with ChangeNotifier {
  final Storage storage;

  NavigationStudentProvider({
    @required this.storage
  });

  String endpoint = 'studentportal';
  List<NavigationStudentModel> stundentMenus = [];
  String token;

  Future<List<NavigationStudentModel>> getStudentMenus () async {
    token = storage.token;
    final response = await http.get(
      Uri.parse('${BaseService.apiUrl}$endpoint/studentmenus'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    if(response.statusCode != 200) return null;
    
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    final menus = parsed.map<NavigationStudentModel>((json) => NavigationStudentModel.fromJson(json)).toList();
    
    return menus;
  }

  
   


}