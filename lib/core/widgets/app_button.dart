import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;

  const AppButton({super.key, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
    );
  }
}
