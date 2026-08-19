import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/offers.dart';
part 'widgets/products.dart';

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
                _Offers(),
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
                _Products(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductModel model;

  const _Item({super.key, required this.model});

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
                model.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            model.nameEn,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Color(0xff434C6D),
            ),
          ),
          SizedBox(height: 11.h),
          Text(
            "${model.price} \$",
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
