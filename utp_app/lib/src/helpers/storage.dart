import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage with ChangeNotifier {
  
  final String key = "theme";
  final String tokenKey = "token";

  SharedPreferences _preferences;
  bool _darkMode;
  String _encryptedKey;
  String _token;

  bool get darkMode => _darkMode;
  String get encryptedKey => _encryptedKey; 
  String get token => _token;

  Storage() {
    _darkMode = true;
    _encryptedKey = "";
    _token = "";
    _loadFromPreferences();
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _darkMode = _preferences.getBool(key) ?? true;
    _encryptedKey = _preferences.getString("key");
    _token = _preferences.getString(tokenKey);
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

  _savePreferencesToken(String token) async {
    await _initialPreferences();
    _preferences.setString(tokenKey, token);
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

  setToken(String token) {
    _token = token;
    _savePreferencesToken(_token);
    notifyListeners();
  }

  deleteToken() {
    _preferences.remove(tokenKey);
  }


}