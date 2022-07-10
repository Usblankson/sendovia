import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_text.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/space.dart';


Widget giftItem(
  BuildContext context,
   String imageurl,
    String name,
    String desc,
    int rating,
    String lol,
    String price,
) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
  
      children: <Widget>[
        ClipRRect(
                   borderRadius: BorderRadius.circular(12),
                   child: Image.asset(
                     imageurl,
                     fit: BoxFit.cover,
                     width: 160,
                     height: 100,
                   ),
                 ),
                 VSpace(8.h),
        AppText(name, 14.sp, FontWeight.w400, textColor, 0, 1.6, null),
        VSpace(8.h),
        AppText(desc, 12, FontWeight.w400, supportTextColor, 0, 1.6, null),
        VSpace(9.67.h),
        Row(
          children: <Widget>[
            stars(rating, 1),
            stars(rating, 2),
            stars(rating, 3),
            stars(rating, 4),
            stars(rating, 5),
            Text(lol),
          ],
        ),
        VSpace(16.27.h),
        AppText("from \$$price", 14.sp, FontWeight.w500, textColor, 0, 1.6, null)
      ],
    );
  }

  stars(int rating, int index) {
    if (index <= rating) {
      return Icon(
        Icons.star,
        color: Colors.amber,
        size: 13.0,
      );
    } else {
      return Icon(Icons.star, color: Colors.grey, size: 13.0);
    }
  }
//   return ConstrainedBox(
//     constraints: BoxConstraints.expand(height: 300.h, width: 200.w),
    
    
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
    
//       children: <Widget>[
//        ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(
//                       bonton,
//                       fit: BoxFit.cover,
//                       width: 160,
//                       height: 100,
//                     ),
//                   ),
//                    VSpace(8.h),
//         Expanded(child: AppText('The Gift Shop', 14.sp, FontWeight.w400, textColor, 0, 1.6, null)),
//                  VSpace(8.h),
              
//           Expanded(child: AppText("Specialize on different kinds of gifts.", 12, FontWeight.w400, supportTextColor, 0, 1.6, null)),
//         VSpace(16.27.h),
//         Expanded(child: AppText("from \$99", 14.sp, FontWeight.w500, textColor, 0, 1.6, null)),
  
//       ],
//     ),
//   );
// }




