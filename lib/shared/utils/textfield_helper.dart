import 'package:flutter/services.dart';

enum KeyboardType { regular, email, number, phone }

TextInputType inputType(KeyboardType textInputType) {
  if (textInputType == KeyboardType.email) {
    return TextInputType.emailAddress;
  }
  if (textInputType == KeyboardType.number ||
      textInputType == KeyboardType.phone) {
    return TextInputType.number;
  }
  return TextInputType.visiblePassword;
}

List<TextInputFormatter> inputFormatter(KeyboardType textInputType) {
  if (textInputType == KeyboardType.number) {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ];
  }
  if (textInputType == KeyboardType.phone) {
    return <TextInputFormatter>[
      LengthLimitingTextInputFormatter(11),
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ];
  }
  return <TextInputFormatter>[];
}
