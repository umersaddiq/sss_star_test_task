import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../base/theme/app_color.dart';
import '../../gen/fonts.gen.dart';

class SfProText extends Text {
  SfProText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color color = AppColor.textColor,
    double? height,
    double? letterSpacing,
    double size = 14,
    double weight = 400,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
         style: TextStyle(
           fontFamily: FontFamily.sfPro,
           color: color,
           fontSize: size,
           height: height,
           overflow: textOverflow,
           decoration: decoration,
           decorationColor: color,
           letterSpacing: letterSpacing,
           fontVariations: [FontVariation.weight(weight)],
         ),
       );
}

class SfProTextSpan extends TextSpan {
  SfProTextSpan({
    super.text,
    super.children,
    super.recognizer,
    Color color = AppColor.textColor,
    double? height,
    double size = 14,
    double weight = 400,
    double? letterSpacing,
    TextDecoration? decoration,
  }) : super(
         style: TextStyle(
           fontFamily: FontFamily.sfPro,
           color: color,
           fontSize: size,
           height: height,
           letterSpacing: letterSpacing,
           decoration: decoration,
           decorationColor: color,
           fontVariations: [FontVariation.weight(weight)],
         ),
       );
}
