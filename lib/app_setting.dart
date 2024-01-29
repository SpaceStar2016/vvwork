import 'package:vvword/Utils/shared_preferences_manager.dart';

import 'cache/database.dart';

class AppSettings {

  static bool isTranslationVisible = false;

  static config() async {
    isTranslationVisible = await SharedPreferencesManager().getVisibility();
  }
}
