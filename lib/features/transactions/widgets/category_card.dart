import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/theme/app_colors.dart';
import 'package:money_mate/features/transactions/cubit/add_transaction_cubit.dart';
import 'package:money_mate/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const new({
    super.key,
    required this.category,
    required this.isSelected,
    required this.theme,
  });

  final CategoryModel category;
  final bool isSelected;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: .circular(20),
      onTap: () {
        context.read<AddTransactionCubit>().selectCategory(category);
      },
      child: AnimatedContainer(
        // width: 120,
        alignment: .center,
        duration: Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          color: isSelected
              ? AppColors.primaryMintAccent.withValues(alpha: 0.15)
              : Colors.white,
          border: .all(
            color: isSelected ? AppColors.primary : AppColors.textMuted,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          spacing: 8,
          children: [
            Container(
              padding: .all(8),
              decoration: BoxDecoration(
                // color: Colors.white,
                color: Color(category.colorValue).withValues(alpha: 0.15),

                borderRadius: .circular(20),
              ),
              child: Icon(
                category.icon,
                // color: AppColors.primary,
                color: Color(category.colorValue),
              ),
            ),
            Text(
              category.name,
              maxLines: 2,
              overflow: .ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? .bold : .w500,
                color: isSelected
                    ? theme.colorScheme.onPrimaryContainer
                    : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
