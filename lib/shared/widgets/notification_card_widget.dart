import 'package:flutter/material.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/utils/images.dart';

Widget notificationCard(
  String status,
  String name,
  Function() onTap,
) {
  return Container(
    height: status == 'sent' ? 70 : 80,
    width: double.infinity,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: status == 'sent' ? white : inputFieldColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: inputFieldColor,
            width: 1.8,
          ),
        ),
        elevation: 0,
        color: status == 'sent' ? white : inputFieldColor,
        child: ListTile(
          leading: Image.asset(
            status == 'sent' ? sent : received,
            width: 24,
            height: 24,
          ),
          title: RichText(
            strutStyle: const StrutStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 2,
            ),
            text: status == 'sent'
                ? TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'You sent a gift to ',
                          style: TextStyle(color: supportTextColor)),
                      TextSpan(
                          text: name, style: TextStyle(color: textColorDark)),
                    ],
                  )
                : TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '$name ',
                          style: TextStyle(color: textColorDark)),
                      TextSpan(
                          text: 'just send a gift to you.',
                          style: TextStyle(color: supportTextColor)),
                    ],
                  ),
          ),
          trailing: Image.asset(forwardBtn, width: 24, height: 24),
        ),
      ),
    ),
  );
}
