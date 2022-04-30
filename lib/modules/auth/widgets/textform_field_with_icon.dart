// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:planetx/shared/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planetx/shared/utils/styles.dart';

class TextFormFieldWithIcon extends StatefulWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;

  TextFormFieldWithIcon({this.prefixIcon, this.suffixIcon});

  @override
  _TextFormFieldWithIconState createState() => _TextFormFieldWithIconState();
}

class _TextFormFieldWithIconState extends State<TextFormFieldWithIcon> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        //border: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.sp),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: Color(0xffF3F3F3),
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.sp)),
            borderSide: BorderSide(color: primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.sp)),
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
