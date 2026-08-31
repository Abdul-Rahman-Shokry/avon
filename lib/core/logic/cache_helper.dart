import 'package:avon/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
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

  static String? get token {
    return _prefs.getString("token");
  }

  static String get userName {
    return _prefs.getString("username") ?? "username";
  }

  static String get profilePhotoUrl {
    return _prefs.getString("profilePhotoUrl") ??
        "https://img.icons8.com/color/1200/person-male.jpg";
  }

  static Future<void> saveUserData({UserData? data, UserModel? model}) async {
    if (model == null && data == null) return;

    if (data != null) {
      _prefs.setString("token", data.token);
      _prefs.setString("refreshToken", data.refreshToken);
      model = data.user;
    }

    if (model != null) {
      _prefs.setString("username", model.username);
      _prefs.setString("profilePhotoUrl", model.profilePhotoUrl);
      _prefs.setString("role", model.role);
      _prefs.setString("phoneNumber", model.phoneNumber);
      _prefs.setString("email", model.email);
    }
  }

  static Future<void> clearSharedPrefs() async {
    await _prefs.remove("token");
    await _prefs.remove("refreshToken");
    await _prefs.remove("username");
    await _prefs.remove("profilePhotoUrl");
    await _prefs.remove("role");
    await _prefs.remove("phoneNumber");
    await _prefs.remove("email");
    // don't remove `isFirstTime`
  }
}
