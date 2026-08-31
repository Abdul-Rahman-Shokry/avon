class UserData {
  late final String token;
  late final String refreshToken;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? "";
    refreshToken = json['refreshToken'] ?? "";
    user = UserModel.fromJson(json['user'] ?? {});
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    countryCode = json['countryCode'] ?? "";
    role = json['role'] ?? "";
    profilePhotoUrl = json['profilePhotoUrl'] ?? "";
  }
}