import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_back.dart';
import 'package:avon/views/auth/create_password.dart';
import 'package:avon/views/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_input.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                  child: AppBack(),
              ),
              SizedBox(height: 40.h,),
              AppImage("Layer_1.png", width: 67.w, height: 62.h),
              SizedBox(height: 40.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Please enter your phone number below to recovery your password.",
                  style: TextStyle(
                    color: Color(0xff8E8EA9),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 45.h),
              AppInput(label: "Phone Number", withCountryCode: true),
              SizedBox(height: 56.h),
              AppButton(
                text: "Next",
                onPressed: () {
                  goTo(page: OtpView(), canPop: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
