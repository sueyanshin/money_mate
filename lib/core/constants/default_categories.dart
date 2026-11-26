import 'package:flutter/material.dart';

import '../../models/category_model.dart';

class DefaultCategories {
  static List<CategoryModel> income = [
    CategoryModel(
      id: 'salary',
      name: 'Salary',
      type: TransactionType.income,
      iconCodePoint: Icons.work.codePoint,
      colorValue: 0xFF10B981,
      isDefault: true,
    ),
    CategoryModel(
      id: 'freelance',
      name: 'Freelance',
      type: TransactionType.income,
      iconCodePoint: Icons.laptop.codePoint,
      colorValue: 0xFF3B82F6,
      isDefault: true,
    ),
    CategoryModel(
      id: 'bonus',
      name: 'Bonus',
      type: TransactionType.income,
      iconCodePoint: Icons.savings.codePoint,
      colorValue: 0xFFF59E0B,
      isDefault: true,
    ),
    CategoryModel(
      id: 'other_income',
      name: 'Other Income',
      type: TransactionType.income,
      iconCodePoint: Icons.wallet.codePoint,
      colorValue: 0xFF8B5CF6,
      isDefault: true,
    ),
  ];

  static List<CategoryModel> expense = [
    CategoryModel(
      id: 'food',
      name: 'Food',
      type: TransactionType.expense,
      iconCodePoint: Icons.restaurant.codePoint,
      colorValue: 0xFFF97316,
      isDefault: true,
    ),
    CategoryModel(
      id: 'transport',
      name: 'Transport',
      type: TransactionType.expense,
      iconCodePoint: Icons.directions_bus.codePoint,
      colorValue: 0xFF3B82F6,
      isDefault: true,
    ),
    CategoryModel(
      id: 'shopping',
      name: 'Shopping',
      type: TransactionType.expense,
      iconCodePoint: Icons.shopping_bag.codePoint,
      colorValue: 0xFFEC4899,
      isDefault: true,
    ),
    CategoryModel(
      id: 'bills',
      name: 'Bills',
      type: TransactionType.expense,
      iconCodePoint: Icons.receipt.codePoint,
      colorValue: 0xFF8B5CF6,
      isDefault: true,
    ),
    CategoryModel(
      id: 'health',
      name: 'Health',
      type: TransactionType.expense,
      iconCodePoint: Icons.health_and_safety.codePoint,
      colorValue: 0xFFEF4444,
      isDefault: true,
    ),
    CategoryModel(
      id: 'entertainment',
      name: 'Entertainment',
      type: TransactionType.expense,
      iconCodePoint: Icons.movie.codePoint,
      colorValue: 0xFF6366F1,
      isDefault: true,
    ),
    CategoryModel(
      id: 'other_expense',
      name: 'Other',
      type: TransactionType.expense,
      iconCodePoint: Icons.more_horiz.codePoint,
      colorValue: 0xFF64748B,
      isDefault: true,
    ),
  ];

  static List<CategoryModel> get all => [...income, ...expense];
}
