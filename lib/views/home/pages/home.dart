import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSearch(),
                SizedBox(height: 13.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImage(
                        "https://i.pinimg.com/originals/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg",
                        width: double.infinity,
                        height: 320.h,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE9DCD3).withValues(alpha: .8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "50% OFF DISCOUNT\nCUPON CODE : 125865",
                                    style: TextStyle(
                                      color: Color(0xff62322D),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  AppImage("offer.svg"),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  AppImage("offer.svg"),
                                  Spacer(),
                                  Text(
                                    "Hurry up!\nSkin care only !",
                                    style: TextStyle(
                                      color: Color(0xff434C6D),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Top rated products",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14.h),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 176 / 237,
                  ),
                  itemBuilder: (context, index) => _Item(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 2.h),
            blurRadius: 10.r,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: .25),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: AppImage(
                "frame_6.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            "Face tint / lip tint",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Color(0xff434C6D),
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            "\$44.99",
            style: TextStyle(
              color: Color(0xff70839C),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
