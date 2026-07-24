import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_button.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_input.dart';
import 'package:avon/views/auth/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              AppInput(label: "Phone Number", withCountryCode: true),
              AppInput(label: "Password", isPassword: true, bottomSpace: 0),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forget Password?"),
                ),
              ),
              SizedBox(height: 43.h),
              AppButton(text: "Login", onPressed: (){},),
            ],
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
                  onPressed: () {},
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
