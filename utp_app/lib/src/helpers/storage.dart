import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage with ChangeNotifier {
  
  final String key = "theme";
  SharedPreferences _preferences;
  bool _darkMode;

  bool get darkMode => _darkMode;

  Storage() {
    _darkMode = true;
    _loadFromPreferences();
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _darkMode = _preferences.getBool(key) ?? true;
    notifyListeners();
  }

  _initialPreferences() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _savePreferences() async {
    await _initialPreferences();
    _preferences.setBool(key, _darkMode);
  }

  /// LLamada de activación al método que cambia el modo dark o light
  
  toggleChangeTheme() {
    _darkMode = !_darkMode;
    _savePreferences();
    notifyListeners();
  }

}