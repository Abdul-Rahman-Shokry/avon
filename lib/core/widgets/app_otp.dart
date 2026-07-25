import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class AppOtp extends StatelessWidget {
  const AppOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 45.h,
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: Color(0xff434C6D),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red, width: 1.5.w),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red, width: 1.5.w),
    );

    return Pinput(
      // controller: cubit.otpController,
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 2.w, height: 24.h, color: Colors.grey),
        ],
      ),
    );
  }
}
