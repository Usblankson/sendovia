import 'package:flutter/cupertino.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/navigation.dart';

Widget scrollActionTag(
  BuildContext context,
  String tag,
  String cta,
  Widget page,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      AppText(tag, 14, FontWeight.w500, textColor, 0, 2, null),
      AppText(cta, 12, FontWeight.w500, primaryColor, 0, 1.6,
          () => Nav.forward(context, page)),
    ],
  );
}
