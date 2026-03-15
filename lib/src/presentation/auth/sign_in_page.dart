import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sss_star_test_task/src/widget/typography/sf_pro_text_widget.dart';

import '../../mixins/localization_mixin.dart';
import '../../widget/form_title_widget.dart';
import 'sign_up_page.dart';
import 'widgets/welcome_widget.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const path = '/sign-in';
  static const name = 'sign-in';

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final lang = context.lang;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const .symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const WelcomeWidget(),
              FormTitleWidget.mobile(title: lang.signIn),
              Text.rich(
                SfProTextSpan(
                  text: lang.goTo,
                  children: [
                    SfProTextSpan(
                      text: ' ${lang.signUp}',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(SignUpPage.name);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
