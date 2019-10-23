import 'package:preferences/preference_service.dart';

class PreferencesService {
  static const String _currentUser = "CURRENT_USER";
  static const String _child = "CHILD";
  static const String _data = "DATA";

  String getCurrentUser() {
    return PrefService.getString(_currentUser);
  }

  void setCurrentUser(String currentUser) {
    PrefService.setString(_currentUser, currentUser);
  }

  String getChild() {
    return PrefService.getString(_child);
  }

  void setChild(String childId) {
    PrefService.setString(_child, childId);
  }

  String getData() {
    return PrefService.getString(_data);
  }

  void setData(String data) {
    PrefService.setString(_data, data);
  }

  Future<void> reset() async {
    await PrefService.sharedPreferences.clear();
    PrefService.clearCache();
  }
}
