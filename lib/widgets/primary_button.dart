import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const new({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(label, style: TextStyle(fontWeight: .bold)),
      icon: icon != null ? Icon(icon) : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: foregroundColor ?? AppColors.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: .circular(50)),
      ),
    );
  }
}
