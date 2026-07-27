import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 13.w).copyWith(top: 50.h),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                AppImage(
                  "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww",
                  width: 96.w,
                  height: 96.h,
                  fit: BoxFit.cover,
                  isCircle: true,
                ),
                SizedBox(height: 16.h,),
                Text("Sara Samer Talaat"),
                SizedBox(height: 40.h,),
                ListTile(
                  onTap: () {},
                  leading: AppImage("edit_info.svg"),
                  title: Text("Edit Info"),
                  trailing: AppImage("forward.svg"),
                ),
                ListTile(
                  onTap: () {},
                  leading: AppImage("order_history.svg"),
                  title: Text("Order History"),
                  trailing: AppImage("forward.svg"),
                ),
                ListTile(
                  onTap: () {},
                  leading: AppImage("wallet.svg"),
                  title: Text("Wallet"),
                  trailing: AppImage("forward.svg"),
                ),
                ListTile(
                  onTap: () {},
                  leading: AppImage("settings.svg"),
                  title: Text("Settings"),
                  trailing: AppImage("forward.svg"),
                ),
                ListTile(
                  onTap: () {},
                  leading: AppImage("voucher.svg"),
                  title: Text("Voucher"),
                  trailing: AppImage("forward.svg"),
                ),
                ListTile(
                  onTap: () {},
                  leading: AppImage("logout.svg", color: Color(0xffCD0F0F)),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Color(0xffCD0F0F)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
