import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage with ChangeNotifier {
  
  final String key = "theme";

  SharedPreferences _preferences;
  bool _darkMode;
  String _encryptedKey;

  bool get darkMode => _darkMode;
  String get encryptedKey => _encryptedKey; 

  Storage() {
    _darkMode = true;
    _encryptedKey = "";
    _loadFromPreferences();
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _darkMode = _preferences.getBool(key) ?? true;
    _encryptedKey = _preferences.getString("key");
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

  _savePreferencesKey(String key) async {
    await _initialPreferences();
    _preferences.setString("key", _encryptedKey);
  }

  /// LLamada de activación al método que cambia el modo dark o light
  
  toggleChangeTheme() {
    _darkMode = !_darkMode;
    _savePreferences();
    notifyListeners();
  }

  setEncryptedkey(String key) {
    _encryptedKey = key;
    _savePreferencesKey(_encryptedKey);
    notifyListeners();
  }

}