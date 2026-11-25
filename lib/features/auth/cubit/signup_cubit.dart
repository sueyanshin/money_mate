import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/features/auth/cubit/signup_state.dart';
import 'package:money_mate/models/user_model.dart';
import 'package:money_mate/services/auth_service.dart';
import 'package:money_mate/services/user_service.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthService _authService;
  final UserService _userService;

  SignUpCubit({required this._authService, required this._userService})
    : super(SignUpInitial());

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      final credential = await _authService.signUp(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        emit(const SignUpFailure("Failed to retrieve user detials."));
        return;
      }

      final newUser = UserModel(
        uid: firebaseUser.uid,
        email: email.trim(),
        fullName: fullName,
        createdAt: DateTime.now(),
      );
      await _userService.createUserProfile(newUser);
      emit(SignUpSuccess(firebaseUser));
    } catch (e) {
      emit(SignUpFailure(e.toString().replaceFirst('Exception: ', "")));
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
