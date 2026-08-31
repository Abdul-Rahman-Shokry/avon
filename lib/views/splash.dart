import 'package:animate_do/animate_do.dart';
import 'package:avon/core/logic/cache_helper.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/views/auth/login/view.dart';
import 'package:avon/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/helper_methods.dart';
import 'on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    goTo(
      page: CacheHelper.isFirstTime
          ? OnBoardingView()
          : CacheHelper.isLoggedIn
          ? HomeView()
          : LoginView(),
      canPop: false,
      delaySeconds: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Jello(
              duration: Duration(seconds: 3),
              child: AppImage(
                "logo_large.png",
                width: 220.w,
                height: 220.h,
                bottomSpace: 20.h,
              ),
            ),
            AppImage(
              "COSMATICS.png",
              width: 128.w,
              height: 18.h,
              bottomSpace: 7.h,
            ),
            AppImage("splash_image2.png", width: 128.w),
          ],
        ),
      ),
    );
  }
}
