import 'package:flutter/material.dart';
import '../../../base/theme/app_color.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    required this.tabController,
    required this.tabs,
    super.key,
  });

  final TabController tabController;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, _) {
        return Row(
          children: List.generate(tabs.length, (index) {
            final isActive = tabController.index == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => tabController.animateTo(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SfProText(
                      tabs[index],
                      weight: 700,
                      size: 16,
                      color: isActive ? AppColor.textColor : AppColor.fadeTextColor,
                    ),
                    const SizedBox(height: 8),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isActive ? AppColor.blueColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
