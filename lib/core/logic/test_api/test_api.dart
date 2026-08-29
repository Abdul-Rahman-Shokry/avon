import 'dart:io';

import 'dio_helper_test.dart';

Future<void> main() async {
  int cnt = 1;

  while (true) {
    print("1. Login");
    print("2. Register");
    print("3. Verify OTP");
    print("4. Logout \n ----");
    stdout.write("Enter a number: ");
    String num = stdin.readLineSync()!;

    if (num == '1') {
      cnt = 1;
      await login();
    } else if (num == '2') {
      cnt = 1;
      await register();
    } else if (num == '3') {
      cnt = 1;
      await verifyOTP();
    } else if (num == '4') {
      cnt = 1;
      await logout();
    } else {
      if (cnt == 3) {
        print("Please try again later");
        break;
      }
      cnt++;
      print("Invalid number, please try again");
    }
  }

  // logout();
  // verifyOTP();
  // login();
  // register();
}

Future<void> verifyOTP() async {
  stdout.write("Enter countryCode: ");
  String countryCode = stdin.readLineSync()!;
  stdout.write("Enter phoneNumber: ");
  String phoneNumber = stdin.readLineSync()!;
  stdout.write("Enter otpCode: ");
  String otpCode = stdin.readLineSync()!;

  final resp = await DioHelperTest.postData(
    "/api/Auth/verify-otp",
    body: {
      "countryCode": countryCode,
      "phoneNumber": phoneNumber,
      "otpCode": otpCode,
    },
  );

  if (resp.isSuccess){
    print("Success Data \n ${resp.successData}");
    await login();
  } else {
    print("Error Msg \n ${resp.errorMsg}");
    print("Error Status Code: ${resp.errorStatusCode}");
    print("----\n Enter the OTP Again \n----");
    await verifyOTP();
  }

}

Future<void> login() async {
  stdout.write("Enter countryCode: ");
  String countryCode = stdin.readLineSync()!;
  stdout.write("Enter phoneNumber: ");
  String phoneNumber = stdin.readLineSync()!;
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;

  final resp = await DioHelperTest.postData(
    "/api/Auth/login",
    body: {
      "countryCode": countryCode,
      "phoneNumber": phoneNumber,
      "password": password,
    },
  );

  if (resp.isSuccess){
    print("Success Data \n ${resp.successData}");
  } else {
    print("Error Msg \n ${resp.errorMsg}");
    print("Error Status Code: ${resp.errorStatusCode}");
    await login();
  }
}

Future<void> register() async {
  stdout.write("Enter username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter countryCode: ");
  String countryCode = stdin.readLineSync()!;
  stdout.write("Enter phoneNumber: ");
  String phoneNumber = stdin.readLineSync()!;
  stdout.write("Enter email: ");
  String email = stdin.readLineSync()!;
  stdout.write("Enter password: ");
  String password = stdin.readLineSync()!;

  final resp = await DioHelperTest.postData(
    "/api/Auth/register",
    body: {
      "username": username,
      "countryCode": countryCode,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
    },
  );

  if(resp.isSuccess){
    print("Success Data \n ${resp.successData}");
    await verifyOTP();
  } else {
    print("Error Msg \n ${resp.errorMsg}");
    print("Error Status Code: ${resp.errorStatusCode}");
    print("Please try again");
    await register();
  }

}

Future<void> logout() async {
  await DioHelperTest.postData("/api/Auth/logout");
}
