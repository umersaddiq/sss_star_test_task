import 'package:flutter/material.dart';

@immutable
abstract final class AppColor {
  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const Color textColor = .new(0xFF2B2B2C);
  static final Color fadeTextColor = textColor.withValues(alpha: 0.6);
  static const Color grey = .new(0xFF61636F);
  static const Color blueColor = .new(0xFF0079FF);
  static Color fieldBorderColor = .new(0xFF737373).withValues(alpha: 0.1);
  static const Color textFieldLabelColor = .new(0xFFC7C7C7);
  static const Color textFieldHintColor = .new(0xFFE4E4E4);
}
