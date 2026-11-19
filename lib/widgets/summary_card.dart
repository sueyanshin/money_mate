import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class SummaryCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: .symmetric(vertical: 16, horizontal: 26),
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade100.withValues(alpha: 0.4),
        borderRadius: .circular(20),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Container(
            padding: .all(4),
            decoration: BoxDecoration(
              shape: .circle,
              color: Colors.greenAccent.shade200.withValues(alpha: 0.4),
            ),
            child: Icon(
              color: AppColors.primaryDark,
              Icons.arrow_upward_rounded,
            ),
          ),

          Text('Total Income', style: theme.textTheme.labelMedium),
          Text('1000000 MMK', style: theme.textTheme.titleLarge),
          Text('vs 1.07M last month', style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
