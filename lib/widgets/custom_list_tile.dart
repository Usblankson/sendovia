import 'package:flutter/material.dart';
import 'package:sendovia/utils/app_text.dart';
import 'package:sendovia/utils/colors.dart';

import '../utils/navigation.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {Key? key, this.leading, this.title, this.subtitle, this.trailing, this.page})
      : super(key: key);
  String? title, subtitle, leading, trailing;
  Widget? page;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Nav.forward(context, page!),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: inputFieldColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          color: inputFieldColor,
          child: ListTile(
            leading: Image.asset(
              leading!,
              width: 32,
              height: 32,
            ),
            title: AppText(
              title!,
              16,
              FontWeight.w500,
              textColor,
              0,
              1.6,
              null,
            ),
            subtitle: AppText(
              subtitle!,
              14,
              FontWeight.w400,
              textColor,
              0,
              1.6,
              null,
            ),
            trailing: Image.asset(trailing!, width: 24, height: 24),
          ),
        ),
      ),
    );
  }
}
