import 'package:flutter/material.dart';
import 'package:sendovia/utils/colors.dart';
import 'package:sendovia/utils/images.dart';

Widget notificationCard(
  String status,
  String name,
) {
  return Container(
    height: status == 'sent' ? 70: 80,
    width: double.infinity,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: status == 'sent' ? white: inputFieldColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color:  inputFieldColor,
          width: 1.8,
        ),
      ),
      elevation: 0,
      color:  status == 'sent' ? white: inputFieldColor,
      child: ListTile(
        leading: Image.asset(
          status == 'sent' ? sent: received,
          width: 24,
          height: 24,
        ),
        title:  RichText(
          strutStyle: const StrutStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 2,
          ),
    text: status == 'sent' ?  TextSpan(
     
        children: <TextSpan>[
          TextSpan(text: 'You sent a gift to ', style: TextStyle(color: supportTextColor )),
          TextSpan(text: name, style: TextStyle(color: textColor )),
      
        ],
    )
    : TextSpan(
     
        children: <TextSpan>[
          TextSpan(text: '$name ', style: TextStyle(color: textColor )),
          TextSpan(text: 'just send a gift to you.', style: TextStyle(color: supportTextColor )),
      
        ],
    ) ,
  ),
        // title: AppText(
        //   title!,
        //   16,
        //   FontWeight.w500,
        //   textColor,
        //   0,
        //   1.6,
        //   null,
        // ),
        trailing: Image.asset(forwardBtn, width: 24, height: 24),
      ),
    ),
  );
}
