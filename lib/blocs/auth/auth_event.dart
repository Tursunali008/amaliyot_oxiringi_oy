part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class LoginAuthEvent extends AuthEvent {
  final LoginRequest request;

  LoginAuthEvent({required this.request});
}

final class RegisterAuthEvent extends AuthEvent {
  final RegisterRequest request;

  RegisterAuthEvent({required this.request});
}

final class SocialLoginAuthEvent extends AuthEvent {
  final SocialLoginType type;

  SocialLoginAuthEvent(this.type);
}

final class LogoutAuthEvent extends AuthEvent {}
