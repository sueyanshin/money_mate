import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/features/auth/cubit/login_state.dart';
import 'package:money_mate/services/auth_service.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit({required this._authService}) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final credential = await _authService.login(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        emit(LoginSuccess(credential.user!));
      } else {
        emit(const LoginFailure("Failed to retrieve user details"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
