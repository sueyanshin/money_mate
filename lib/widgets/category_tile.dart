import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class CategoryTile extends StatelessWidget {
  const new({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: .symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        border: Border(bottom: BorderSide(width: 0.1)),
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            spacing: 12,
            children: [
              // Category Icon
              Image.asset("assets/images/food-icon.png", width: 50),

              // Label
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Food and Drinking',
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    Text(
                      '38 Transactions',
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ),

              // Amount
              Column(
                crossAxisAlignment: .end,
                children: [
                  Text(
                    'MMK 1,000,000',
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: .w800,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  Text(
                    '40%',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.categoryFood,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ],
          ),
          LinearProgressIndicator(
            value: 0.4,
            minHeight: 7,
            borderRadius: .circular(20),
            color: Colors.orange,
            backgroundColor: Colors.blue.shade200.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
