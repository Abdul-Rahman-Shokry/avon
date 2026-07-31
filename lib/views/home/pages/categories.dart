import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r),
          child: Column(
            children: [
              AppSearch(),
              SizedBox(height: 32.h),
              ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.w,
                  vertical: 30.h,
                ).copyWith(bottom: 100.h),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) =>
                    SizedBox(width: 65.w, height: 65.h, child: _Item()),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Divider(),
                ),
              ),
            ],
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
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: AppImage(
            "https://www.thedetoxmarket.ca/cdn/shop/files/1x1_ILIA_2022_BS_TSSC_SFFP.jpg?v=1772714924",
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          "Bundles",
          style: TextStyle(
            color: Color(0xff434C6D),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        Spacer(),
        AppImage("forward.svg"),
      ],
    );
  }
}
