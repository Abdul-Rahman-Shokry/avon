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
                  CacheHelper.profilePhotoUrl,
                  width: 96.w,
                  height: 96.h,
                  isCircle: true,
                ),
                SizedBox(height: 16.h),
                Text(
                  CacheHelper.userName,
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