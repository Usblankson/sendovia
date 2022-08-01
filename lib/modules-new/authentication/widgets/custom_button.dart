// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:planetx/shared/widgets/space.dart';

import '../../../shared/utils/styles.dart';
import '../../../shared/widgets/loader.dart';

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
  final bool isLoading;
  final Widget prefixIcon;

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
    this.isLoading = false, this.prefixIcon,
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
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.h)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0.r),
                    side: BorderSide(color: widget.isActive ? widget.borderColor : Colors.grey))),
            backgroundColor: MaterialStateProperty.all<Color>(
                widget.isActive ? widget.color : Colors.grey)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isLoading
                ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: Loader(radius: 15, color: widget.txtColor,))
                : const SizedBox(),
            widget.isLoading ? HSpace(10.w) : const SizedBox(),
            widget.prefixIcon != null
                ? Container(child: widget.prefixIcon)
                : const SizedBox(),
            widget.prefixIcon != null ? HSpace(10.w) : const SizedBox(),
            Styles.medium(widget.title,
                color: widget.isActive ? widget.txtColor : white,
                fontSize: widget.txtSize ?? 14.sp),
          ],
        )
      ),
    );
  }
}
