import 'package:flutter/widgets.dart';

String? requiredField(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return "Please enter a $fieldName.";
  }

  return null;
}

Container getErrorMessage(String msg) {
  return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 12, top: 9),
      child: Text(
        msg,
        style: const TextStyle(color: Color(0xFFEC4C41), fontSize: 12),
      ));
}
