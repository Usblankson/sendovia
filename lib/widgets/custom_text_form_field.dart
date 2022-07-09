// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:sendovia/utils/space.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  String hintText;
  String label;
  Color labelColor;
  FormFieldValidator validator;
  Function(String) onSaved;
  Color fillingColor;
  bool autofocus;
  bool isEnabled;
  TextInputType keyboardType;

  int maxLines;
  TextInputType textInputType;
  TextEditingController controller;
  List<TextInputFormatter>  inputFormatters;

  CustomTextFormField({
    Key key,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.label = '',
    this.labelColor,
    this.fillingColor,
    this.hintText = '',
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onSaved,
    this.autofocus = false,
    this.isEnabled = true,
    this.keyboardType,
    this.inputFormatters,
    
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontSize: 12.sp,
              color: widget.labelColor ?? supportTextColor,
              fontWeight: FontWeight.w400),
        ),
         VSpace(8.h),
        TextFormField(
          style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
          enabled: widget.isEnabled, 
          inputFormatters: widget.inputFormatters,
                controller: widget.controller,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          obscuringCharacter: '*',
          keyboardType: widget.textInputType,
          validator: widget.validator,
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0.h, color: Colors.red),
            contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 20.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.5.w,
                style: BorderStyle.solid,
              ),
            ),
            fillColor: widget.fillingColor ?? inputFieldColor,
            filled: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle:  TextStyle(
                color: supportTextColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
            focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                    color: primaryColor,
                    width: 1.5.w,
                    style: BorderStyle.solid)),
            enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all( Radius.circular(8.r)),
                borderSide: BorderSide(
                    color: inputFieldColor, width: 1.5.w, style: BorderStyle.solid)),
            errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                borderSide: BorderSide(
                    color: Colors.red, width: 1.5.w, style: BorderStyle.solid)),
          ),
        ),
      ],
    );
  }
}
