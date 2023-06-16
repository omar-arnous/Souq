import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setCache(String key, String token) async =>
      await _prefs.setString(key, token);

  static String getCache(String key) => _prefs.getString(key) ?? "";

  static Future<bool> removeCache(String key) => _prefs.remove(key);
}
