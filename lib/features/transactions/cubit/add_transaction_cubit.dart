import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/constants/default_categories.dart';
import 'package:money_mate/features/transactions/cubit/add_transaction_state.dart';
import 'package:money_mate/models/category_model.dart';
import 'package:money_mate/models/transaction_model.dart';
import 'package:money_mate/services/transaction_service.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  final TransactionService _transactionService;

  new({required this._transactionService})
    : super(
        AddTransactionState(
          type: TransactionType.expense,
          selectedCategory: DefaultCategories.expense.first,
          dateTime: DateTime.now(),
        ),
      );

  void changeType(TransactionType newType, {CategoryModel? fallbackCategory}) {
    if (state.type == newType) return;

    final defaultCat =
        fallbackCategory ??
        (newType == TransactionType.expense
            ? DefaultCategories.expense.first
            : DefaultCategories.income.first);

    emit(
      state.copyWith(
        type: newType,
        selectedCategory: defaultCat,
        status: AddTransactionStatus.initial,
      ),
    );
  }

  void selectCategory(CategoryModel category) {
    emit(
      state.copyWith(
        selectedCategory: category,
        status: AddTransactionStatus.initial,
      ),
    );
  }

  void changeDateTime(DateTime newDateTime) {
    emit(
      state.copyWith(
        dateTime: newDateTime,
        status: AddTransactionStatus.initial,
      ),
    );
  }

  Future<void> submitTransaction({
    required double amount,
    required String title,
    String? note,
  }) async {
    if (amount < 0) {
      emit(
        state.copyWith(
          status: AddTransactionStatus.failure,
          errorMessage: "Please enter an amount greater than 0",
        ),
      );
    }

    emit(state.copyWith(status: AddTransactionStatus.submitting));

    try {
      final category = state.selectedCategory;
      final transaction = TransactionModel(
        id: '',
        type: state.type,
        amount: amount,
        categoryId: category.id,
        categoryName: category.name,
        categoryIconCode: category.iconCodePoint,
        categoryColorValue: category.colorValue,
        title: title.trim().isEmpty ? category.name : title.trim(),
        dateTime: state.dateTime,
        note: note,
      );

      await _transactionService.addTransactions(transaction);
      emit(state.copyWith(status: AddTransactionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: AddTransactionStatus.failure,
          errorMessage: e.toString().replaceFirst('Exception: ', ""),
        ),
      );
    }
  }
}
