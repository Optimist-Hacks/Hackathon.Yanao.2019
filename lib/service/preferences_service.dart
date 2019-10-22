import 'package:preferences/preference_service.dart';

class PreferencesService {
  static const String _currentUser = "CURRENT_USER";
  static const String _child = "CHILD";

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
}
