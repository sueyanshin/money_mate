import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String fullName;
  final DateTime createdAt;

  new({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
