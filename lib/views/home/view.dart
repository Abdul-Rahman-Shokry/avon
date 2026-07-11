import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/views/home/pages/categories.dart';
import 'package:avon/views/home/pages/home.dart';
import 'package:avon/views/home/pages/my_cart.dart';
import 'package:avon/views/home/pages/profile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final list = [
    _Model(icon: "home_icon.svg", page: HomePage()),
    _Model(icon: "categories_icon.svg", page: CategoriesPage()),
    _Model(icon: "cart_icon.svg", page: MyCartPage()),
    _Model(icon: "profile_icon.svg", page: ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,

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
          onTap: (value){
            currentIndex = value;
            setState((){

            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                list[index].icon,
                color: currentIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
              ),
              label: "",
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;
  final Widget page;

  _Model({required this.icon, required this.page});
}