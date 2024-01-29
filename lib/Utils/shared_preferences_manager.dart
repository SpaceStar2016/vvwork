import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance =
  SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal();

  Future<void> setVisibility(bool isVisible) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isVisibleTranslation', isVisible);
  }

  Future<bool> getVisibility() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isVisibleTranslation') ?? false;
  }
}
