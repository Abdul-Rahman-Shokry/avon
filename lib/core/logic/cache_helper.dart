import 'package:avon/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static void setIsNotFirstTime() {
    _prefs.setBool("isFirstTime", false);
  }

  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime") ?? true;
  }

  static bool get isLoggedIn {
    return (_prefs.getString("token") ?? "").isNotEmpty;
  }

  static Future<void> saveUserData(UserData model) async {
    _prefs.setString("token", model.token);
    _prefs.setString("refreshToken", model.refreshToken);
    _prefs.setString("username", model.user.username);
    _prefs.setString("profilePhotoUrl", model.user.profilePhotoUrl);
    _prefs.setString("role", model.user.role);
    _prefs.setString("phoneNumber", model.user.phoneNumber);
    _prefs.setString("email", model.user.email);
  }
}