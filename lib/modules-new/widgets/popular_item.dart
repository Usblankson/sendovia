import 'package:flutter/material.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/space.dart';



Widget popularItem(
    String image,
    String name,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         
          ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 100,
                    ),
                  ),
                  const VSpace(8),
          AppText(name, 12, FontWeight.w400, textColor, 0, 1.6, null),
        ],
      ),
    );
  }