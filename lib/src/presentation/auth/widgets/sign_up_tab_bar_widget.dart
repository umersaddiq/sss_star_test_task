import 'package:flutter/material.dart';

import '../../../base/theme/app_color.dart';
import '../../../mixins/localization_mixin.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';

class SignUpTabBarWidget extends StatelessWidget {
  const SignUpTabBarWidget({
    required this.currentIndex,
    required this.onTabChanged,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final lang = context.lang;
    return Row(
      mainAxisAlignment: .center,
      children: [
        _TabItemWidget(
          title: lang.emailAddress,
          isActive: currentIndex == 0,
          onTap: () => onTabChanged(0),
        ),
        const SizedBox(width: 25),
        _TabItemWidget(
          title: lang.phoneNumber,
          isActive: currentIndex == 1,
          onTap: () => onTabChanged(1),
        ),
      ],
    );
  }
}

class _TabItemWidget extends StatelessWidget {
  const _TabItemWidget({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: .opaque,
      child: Column(
        mainAxisSize: .min,
        children: [
          SfProText(
            title,
            weight: 700,
            color: isActive ? AppColor.textColor : AppColor.fadeTextColor,
            size: 13,
          ),
          const SizedBox(height: 5),
          Container(
            height: 3,
            width: 35,
            decoration: BoxDecoration(
              color: isActive ? AppColor.blueColor : Colors.transparent,
              borderRadius: .circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
