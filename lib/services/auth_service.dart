import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService({required this._firebaseAuth});
  final FirebaseAuth _firebaseAuth;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (_) {
      throw Exception("An unexpected error occurred. Please try again");
    }
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (_) {
      throw Exception("An unexpected error occurred. Please try again");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Exception _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      // Sign-in specific errors
      case 'invalid-credential':
        return Exception('Invalid email or password.');
      case 'user-not-found':
        return Exception('No account found for that email.');
      case 'wrong-password':
        return Exception('Incorrect password provided.');
      case 'user-disabled':
        return Exception('This user account has been disabled.');
      case 'too-many-requests':
        return Exception('Too many failed attempts. Please try again later.');

      // Sign-up & general errors
      case 'weak-password':
        return Exception('The password provided is too weak.');
      case 'email-already-in-use':
        return Exception('An account already exists for that email.');
      case 'invalid-email':
        return Exception('The email address is not valid.');
      case 'operation-not-allowed':
        return Exception('Email/password accounts are not enabled.');
      case 'network-request-failed':
        return Exception('Network error. Please check your connection.');
      default:
        return Exception(e.message ?? 'Authentication failed.');
    }
  }
}
