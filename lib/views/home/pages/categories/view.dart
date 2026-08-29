import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './widgets/categories.dart';

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
              _Categories(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoryItemModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            width: 70.w,
            height: 70.h,
            child: AppImage(
              model.imageUrl,
              fit: BoxFit.cover,
          
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          model.titleEn,
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