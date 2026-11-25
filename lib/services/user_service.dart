import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mate/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore;

  UserService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createUserProfile(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.uid).set(user.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to save user profile');
    }
  }
}
