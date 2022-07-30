import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final prefs = SharedPreferences.getInstance();

  static void setBool(String key, bool value) async {
    (await prefs).setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    bool? value = (await prefs).getBool(key);
    if (value == null) {
      value = false;
      setBool(key, value);
    }

    return value;
  }
}
