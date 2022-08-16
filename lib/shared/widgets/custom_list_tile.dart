import 'package:flutter/material.dart';
import 'package:planetx/shared/utils/app_text.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/navigation.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {Key key,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.onTap})
      : super(key: key);
  String title, subtitle, leading, trailing;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              leading,
              width: 32,
              height: 32,
            ),
            title: AppText(
              title,
              16,
              FontWeight.w500,
              textColorDark,
              0,
              1.6,
              null,
            ),
            subtitle: AppText(
              subtitle,
              14,
              FontWeight.w400,
              textColorDark,
              0,
              1.6,
              null,
            ),
            trailing: Image.asset(trailing, width: 24, height: 24),
          ),
        ),
      ),
    );
  }
}
