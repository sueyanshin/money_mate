import 'package:flutter/material.dart';

extension SnackBarX on BuildContext {
  void showSnackBar(String? message, {Color? backgroundColor}) {
    if (message == null || message.isEmpty) return;
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          behavior: .floating,
          margin: const .fromLTRB(16, 0, 16, 16),
          shape: RoundedRectangleBorder(borderRadius: .circular(12)),
        ),
      );
  }
}
