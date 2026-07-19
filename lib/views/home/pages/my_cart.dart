import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You have 4 products in your cart",
                style: TextStyle(
                  color: Color(0xff434C6D).withValues(alpha: .55),
                  fontSize: 12.sp,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ).copyWith(bottom: 100.h),
                  itemBuilder: (context, index) => _Item(),
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: Divider(),
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Stack(
            children: [
              AppImage(
                "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRgVZcQbPuAOeERYHP6NbyLNyQ21MMcm27KtwstBWsSNQwtB0fy",
                width: 102.w,
                height: 102.h,
              ),
              Positioned(
                top: 6.h,
                left: 6.w,
                child: AppImage("delete.svg", width: 19.w, height: 19.h),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    color: Color(0xff3B4569),
                  ),
                  children: [
                    TextSpan(text: "Note Cosmetics\n"),
                    TextSpan(
                      text: "Ultra rich mascara for lashes\n\n",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3B4569).withValues(alpha: .73),
                      ),
                    ),
                    TextSpan(text: "350 EGP"),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff8E8EA9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {
                        if(counter > 0){
                          counter--;
                          setState(() {});
                        }
                      }, icon: AppImage("minus.svg")),
                      Text(
                        "$counter",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Color(0xff434C6D),
                        ),
                      ),
                      IconButton(onPressed: () {
                        counter++;
                        setState(() {});
                      }, icon: AppImage("plus.svg")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
