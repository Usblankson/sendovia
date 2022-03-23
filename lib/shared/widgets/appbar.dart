import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:planetx/shared/models/themes.dart';



appbar(Color color, Color backIconColor, String text, Color textColor,
    List<Widget> actions, PreferredSizeWidget widget,
    {bool centerTitle = true, hasBackIcon = true, BuildContext context}) {
  return AppBar(
    bottom: widget ?? null,
    elevation: 0,
    centerTitle: centerTitle,
    backgroundColor: color ?? primaryColor,
    leading: hasBackIcon
        ? InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back,
                color: backIconColor ?? secondaryBlue, size: 30))
        : Container(),
    title: Text(text ?? '',
        style: TextStyle(fontSize: 18, color: textColor ?? white)),
    actions: actions ?? null,
  );
}