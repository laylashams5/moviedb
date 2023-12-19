import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveString(String key, String value) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized.");
    }
    return _prefs!.setString(key, value);
  }

  static String? loadString(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized.");
    }
    return _prefs!.getString(key);
  }

  static Future<bool> remove(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized.");
    }
    return _prefs!.remove(key);
  }

  static Future<bool> clear() {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized.");
    }
    return _prefs!.clear();
  }

  static bool? getBool(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized.");
    }
    return _prefs!.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized.");
    }
    return _prefs!.setBool(key, value);
  }
  static const String _keyUserInfo = 'user_info';

  // Save user information to SharedPreferences
  static Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final userInfoJson = jsonEncode(userInfo);
    await prefs.setString(_keyUserInfo, userInfoJson);
  }

  // Retrieve user information from SharedPreferences
  static Future<Map<String, dynamic>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userInfoJson = prefs.getString(_keyUserInfo);
    if (userInfoJson != null) {
      return jsonDecode(userInfoJson);
    }
    return null; // Return null if user info is not found
  }
}
