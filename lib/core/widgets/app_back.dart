import 'dart:math';

import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: Color(0xff101010).withValues(alpha: .05),
          radius: 18.w,
          child: Transform.rotate(
            angle: pi,
            child: AppImage("forward_stroke.svg", color: Colors.black),
          ),
        ),
      ),
    );
  }
}
