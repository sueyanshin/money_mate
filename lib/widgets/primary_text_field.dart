import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class PrimaryTextField extends StatelessWidget {
  const new({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.isEnable = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.validator,
    this.keyboardType = .text,
    this.textInputAction = .next,
    this.onTap,
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool obscureText;
  final bool isEnable;
  final int maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.textMuted, fontWeight: .w600),
        ),
        TextFormField(
          onTap: onTap,
          controller: controller,
          textInputAction: textInputAction,
          obscureText: obscureText,
          keyboardType: keyboardType,
          enabled: isEnable,
          maxLines: maxLines,
          readOnly: readOnly,
          decoration: InputDecoration(
            floatingLabelBehavior: .always,
            floatingLabelAlignment: .start,

            floatingLabelStyle: TextStyle(fontSize: 20),
            prefixIcon: prefixIcon == null
                ? null
                : Icon(prefixIcon!, color: AppColors.textMuted),
            suffixIcon: suffixIcon,
            hintText: hint,
            fillColor: Colors.blue.shade200.withValues(alpha: 0.2),
            border: OutlineInputBorder(
              borderSide: .none,
              borderRadius: .circular(18),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: .none,
              borderRadius: .circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: .none,
              borderRadius: .circular(18),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
