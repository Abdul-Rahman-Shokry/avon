import 'package:avon/views/home/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Montserrat",
        cardColor: Color(0xffD9D9D9),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        scaffoldBackgroundColor: Color(0xffD9D9D9),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffD75D72)),
      ),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeView(),
    );
  }
}