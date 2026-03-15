import 'package:flutter/material.dart';

import '../../../base/theme/app_color.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';

class SignUpWithPhoneView extends StatelessWidget {
  const SignUpWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfProText(
        'Sign up With Phone',
        weight: 500,
        color: AppColor.textColor,
      ),
    );
  }
}
