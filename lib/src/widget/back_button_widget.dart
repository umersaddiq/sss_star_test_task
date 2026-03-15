import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base/theme/app_color.dart';
import '../presentation/auth/sign_in_page.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key}) : _isForSignUp = false;

  const BackButtonWidget.signUp({super.key}) : _isForSignUp = true;

  final bool _isForSignUp;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: .shrinkWrap,
        minimumSize: .zero,
        padding: .zero,
      ),
      onPressed: () {
        if (_isForSignUp) {
          context.goNamed(SignInPage.name);
          return;
        }
        if (context.canPop()) {
          context.pop();
        }
      },
      child: const Icon(Icons.arrow_back_ios, color: AppColor.blackColor),
    );
  }
}
