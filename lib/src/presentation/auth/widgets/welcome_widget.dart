import 'package:flutter/material.dart';

import '../../../mixins/localization_mixin.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfProText(context.lang.welcome, weight: 700, size: 34);
  }
}
