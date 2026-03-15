import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/theme/app_color.dart';
import '../../../gen/assets.gen.dart';

class AuthTextFieldWidget extends StatefulWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.label,
    this.hint,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    required this.disabledIcon,
    required this.enabledIcon,
    this.readOnly = false,
    this.onTap,
  });

  final String label;
  final String? hint;
  final bool isPassword;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget enabledIcon;
  final Widget disabledIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  late final FocusNode _focusNode;
  bool _obscureText = false;
  var _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.isPassword;
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) {
      _hasFocus = _focusNode.hasFocus;
      setState(() {});
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon =
        (widget.controller?.text.trim().isNotEmpty ?? false) || _hasFocus
        ? widget.enabledIcon
        : widget.disabledIcon;

    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        widget.readOnly ? null : _focusNode.requestFocus();
      },
      child: Container(
        height: 67,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.fieldBorderColor, width: 1),
          borderRadius: .circular(60),
        ),
        margin: const .only(bottom: 12),
        padding: const .only(left: 26, right: 12, top: 15, bottom: 15),
        child: Row(
          children: [
            icon,
            Container(
              width: 1,
              height: 17,
              color: .new(0xFFDDDDDD),
              margin: .symmetric(horizontal: 24),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    widget.label,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: .w500,
                      color: AppColor.textFieldLabelColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: TextFormField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      obscureText: _obscureText,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      onChanged: widget.onChanged,
                      validator: widget.validator,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: .w500,
                        color: AppColor.textColor,
                      ),
                      onTap: widget.onTap,
                      readOnly: widget.readOnly,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: AppColor.whiteColor,
                        floatingLabelBehavior: .always,
                        hintText: widget.hint,
                        hintStyle: GoogleFonts.poppins(
                          color: AppColor.textFieldHintColor,
                          fontSize: 12,
                          fontWeight: .w500,
                        ),
                        contentPadding: .zero,
                        suffixIcon: widget.isPassword
                            ? Padding(
                                padding: const .only(right: 26.14),
                                child: TextButton(
                                  onPressed: () {
                                    _obscureText = !_obscureText;
                                    setState(() {});
                                  },
                                  style: TextButton.styleFrom(
                                    padding: .zero,
                                    minimumSize: .zero,
                                    tapTargetSize: .shrinkWrap,
                                  ),
                                  child: Assets.icons.passwordShow.svg(),
                                ),
                              )
                            : null,
                        enabledBorder: .none,
                        focusedBorder: .none,
                        errorBorder: .none,
                        focusedErrorBorder: .none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
