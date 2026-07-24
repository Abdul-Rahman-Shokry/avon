import 'package:avon/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_input.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r).copyWith(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage("Layer_1.png", width: 67.w, height: 62.h),
              SizedBox(height: 40.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Create Password",
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
                  "The password should have at least\n6 characters.",
                  style: TextStyle(
                    color: Color(0xff8E8EA9),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              AppInput(label: "Create your password", isPassword: true),
              AppInput(label: "Confirm password", isPassword: true),
              SizedBox(height: 70.h),
              AppButton(
                text: "Confirm",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SuccessDialog());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
