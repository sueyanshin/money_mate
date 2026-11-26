import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TransactionType { expense, income }

class CategoryModel extends Equatable {
  final String id;
  final String name;
  // final String subtitle;
  final TransactionType type;
  final int iconCodePoint;
  final int colorValue;
  final bool isDefault;

  const new({
    required this.id,
    required this.name,
    // required this.subtitle,
    required this.type,
    required this.iconCodePoint,
    required this.colorValue,
    required this.isDefault,
  });

  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');
  Color get color => Color(colorValue);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'subtitle': subtitle,
      'type': type.name,
      'iconKey': iconCodePoint,
      'colorHex': colorValue,
      'isDefault': isDefault,
    };
  }

  factory CategoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;

    return CategoryModel(
      id: doc.id,
      name: doc['name'] ?? "",
      // subtitle: doc['subtitle'] ?? "",
      type: TransactionType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => TransactionType.expense,
      ),
      iconCodePoint: data['iconKey'] ?? Icons.category.codePoint,
      colorValue: data['colorHex'] ?? 0xFF6B7280,
      isDefault: data['isDefault'] ?? false,
    );
  }

  CategoryModel copyWith({
    String? id,
    String? name,
    String? subtitle,
    TransactionType? type,
    int? iconCodePoint,
    int? colorValue,
    bool? isDefault,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      // subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      colorValue: colorValue ?? this.colorValue,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    // subtitle,
    type,
    iconCodePoint,
    colorValue,
    isDefault,
  ];
}
