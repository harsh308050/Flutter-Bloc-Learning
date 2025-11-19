import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, dynamic value) async {
    if (prefs == null) await init();
    if (value is String) {
      return prefs!.setString(key, value);
    } else if (value is int) {
      return prefs!.setInt(key, value);
    } else if (value is bool) {
      return prefs!.setBool(key, value);
    } else if (value is double) {
      return prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return prefs!.setStringList(key, value);
    }
    return false;
  }

  static dynamic getData(String key) {
    if (prefs == null) return null;

    dynamic value = prefs!.get(key);
    if (value is String) {
      return jsonDecode(value);
    }
    return value;
  }

  static Future<bool> removeData(String key) async {
    if (prefs == null) await init();
    return prefs!.remove(key);
  }

  static Future<bool> clearAllData() async {
    if (prefs == null) await init();
    return prefs!.clear();
  }
}
