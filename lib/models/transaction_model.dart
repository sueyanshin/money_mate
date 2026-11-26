import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/models/category_model.dart';

class TransactionModel {
  final String id;
  final TransactionType type;
  final double amount;
  final String categoryId;
  final String categoryName;
  final int categoryIconCode;
  final int categoryColorValue;
  final String title;
  final DateTime dateTime;
  final String? note;

  new({
    required this.id,
    required this.type,
    required this.amount,
    required this.categoryId,
    required this.categoryName,
    required this.categoryIconCode,
    required this.categoryColorValue,
    required this.title,
    required this.dateTime,
    this.note,
  });
  IconData get categoryIcon =>
      IconData(categoryIconCode, fontFamily: 'MaterialIcons');
  Color get categoryColor => Color(categoryColorValue);
  bool get isExpense => type == TransactionType.expense;

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'amount': amount,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'categoryIconCode': categoryIconCode,
      'categoryColorValue': categoryColorValue,
      'title': title.trim(),
      'dateTime': Timestamp.fromDate(dateTime),
      'note': (note != null && note!.trim().isNotEmpty) ? note!.trim() : null,
    };
  }

  factory TransactionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;
    return TransactionModel(
      id: doc.id,
      type: TransactionType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => TransactionType.expense,
      ),
      amount: (data['amount'] as num?)?.toDouble() ?? 0.0,
      categoryId: data['categoryId'] ?? '',
      categoryName: data['categoryName'] ?? 'Other',
      categoryIconCode: data['categoryIconCode'] ?? Icons.category.codePoint,
      categoryColorValue: data['categoryColorValue'] ?? 0xFF6B7280,
      title: data['title'] ?? '',
      dateTime: (data['dateTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
      note: data['note'],
    );
  }

  TransactionModel copyWith({
    String? id,
    TransactionType? type,
    double? amount,
    String? categoryId,
    String? categoryName,
    int? categoryIconCode,
    int? categoryColorValue,
    String? title,
    DateTime? dateTime,
    String? note,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      categoryIconCode: categoryIconCode ?? this.categoryIconCode,
      categoryColorValue: categoryColorValue ?? this.categoryColorValue,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      note: note ?? this.note,
    );
  }

  @override
  List<Object?> get props => [
    id,
    type,
    amount,
    categoryId,
    categoryName,
    categoryIconCode,
    categoryColorValue,
    title,
    dateTime,
    note,
  ];
}
