import 'package:avon/core/logic/cache_helper.dart';
import 'package:avon/core/widgets/app_otp.dart';
import 'package:avon/views/auth/create_password.dart';
import 'package:avon/views/auth/success_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/helper_methods.dart';
import '../../core/widgets/app_back.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';

class OtpView extends StatelessWidget {
  final bool isFromForgetPassword;

  const OtpView({super.key, this.isFromForgetPassword = true});

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
              SizedBox(height: 40.h),
              AppImage("Layer_1.png", width: 67.w, height: 62.h),
              SizedBox(height: 40.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "Verify Code",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Text.rich(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Color(0xff8E8EA9),
                  height: 1.7.h,
                ),
                TextSpan(
                  text:
                      "We just sent a 4-digit verification code to your email ",
                  children: [
                    TextSpan(
                      text: "${CacheHelper.email}. ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "Enter the code in the box below to continue.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45.h),
              AppOtp(),
              SizedBox(height: 47.h),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Didn’t receive a code? ",
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Color(0xffD75D72).withValues(alpha: .54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CircularCountDownTimer(
                    width: 50.w,
                    height: 40.h,
                    duration: 5,
                    isReverse: true,
                    textFormat: CountdownTextFormat.MM_SS,
                    textStyle: TextStyle(
                      color: Color(0xff8E8EA9),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                    fillColor: Colors.transparent,
                    ringColor: Colors.transparent,
                  ),
                  // Text(
                  //   "0:24",
                  //   style: TextStyle(
                  //     color: Color(0xff8E8EA9),
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 12.sp,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 113.h),
              AppButton(
                text: "Done",
                onPressed: () {
                  isFromForgetPassword
                      ? goTo(page: CreatePasswordView(), canPop: true)
                      : goTo(
                          page: SuccessDialog(
                            isFromForgetPassword: false,
                            title: "Account Activated!",
                            desc:
                                "Congratulations! Your account has been successfully activated",
                            buttonText: "Go to home",
                          ),
                          canPop: true,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
