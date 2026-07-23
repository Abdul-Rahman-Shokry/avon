import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_input.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r).copyWith(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage("Layer_1.png", width: 67.w, height: 62.h,),
              SizedBox(height: 40.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              AppInput(label: "Your Name",),
              AppInput(label: "Email",),
              AppInput(label: "Phone Number", withCountryCode: true),
              AppInput(label: "Create your password", isPassword: true),
              AppInput(label: "Confirm password", isPassword: true),
              AppButton(text: "Next"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "Have an account? ",
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
