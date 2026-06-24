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
        scaffoldBackgroundColor: Color(0xffD9D9D9),
      ),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeView(),
    );
  }
}