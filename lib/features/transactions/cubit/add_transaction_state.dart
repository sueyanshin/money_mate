import 'package:equatable/equatable.dart';
import 'package:money_mate/models/category_model.dart';

enum AddTransactionStatus { initial, submitting, success, failure }

class AddTransactionState extends Equatable {
  final TransactionType type;
  final CategoryModel selectedCategory;
  final DateTime dateTime;
  final AddTransactionStatus status;
  final String? errorMessage;

  new({
    required this.type,
    required this.selectedCategory,
    required this.dateTime,
    this.status = AddTransactionStatus.initial,
    this.errorMessage,
  });

  AddTransactionState copyWith({
    TransactionType? type,
    CategoryModel? selectedCategory,
    DateTime? dateTime,
    AddTransactionStatus? status,
    String? errorMessage,
  }) {
    return AddTransactionState(
      type: type ?? this.type,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    type,
    selectedCategory,
    dateTime,
    status,
    errorMessage,
  ];
}
