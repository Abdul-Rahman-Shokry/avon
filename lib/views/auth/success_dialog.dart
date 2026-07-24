import 'package:avon/core/widgets/app_button.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(16.r),
      backgroundColor: Color(0xffD9D9D9),
      insetPadding: EdgeInsets.all(24.r),
      children: [
        SizedBox(width: double.maxFinite),
        AppImage("success.json", height: 100.h, width: 100.w, bottomSpace: 26.h,),
        Text(
          "Account Activated!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff434C6D),
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 7.h,),
        Text(
          "Congratulations! Your account \nhas been successfully activated",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff8E8EA9),
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 23.h,),
        AppButton(
          text: "Go to home",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
