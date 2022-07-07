import 'package:flutter/material.dart';
import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/images.dart';
import 'package:sendovia/view/app/screens/account_screens/change_password.dart';
import 'package:sendovia/view/app/screens/account_screens/edit_profile.dart';
import 'package:sendovia/view/authentication/login.dart';

import '../../../utils/colors.dart';
import '../../../utils/spacing.dart';
import '../../../widgets/custom_list_tile.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

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
        toolbarHeight: 70,
        toolbarOpacity: 0.5,
        backgroundColor: white,
        elevation: 3,
        bottomOpacity: 0.1,
        title: AppText(
          'Account',
          20,
          FontWeight.w500,
          textColor,
          0,
          0,
          null,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(24),
              CustomListTile(
                title: 'My Profile',
                subtitle: 'View & update profile',
                leading: profileSetting,
                trailing: forwardBtn,
                page: const EditProfile(),
              ),
              const YMargin(16),
              CustomListTile(
                title: 'Password',
                subtitle: 'Change your password',
                leading: password,
                trailing: forwardBtn,
                page: const ChangePassword(),
              ),
              const YMargin(16),
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
