import 'package:preferences/preference_service.dart';

class PreferencesService {
  static const String _currentUser = "CURRENT_USER";

  String getCurrentUser() {
    return PrefService.getString(_currentUser);
  }

  void setCurrentUser(String currentUser) {
    PrefService.setString(_currentUser, currentUser);
  }
}
