import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/modules-new/authentication/login.dart';
import 'package:planetx/modules-new/screens/account_screens/change_password.dart';
import 'package:planetx/modules-new/screens/account_screens/edit_profile.dart';
import 'package:planetx/modules-new/utils/app_text.dart';
import 'package:planetx/modules-new/utils/colors.dart';
import 'package:planetx/modules-new/utils/images.dart';
import 'package:planetx/modules-new/widgets/custom_list_tile.dart';

import '../../shared/widgets/space.dart';
class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor: appbarShadowColor.withOpacity(0.1),
        toolbarHeight: Platform.isAndroid ? 70.h : 50.h,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 1,
        bottomOpacity: 0.1,
        title: AppText(
          'Account',
          20.sp,
          FontWeight.w500,
          textColor,
          0,
          0,
          null,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(24.h),
              CustomListTile(
                title: 'My Profile',
                subtitle: 'View & update profile',
                leading: profileSetting,
                trailing: forwardBtn,
                page: const EditProfile(),
              ),
              VSpace(16.h),
              CustomListTile(
                title: 'Password',
                subtitle: 'Change your password',
                leading: password,
                trailing: forwardBtn,
                page: const ChangePassword(),
              ),
              VSpace(16.h),
              CustomListTile(
                title: 'Logout',
                subtitle: 'Logout of your account',
                leading: logout,
                trailing: forwardBtn,
                page: const LogIn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
