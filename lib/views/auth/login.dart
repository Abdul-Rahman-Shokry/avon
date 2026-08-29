import 'package:avon/core/logic/cache_helper.dart';
import 'package:avon/core/logic/dio_helper.dart';
import 'package:avon/core/logic/input_validator.dart';
import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_button.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_input.dart';
import 'package:avon/views/auth/create_account.dart';
import 'package:avon/views/auth/forgot_password.dart';
import 'package:avon/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? selectedCountryCode;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoginClicked = false;

  final formKey = GlobalKey<FormState>();

  DataState? state;

  Future<void> login() async {
    state = DataState.loading;
    setState(() {});

    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    // debugPrint(phone);
    // debugPrint(password);
    // debugPrint(selectedCountryCode);

    final resp = await DioHelper.postData(
      "/api/Auth/login",
      body: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );

    // {
    // "token": ".....",
    // "refreshToken": "...",
    //   "user": {
    //       "id": 11316,
    //       "username": "Cristiano Ronaldo", <--------
    //       "email": "...@gmail.com",
    //       "phoneNumber": "...",
    //       "countryCode": "+20",
    //       "role": "Customer",
    //       "profilePhotoUrl": "...",
    //       "otpCode": null,
    //       "otpExpiration": null
    //   }
    // }

    if (resp.isSuccess) {
      state = DataState.success;
      showMsg("Welcome: ${resp.successData["user"]["username"]}");
      final model = UserData.fromJson(resp.successData);
      await CacheHelper.saveUserData(model);
      goTo(page: HomeView(), canPop: false);
    } else {
      state = DataState.loading;
      showMsg(resp.errorMsg, isError: true);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            if (isLoginClicked) {
              formKey.currentState!.validate();
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13.r).copyWith(top: 48.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImage("login_img.png", width: 284.w, height: 227.h),
                SizedBox(height: 25.h),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Please enter the details below to continue",
                    style: TextStyle(
                      color: Color(0xff8E8EA9),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                AppInput(
                  label: "Phone Number",
                  controller: phoneController,
                  withCountryCode: true,
                  onCountryCodeChanged: (value) {
                    selectedCountryCode = value;
                  },
                  validator: InputValidator.phoneValidator,
                ),
                AppInput(
                  label: "Password",
                  isPassword: true,
                  bottomSpace: 0,
                  controller: passwordController,
                  validator: InputValidator.passwordValidator,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      goTo(page: ForgotPasswordView(), canPop: true);
                    },
                    child: Text("Forget Password?"),
                  ),
                ),
                SizedBox(height: 43.h),
                AppButton(
                  text: "Login",
                  isLoading: state == DataState.loading,
                  onPressed: () {
                    isLoginClicked = true;
                    if (formKey.currentState!.validate()) {
                      login();
                    }
                    // goTo(page: HomeView(), canPop: false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "Don't have an account? ",
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    goTo(page: CreateAccountView(), canPop: true);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
