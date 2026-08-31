import 'package:avon/core/logic/dio_helper.dart';
import 'package:avon/core/logic/input_validator.dart';
import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_back.dart';
import 'package:avon/views/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_input.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final phoneController = TextEditingController();
  String? selectedCountryCode;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r),
          child: Form(
            key: _formKey,
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
                AppInput(
                  label: "Phone Number",
                  validator: InputValidator.phoneValidator,
                  withCountryCode: true,
                  controller: phoneController,
                  onCountryCodeChanged: (value) {
                    selectedCountryCode = value;
                  },
                ),
                SizedBox(height: 56.h),
                AppButton(
                  text: "Next",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final resp = await DioHelper.postData(
                        "/api/Auth/forgot-password",
                        withToken: false,
                        body: {
                          "countryCode": selectedCountryCode,
                          "phoneNumber": phoneController.text,
                        },
                      );

                      if (resp.isSuccess) {
                        goTo(
                          page: OtpView(isFromForgetPassword: true),
                          canPop: true,
                        );
                      } else {
                        showMsg(resp.errorMsg, isError: true);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
