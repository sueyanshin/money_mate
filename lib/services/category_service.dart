import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/core/constants/default_categories.dart';
import 'package:money_mate/models/category_model.dart';

class CategoryService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  new({required this._auth, required this._firestore});

  CollectionReference<Map<String, dynamic>> get _userCategoiesRef {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception("User not authenticated");
    return _firestore.collection("users").doc(uid).collection("categories");
  }

  Stream<List<CategoryModel>> watchCategories() {
    return _userCategoiesRef.snapshots().map((snapshot) {
      final customCategories = snapshot.docs
          .map((doc) => CategoryModel.fromFirestore(doc))
          .toList();
      return [...DefaultCategories.all, ...customCategories];
    });
  }

  Future<void> addCategory({
    required String title,
    required TransactionType type,
    required int iconCodePoint,
    required int colorValue,
  }) async {
    try {
      final docRef = _userCategoiesRef.doc();
      final category = CategoryModel(
        id: docRef.id,
        name: title.trim(),
        type: type,
        iconCodePoint: iconCodePoint,
        colorValue: colorValue,
        isDefault: false,
      );

      await docRef.set(category.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to add category");
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    if (category.isDefault) {
      throw Exception("Default category cannot be edited");
    }
    try {
      await _userCategoiesRef.doc(category.id).update(category.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to update category");
    }
  }

  Future<void> deleteCategory(CategoryModel category) async {
    if (category.isDefault) {
      throw Exception("Default category cannot be deleted");
    }
    try {
      await _userCategoiesRef.doc(category.id).delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to delete category");
    }
  }
}
