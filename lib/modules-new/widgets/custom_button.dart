// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../utils/colors.dart';

class CustomButton extends StatefulWidget {
  final Widget icon;
  final String title;
  final Function() onPress;
  final Color color;
  final Color txtColor;
  final Color borderColor;
  final double width;
  final double height;
  final bool hasElevation;
  final double txtSize;
  final bool isActive;

  const CustomButton({
    Key key,
    this.icon,
    this.title,
    this.onPress,
    this.color,
    this.txtColor,
    this.borderColor = const Color(0XFFFFFFFF),
    this.txtSize,
    this.width,
    this.height,
    this.isActive,
    this.hasElevation = false,
  }) : super(key: key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
  
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
     
      ),
      width: widget.width ?? double.infinity.w, //321.w, //double.infinity,
      height: widget.height ?? 48.h,
      child: ElevatedButton(
       
        onPressed: widget.isActive ? widget.onPress : () {},
        style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return widget.hasElevation ? 2.sp : 0.sp;
              },
            ),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 12.h)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0.r),
                    side: BorderSide(color: widget.borderColor))),
            backgroundColor: MaterialStateProperty.all<Color>(
                widget.isActive ? widget.color : Colors.grey)),
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.isActive
                  ? widget.txtColor ?? white
                  : const Color.fromARGB(255, 18, 24, 34),
              fontSize: widget.txtSize ?? 16.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
