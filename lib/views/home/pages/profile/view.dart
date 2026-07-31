import 'package:avon/core/utils/helper_methods.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part './widgets/item.dart';
part './widgets/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  _Item(title: "Edit Info"),
                  _Item(title: "Order History"),
                  _Item(title: "Wallet"),
                  _Item(title: "Settings"),
                  _Item(title: "Voucher"),
                  _Item(
                    onTap: () {
                      goTo(page: LoginView(), canPop: false);
                    },
                    title: "Logout",
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}