import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/models/transaction_model.dart';

class TransactionService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  new({required this._firestore, required this._auth});

  CollectionReference<Map<String, dynamic>> get _userTransactionRef {
    final uid = _auth.currentUser?.uid;

    if (uid == null) throw Exception("User not authenticated");

    return _firestore.collection("users").doc(uid).collection("transactions");
  }

  Stream<List<TransactionModel>> getAllTransactions() {
    return _userTransactionRef
        .orderBy("datetime", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TransactionModel.fromFirestore(doc))
              .toList(),
        );
  }

  Future<void> addTransactions(TransactionModel transaction) async {
    try {
      final docRef = _userTransactionRef.doc();
      final newTransaction = transaction.copyWith(id: docRef.id);
      await docRef.set(newTransaction.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to add transaction");
    }
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    try {
      await _userTransactionRef.doc(transaction.id).update(transaction.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to update transaction");
    }
  }

  Future<void> deleteTransaction(TransactionModel transaction) async {
    try {
      await _userTransactionRef.doc(transaction.id).delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to delete transaction");
    }
  }
}
