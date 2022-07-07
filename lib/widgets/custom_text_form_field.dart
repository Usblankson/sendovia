// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sendovia/utils/spacing.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  String hintText;
  String label;
  Color? labelColor;
  FormFieldValidator? validator;
  Function(String)? onSaved;
  Color? fillingColor;
  bool autofocus;
  bool isEnabled;
  TextInputType? keyboardType;

  int? maxLines;
  TextInputType? textInputType;
  TextEditingController? controller;
  List<TextInputFormatter> ? inputFormatters;

  CustomTextFormField({
    Key? key,
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
              fontSize: 12,
              color: widget.labelColor ?? supportTextColor,
              fontWeight: FontWeight.w400),
        ),
        const YMargin(8),
        TextFormField(
          style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
          enabled: widget.isEnabled, 
          inputFormatters: widget.inputFormatters,
                controller: widget.controller,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          obscuringCharacter: '*',
          keyboardType: widget.textInputType,
          validator: widget.validator,
          decoration: InputDecoration(
            
            errorStyle: const TextStyle(height: 0, color: Colors.red),
            contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.5,
                style: BorderStyle.solid,
              ),
            ),
            fillColor: widget.fillingColor ?? inputFieldColor,
            filled: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle:  TextStyle(
                color: supportTextColor, fontSize: 14, fontWeight: FontWeight.w400),
            focusedBorder:  OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: primaryColor,
                    width: 1.5,
                    style: BorderStyle.solid)),
            enabledBorder:  OutlineInputBorder(
                borderRadius: const BorderRadius.all( Radius.circular(8)),
                borderSide: BorderSide(
                    color: inputFieldColor, width: 1.5, style: BorderStyle.solid)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: Colors.red, width: 1.5, style: BorderStyle.solid)),
          ),
        ),
      ],
    );
  }
}
