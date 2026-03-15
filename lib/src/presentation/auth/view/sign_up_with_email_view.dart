import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../base/modals/modals.dart';
import '../../../base/theme/app_color.dart';
import '../../../core/features/auth/domain/provider/sign_up_with_email_and_password_provider.dart';
import '../../../gen/assets.gen.dart';
import '../../../mixins/form_state_mixin.dart';
import '../../../mixins/localization_mixin.dart';
import '../../../widget/typography/sf_pro_text_widget.dart';
import '../../home/home_page.dart';
import '../sign_in_page.dart';
import '../widgets/auth_text_field_widget.dart';

class SignUpWithEmailView extends ConsumerStatefulWidget {
  const SignUpWithEmailView({super.key});

  @override
  ConsumerState<SignUpWithEmailView> createState() =>
      _SignUpWithEmailViewState();
}

class _SignUpWithEmailViewState extends ConsumerState<SignUpWithEmailView>
    with FormStateMixin, LocalizationMixin {
  final TextEditingController _emailController = .new();
  final TextEditingController _userNameController = .new();
  final TextEditingController _birthdayController = .new();
  final TextEditingController _passwordController = .new();
  DateTime? selectDateOfBirth;

  bool get _isValid {
    final email = _emailController.text.trim();
    final username = _userNameController.text.trim();
    final birthday = _birthdayController.text.trim();
    final password = _passwordController.text.trim();

    final isEmailValid = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
    final isUsernameValid = username.isNotEmpty;
    final isBirthdayValid = birthday.isNotEmpty;

    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasSpecialCharacter = RegExp(
      r'[!@#$%^&*(),.?":{}|<>]',
    ).hasMatch(password);
    final isPasswordValid =
        hasNumber && hasLetter && hasSpecialCharacter && password.length >= 8;

    return isEmailValid &&
        isUsernameValid &&
        isBirthdayValid &&
        isPasswordValid;
  }

  void _onFieldChanged() => setState(() {});

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onFieldChanged);
    _userNameController.addListener(_onFieldChanged);
    _birthdayController.addListener(_onFieldChanged);
    _passwordController.addListener(_onFieldChanged);
    _emailController.text = 'umersaddiq49@gmail.com';
    _passwordController.text = 'Umer@1234';
    _userNameController.text = 'Umer Sadiq';
    _birthdayController.text = '14/08/2020';
  }

  @override
  void dispose() {
    _emailController.removeListener(_onFieldChanged);
    _userNameController.removeListener(_onFieldChanged);
    _birthdayController.removeListener(_onFieldChanged);
    _passwordController.removeListener(_onFieldChanged);
    _emailController.dispose();
    _userNameController.dispose();
    _birthdayController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUp = ref.watch(signUpWithEmailAndPasswordProvider);
    final isLoading = signUp == AsyncLoading<String>();
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthTextFieldWidget(
            readOnly: isLoading,
            keyboardType: .emailAddress,
            label: lang.email,
            hint: 'email@example.com',
            controller: _emailController,
            enabledIcon: Assets.icons.emailIconBlued.svg(),
            disabledIcon: Assets.icons.emailIconGreyed.svg(),
          ),
          AuthTextFieldWidget(
            readOnly: isLoading,
            label: lang.username,
            hint: 'JohnApple',
            controller: _userNameController,
            enabledIcon: Assets.icons.usernameIconBlued.svg(),
            disabledIcon: Assets.icons.usernameIconGreyed.svg(),
          ),
          AuthTextFieldWidget(
            label: lang.birthday,
            hint: '14/08/2020',
            controller: _birthdayController,
            enabledIcon: Assets.icons.birthdayIconBlued.svg(),
            disabledIcon: Assets.icons.birthdayIconGreyed.svg(),
            readOnly: true,
            onTap: isLoading ? null : _onBirthdayTap,
          ),
          AuthTextFieldWidget(
            readOnly: isLoading,
            label: lang.password,
            hint: '********',
            controller: _passwordController,
            enabledIcon: Assets.icons.passwordIconBlued.svg(),
            disabledIcon: Assets.icons.passwordIconGreyed.svg(),
            isPassword: true,
          ),
          SfProText(
            lang.passwordValidation,
            textAlign: .center,
            weight: 500,
            size: 11,
            letterSpacing: 1.8,
          ),
          const SizedBox(height: 21),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: .circular(62)),
              backgroundBuilder: (_, states, child) {
                final gradient = <Color>[];
                if (states.contains(WidgetState.disabled)) {
                  gradient.addAll(<Color>[
                    const .new(0xFFE4E4E4),
                    const .new(0xFF808080),
                  ]);
                } else {
                  gradient.addAll(<Color>[
                    const .new(0xFF5AB0FF),
                    const .new(0xFF0079FF),
                  ]);
                }
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: .new(0xFF0079FF).withValues(alpha: .652),
                        offset: const .new(0, 18),
                        blurRadius: 62,
                        spreadRadius: -20,
                      ),
                    ],
                    gradient: LinearGradient(colors: gradient),
                  ),
                  child: child,
                );
              },
              minimumSize: const .fromHeight(75),
            ),
            onPressed: _isValid ? _onSignUp : null,
            child: switch (isLoading) {
              true => CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.whiteColor),
              ),
              false => SfProText(
                lang.next,
                weight: 700,
                color: switch (_isValid) {
                  false => const .new(0xFF5D5D5D),
                  true => const .new(0xFFFFFFFF),
                },
              ),
            },
          ),
          const SizedBox(height: 25),
          RichText(
            text: SfProTextSpan(
              weight: 500,
              size: 12,
              text: lang.alreadyHaveAnAccount,
              children: [
                SfProTextSpan(
                  text: lang.signIn,
                  weight: 700,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.goNamed(SignInPage.name),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSignUp() async {
    if (!_isValid) return;
    try {
      await ref
          .read(signUpWithEmailAndPasswordProvider.notifier)
          .signUpWithEmailAndPassword(
            model: .new(
              email: _emailController.text,
              password: _passwordController.text,
              username: _userNameController.text,
              birthday: _birthdayController.text,
            ),
          );
      if (!mounted) return;
      context.goNamed(HomePage.name);
    } catch (e) {
      ErrorDialog(error: e.toString()).show(context);
    }
  }

  Future<void> _onBirthdayTap() async {
    final result = await showDatePicker(
      helpText: lang.selectDateOfBirth,
      context: context,
      initialDate: selectDateOfBirth ?? DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
    );
    if (result != null) {
      selectDateOfBirth = result;
      _birthdayController.text = DateFormat('dd/MM/yyyy').format(result);
    }
  }
}
