import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage("logo_large.png", width: 220.w, height: 220.h, bottomSpace: 20.h,),
            AppImage("COSMATICS.png", width: 128.w, height: 18.h, bottomSpace: 7.h),
            AppImage("splash_image2.png", width: 128.w),
          ],
        ),
      ),
    );
  }
}
