import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/navigation_student.model.dart';
import '../../../services/base.service.dart';
import '../../../helpers/storage.dart';

import 'package:utp_app/src/pages/student_portal/partial_notes.dart';
import 'package:utp_app/src/pages/student_portal/schedule.dart';
import 'package:utp_app/src/pages/student_portal/academic_history.dart';
import 'package:utp_app/src/pages/student_portal/teacher_evaluation.dart';
import 'package:utp_app/src/pages/student_portal/library.dart';
import 'package:utp_app/src/pages/student_portal/merbership.dart';
import 'package:utp_app/src/pages/student_portal/configuration.dart';


class NavigationStudentProvider with ChangeNotifier {
  final Storage storage;

  NavigationStudentProvider({
    @required this.storage
  });

  String endpoint = 'studentportal';
  String token;
  String currentNavigation = 'studentHome';
  String nameNavigation = 'Portal Estudiantil';
  String loadWidget;
  int indexMenu = -1;


  List<Widget> menus = [
    PartialNotes(),
    Schedule(),
    AcademicHistory(),
    TeacherEvaluation(),
    Library(),
    Merbership(),
    Configuration()
  ];
  
  
  List<NavigationStudentModel> _stundentMenus = [];
  List<NavigationStudentModel> get studentmenus {
    return _stundentMenus;
  }

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
    _stundentMenus = parsed.map<NavigationStudentModel>((json) => NavigationStudentModel.fromJson(json)).toList();
    notifyListeners();

    return _stundentMenus;
  }

  get getNavigation {
    if (currentNavigation == 'studentHome') return;
    return menus[indexMenu];
  }

  updateNavigation(NavigationStudentModel menu, int index) {  
    currentNavigation = menu.navigation;
    nameNavigation = menu.name;
    loadWidget = menu.widget;
    indexMenu = index;
    notifyListeners();
  }

  
   


}