import 'package:avon/core/logic/cache_helper.dart';
import 'package:avon/views/auth/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/helper_methods.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: navKey,
          theme: ThemeData(
            fontFamily: "Montserrat",
            cardColor: Color(0xffD9D9D9),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff434C6D),
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xffD75D72),
                fixedSize: Size.fromHeight(65.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.r),
                ),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Color(0xff434C6D),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Color(0xff8E8EA9),
              ),
              floatingLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Color(0xff8E8EA9),
              ),
              hintStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff8E8EA9),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Color(0xff5A6690).withValues(alpha: .4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Color(0xff5A6690).withValues(alpha: .4),
                ),
              ),
            ),
            scaffoldBackgroundColor: Color(0xffD9D9D9),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffD75D72)),
          ),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: ForgotPasswordView(),
    );
  }
}
