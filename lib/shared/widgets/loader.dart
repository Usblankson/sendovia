import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:planetx/shared/utils/color.dart';


class Loader extends StatelessWidget {
  final double radius;
  final Color color;
  const Loader({this.radius, this.color = primaryColor, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius ?? 35,
      height: radius ?? 35,
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color))
          : CupertinoActivityIndicator(
        color: color,
              radius: radius ?? 20,
            ),
      // : Image.asset(loadingGif, width: 40, height: 40)
    );
  }
}
