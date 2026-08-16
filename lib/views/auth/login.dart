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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
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
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Phone number is required";
                    }
                    return null;
                  },
                ),
                AppInput(
                  label: "Password",
                  isPassword: true,
                  bottomSpace: 0,
                  controller: passwordController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password is required";
                    }
                    return null;
                  },
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
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      final phone = phoneController.text.trim();
                      final password = passwordController.text.trim();
                      debugPrint(phone);
                      debugPrint(password);
                      debugPrint(selectedCountryCode);
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
