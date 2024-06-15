import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static const String _keyName = 'nombre';
  static const String _keyPassword = 'contraseña';
  static const String _keyUserRegistered = 'usuarioRegistrado';

  static Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  static Future<void> setPassword(int password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyPassword, password);
  }

  static Future<int?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyPassword);
  }

  static Future<void> setUserRegistered(bool registered) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyUserRegistered, registered);
  }

  static Future<bool?> getUserRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyUserRegistered);
  }

  static Future<void> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyName);
    await prefs.remove(_keyPassword);
    await prefs.remove(_keyUserRegistered);
  }
}
