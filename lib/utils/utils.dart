import 'package:flutter/material.dart';
import 'dart:ui';

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


///design height(responsiveness)
// double logicalHeight() {
//   return WidgetsBinding.instance.window.physicalSize.height /
//       WidgetsBinding.instance.window.devicePixelRatio;
// }

///design width(responsiveness)
// double logicalWidth() {
//   return WidgetsBinding.instance.window.physicalSize.width /
//       WidgetsBinding.instance.window.devicePixelRatio;
// }

double logicalHeight() {
  var logSs = window.physicalSize /
      window.devicePixelRatio;
  print('height ${logSs.height}');
  return logSs.height;
}

double logicalWidth() {
  var logSs = window.physicalSize /
      window.devicePixelRatio;
  print('width ${logSs.width}');
  return logSs.width;
}