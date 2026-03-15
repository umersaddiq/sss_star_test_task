import 'package:flutter/material.dart';
import 'package:sss_star_test_task/src/widget/typography/sf_pro_text_widget.dart';

class FormTitleWidget extends StatelessWidget {
  const FormTitleWidget.mobile({
    super.key,
    required this.title,
    this.alignment = .center,
    this.padding = const .symmetric(vertical: 12),
    this.size = 14,
  });

  const FormTitleWidget.tab({
    super.key,
    required this.title,
    this.alignment = .center,
    this.padding = const .symmetric(vertical: 12),
    this.size = 16,
  });

  const FormTitleWidget.web({
    super.key,
    required this.title,
    this.alignment = .center,
    this.padding = const .symmetric(vertical: 12),
    this.size = 18,
  });

  final String title;
  final Alignment alignment;
  final EdgeInsets padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: SfProText(title, weight: 600, size: 20),
      ),
    );
  }
}
