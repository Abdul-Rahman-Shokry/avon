import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_button.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/views/auth/login/view.dart';
import 'package:avon/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  final String title, desc, buttonText;
  final bool isFromForgetPassword;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.desc,
    required this.buttonText,
    this.isFromForgetPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(16.r),
      backgroundColor: Color(0xffD9D9D9),
      insetPadding: EdgeInsets.all(24.r),
      children: [
        SizedBox(width: double.maxFinite),
        AppImage(
          "success.json",
          height: 100.h,
          width: 100.w,
          bottomSpace: 26.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff434C6D),
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 7.h),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff8E8EA9),
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 23.h),
        AppButton(
          text: buttonText,
          onPressed: () {
            goTo(page: isFromForgetPassword ? LoginView() : HomeView(), canPop: false);
          },
        ),
      ],
    );
  }
}
