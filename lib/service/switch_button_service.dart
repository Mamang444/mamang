import 'package:shared_preferences/shared_preferences.dart';
import 'package:mamang/login_interface/switch_button_interface.dart';

class SwitchButtonServices extends ISwitchButton {
  @override
  Future<bool> getK(String key) async {
    final prefs = await SharedPreferences.getInstance();
    Object? isDark = prefs.get(key);
    if (isDark == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future put(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}