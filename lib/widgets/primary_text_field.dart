import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class PrimaryTextField extends StatelessWidget {
  const new({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.isEnable = true,
    this.validator,
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool obscureText;
  final bool isEnable;
  final TextInputType keyboardType = .text;
  final TextInputAction textInputAction = .next;
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
          controller: controller,
          textInputAction: textInputAction,
          obscureText: obscureText,
          keyboardType: keyboardType,
          enabled: isEnable,
          maxLines: 1,
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
