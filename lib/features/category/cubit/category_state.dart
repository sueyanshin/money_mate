import 'package:equatable/equatable.dart';
import 'package:money_mate/models/category_model.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> allCategories;
  const CategoryLoaded(this.allCategories);

  List<CategoryModel> get expenseCategories =>
      allCategories.where((c) => c.type == TransactionType.expense).toList();
  List<CategoryModel> get incomeCategories =>
      allCategories.where((c) => c.type == TransactionType.income).toList();

  @override
  List<Object?> get props => [allCategories];
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
