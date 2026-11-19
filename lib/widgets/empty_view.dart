import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class EmptyView extends StatelessWidget {
  const new({super.key});

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
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: .circular(50),
              ),
              child: Icon(
                Icons.money_off_rounded,
                color: AppColors.onPrimary,
                size: 60,
              ),
            ),
            Text(
              "No transactions yet",
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 20),
            ),
            Text(
              "You haven't recorded any expenses or income. Keep your finances clear and organized by adding your first record.",
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
