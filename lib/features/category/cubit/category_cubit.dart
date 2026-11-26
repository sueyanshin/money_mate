import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/constants/default_categories.dart';
import 'package:money_mate/features/category/cubit/category_state.dart';
import 'package:money_mate/models/category_model.dart';
import 'package:money_mate/services/category_service.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService _categoryService;
  StreamSubscription<List<CategoryModel>>? _subscription;

  new({required this._categoryService})
    : super(CategoryLoaded(DefaultCategories.all));

  void listenCategories() {
    emit(CategoryLoading());
    _subscription?.cancel();
    _subscription = _categoryService.watchCategories().listen(
      (categories) => emit(CategoryLoaded(categories)),
      onError: (e) =>
          emit(CategoryError(e.toString().replaceFirst('Exception: ', ''))),
    );
  }

  Future<void> addCategory({
    required String title,
    required TransactionType type,
    required int iconCodePoint,
    required int colorValue,
  }) async {
    try {
      await _categoryService.addCategory(
        title: title,
        type: type,
        iconCodePoint: iconCodePoint,
        colorValue: colorValue,
      );
    } catch (e) {
      emit(CategoryError(e.toString().replaceFirst("Exception: ", "")));
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    try {
      await _categoryService.updateCategory(category);
    } catch (e) {
      emit(CategoryError(e.toString().replaceFirst("Exception: ", "")));
    }
  }

  Future<void> deleteCategory(CategoryModel category) async {
    try {
      await _categoryService.deleteCategory(category);
    } catch (e) {
      emit(CategoryError(e.toString().replaceFirst("Exception: ", "")));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
