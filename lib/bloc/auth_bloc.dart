import 'package:amaliyot_oxiringi_oy/logic/repositories/auth_repository.dart';
import 'package:amaliyot_oxiringi_oy/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService, {required AuthRepository authRepository}) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<ForgotPasswordEvent>(_onForgotPassword);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await authService.register(
        event.name,
        event.email,
        event.phone,
        event.password,
        event.passwordConfirmation,
      );

      final token = response.data['token'] ?? '';
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('name', event.name);

      emit(AuthSuccess(response.data['message'] ?? 'Registration successful'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await authService.login(
        event.email,
        event.password,
      );

      final token = response.data['token'] ?? '';
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      
      emit(AuthSuccess(response.data['message'] ?? 'Login successful'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onForgotPassword(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await authService.forgotPassword(event.email);
      emit(
          AuthSuccess(response.data['message'] ?? 'Password reset email sent'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
