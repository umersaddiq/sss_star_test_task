import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../base/theme/app_color.dart';
import '../../mixins/form_state_mixin.dart';
import '../../mixins/localization_mixin.dart';
import '../../widget/back_button_widget.dart';
import '../../widget/typography/sf_pro_text_widget.dart';
import 'view/sign_up_with_email_view.dart';
import 'view/sign_up_with_phone_view.dart';
import 'widgets/sign_up_tab_bar_widget.dart';
import 'widgets/welcome_widget.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/sign-up';
  static const name = 'sign-up';

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage>
    with FormStateMixin, LocalizationMixin {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    return Scaffold(
      body: Padding(
        padding: .fromLTRB(28, padding.top + 44, 28, padding.bottom),
        child: Column(
          children: [
            Align(
              alignment: .centerLeft,
              child: const BackButtonWidget.signUp(),
            ),
            const SizedBox(height: 16),
            const WelcomeWidget(),
            Padding(
              padding: const .only(top: 18, bottom: 34, left: 25, right: 25),
              child: Text.rich(
                textAlign: .center,
                SfProTextSpan(
                  letterSpacing: 1.8,

                  text: lang.pleaseCompleteTheRequirdInformation,
                  weight: 500,
                  color: AppColor.grey,
                  children: [
                    SfProTextSpan(
                      text: lang.next,
                      weight: 800,
                      color: AppColor.grey,
                    ),
                    SfProTextSpan(
                      text: lang.button,
                      weight: 500,
                      color: AppColor.grey,
                    ),
                  ],
                ),
              ),
            ),
            SignUpTabBarWidget(
              currentIndex: _currentIndex,
              onTabChanged: (index) {
                _currentIndex = index;
                setState(() {});
              },
            ),
            const SizedBox(height: 41),
            Expanded(
              child: switch (_currentIndex) {
                0 => const SignUpWithEmailView(),
                1 => const SignUpWithPhoneView(),
                _ => const SizedBox.shrink(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
