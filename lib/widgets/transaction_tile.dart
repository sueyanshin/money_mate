import 'package:flutter/material.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class TransactionTile extends StatelessWidget {
  const new({super.key, required this.isExpense, required this.icon});
  final bool isExpense;
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
      child: Row(
        mainAxisAlignment: .spaceBetween,
        spacing: 12,
        children: [
          // Icon
          Container(
            padding: .all(12),
            decoration: BoxDecoration(
              borderRadius: .circular(12),
              color: isExpense
                  ? Colors.blue.shade100
                  : Colors.greenAccent.shade100,
            ),
            child: Icon(
              icon,
              size: 20,
              color: isExpense ? Colors.blueGrey : AppColors.primaryDark,
            ),
          ),

          // Label
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Salary.  ',
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                Text(
                  'Work, employee, payment Work, employee, paymentWork, employee, paymentWork, employee, paymentWork, employee, paymentWork, employee, paymentWork, employee, paymentWork, employee, paymentWork, employee, payment',
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
                '+ MMK 1,000,000',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryDark,
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
              Text(
                'Income',
                style: theme.textTheme.bodySmall,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
