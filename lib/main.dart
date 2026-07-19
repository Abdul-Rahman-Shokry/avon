import 'package:avon/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
      builder: (_ , child){
        return MaterialApp(
          theme: ThemeData(
            fontFamily: "Montserrat",
            cardColor: Color(0xffD9D9D9),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff434C6D),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff8E8EA9),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Color(0xffB3B3C1)),
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
      child: HomeView(),
    );
  }
}