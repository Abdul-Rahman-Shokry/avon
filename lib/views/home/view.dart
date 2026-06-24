import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final list = [
    "cart_icon.svg",
    "categories_icon.svg",
    "home_icon.svg",
    "profile_icon.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/${list[index]}"),
              label: "",
            ),
          ),
        ),
      ),
    );
  }
}
