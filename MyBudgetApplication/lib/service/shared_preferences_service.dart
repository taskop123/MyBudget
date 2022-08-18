import 'package:shared_preferences/shared_preferences.dart';

/// A service used for storing and fetching data from the SharedPreferences].
class SharedPreferencesService {
  /// An instance of the [SharedPreferences] object.
  static final prefs = SharedPreferences.getInstance();

  /// Stores a new boolean entry to the [SharedPreferences] device storage,
  /// or overwrites an existing entry with a specific [key] and [value].
  ///
  static void setBool(String key, bool value) async {
    (await prefs).setBool(key, value);
  }

  /// Reads an existing boolean entry from the [SharedPreferences] device storage,
  /// or overwrites an existing entry with a specific [key] and [value].
  ///
  /// If there isn't a value for the specified [key],
  /// default value of false is stored in its place.
  static Future<bool> getBool(String key) async {
    bool? value = (await prefs).getBool(key);
    if (value == null) {
      value = false;
      setBool(key, value);
    }

    return value;
  }
}
