import 'package:avon/core/logic/cache_helper.dart';
import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/main.dart';
import 'package:avon/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    _Model(
      image: "on_boarding1.png",
      title: "WELCOME!",
      description:
          "Makeup has the power to transform your mood and empowers you to be a more confident person.",
      width: 283,
      height: 259,
    ),
    _Model(
      image: "on_boarding2.png",
      title: "SEARCH & PICK",
      description:
          "We have dedicated set of products and routines hand picked for every skin type.",
      width: 314,
      height: 288,
    ),
    _Model(
      image: "on_boarding3.png",
      title: "PUSH NOTIFICATIONS",
      description: "Allow notifications for new makeup & cosmetics offers.",
      width: 253,
      height: 253,
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLast = currentIndex == list.length - 1;
    final currentModel = list[currentIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: !isLast,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                      onPressed: () {
                        CacheHelper.setIsNotFirstTime();
                        goTo(page: LoginView(), canPop: false);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff434C6D),
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 79.h),
              AppImage(
                currentModel.image,
                width: currentModel.width.w,
                height: currentModel.height.h,
              ),
              SizedBox(height: 28.h),
              Text(
                currentModel.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                  currentModel.description,
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 30.h),
              isLast
                  ? FilledButton(
                      style: FilledButton.styleFrom(
                        fixedSize: Size(268.w, 64.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.r),
                        ),
                        backgroundColor: Color(0xff434C6D),
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        CacheHelper.setIsNotFirstTime();
                        goTo(page: LoginView(), canPop: false);
                      },
                      child: Text("let’s start!"),
                    )
                  : FloatingActionButton(
                      onPressed: () {
                        currentIndex = currentIndex + 1;
                        setState(() {});
                      },
                      child: AppImage("forward_stroke.svg"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String image, title, description;
  final double width, height;

  _Model({
    required this.image,
    required this.title,
    required this.description,
    required this.width,
    required this.height,
  });
}
