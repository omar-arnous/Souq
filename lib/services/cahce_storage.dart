import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static late SharedPreferences _prefs;
  static const _tokenKey = 'token';
  static const _idKey = 'id';
  static const _nameKey = 'name';

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setToken(String token) async =>
      await _prefs.setString(_tokenKey, token);

  static String getToken() => _prefs.getString(_tokenKey)!;

  static Future<bool> setName(String name) async =>
      await _prefs.setString(_nameKey, name);

  static String getName() => _prefs.getString(_nameKey)!;

  static Future<bool> setid(String id) async =>
      await _prefs.setString(_idKey, id);

  static String getid() => _prefs.getString(_idKey)!;
}
