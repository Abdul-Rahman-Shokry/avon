import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/views/home/pages/categories/view.dart';
import 'package:avon/views/home/pages/home/view.dart';
import 'package:avon/views/home/pages/my_cart.dart';
import 'package:avon/views/home/pages/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 3;
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
        margin: EdgeInsets.symmetric(horizontal: 13.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(4.w, 4.h),
              blurRadius: 4.r,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
            BoxShadow(
              offset: Offset(-4.w, -4.h),
              blurRadius: 6.r,
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