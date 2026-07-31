part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232.h,
      child: Stack(
        children: [
          Container(
            height: 152.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.bottomCenter,
                end: AlignmentDirectional.topCenter,
                stops: [0, 1],
                colors: [
                  Color(0xffECA4C5),
                  Color(0xff434C6D).withValues(alpha: .4),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImage(
                  "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
                  width: 96.w,
                  height: 96.h,
                  isCircle: true,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Sara Samer Talaat",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}