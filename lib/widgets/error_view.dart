import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class ErrorView extends StatelessWidget {
  const new({super.key, this.errorMessage, this.errorTitle});
  final String? errorMessage;
  final String? errorTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 8,
          children: [
            Icon(Icons.error_outline, color: AppColors.expense, size: 60),
            Text(
              errorTitle ?? "Something went wrong",
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 20),
            ),
            Text(errorMessage ?? "Try again!", textAlign: .center),
          ],
        ),
      ),
    );
  }
}
