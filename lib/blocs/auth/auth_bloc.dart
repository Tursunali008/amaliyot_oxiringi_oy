import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:amaliyot_oxiringi_oy/data/models/auth/social_login_request.dart';
import 'package:amaliyot_oxiringi_oy/data/models/models.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/auth_repository.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum SocialLoginType { google, facebook }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(InitialAuthState()) {
    on<LoginAuthEvent>(_onLogin);
    on<SocialLoginAuthEvent>(_onSocialLogin);
    on<RegisterAuthEvent>(_onRegister);
    on<LogoutAuthEvent>(_onLogout);
  }

  void _onLogin(LoginAuthEvent event, emit) async {
    emit(LoadingAuthState());

    try {
      await authRepository.login(event.request);
      final user = await userRepository.getUser();

      emit(AuthenticatedAuthState(user: user));
    } catch (e) {
      emit(ErrorAuthState(e.toString()));
    }
  }

  void _onSocialLogin(SocialLoginAuthEvent event, emit) async {
    emit(LoadingAuthState());

    try {
      SocialLoginRequest? request;
      if (event.type == SocialLoginType.google) {
        final googleSignIn = GoogleSignIn(scopes: ['email']);
        final googleAccount = await googleSignIn.signIn();
        if (googleAccount != null) {
          request = SocialLoginRequest(
            email: googleAccount.email,
            name: googleAccount.displayName ?? '',
          );
        } else {
          throw "Tizimga kirishda xatolik, qaytadan o'rinib ko'ring";
        }
      } else if (event.type == SocialLoginType.facebook) {
        final LoginResult result = await FacebookAuth.instance.login(
          permissions: [
            'public_profile',
            'email',
          ],
        );
        if (result.status == LoginStatus.success) {
          final userData = await FacebookAuth.instance.getUserData();
          request = SocialLoginRequest(
            email: userData['email'],
            name: userData['name'] ?? '',
          );
        } else {
          throw "Tizimga kirishda xatolik, qaytadan o'rinib ko'ring";
        }
      }

      if (request != null) {
        await authRepository.socialLogin(request);
        final user = await userRepository.getUser();

        emit(AuthenticatedAuthState(user: user));
      }
    } catch (e) {
      emit(ErrorAuthState(e.toString()));
    }
  }

  void _onRegister(RegisterAuthEvent event, emit) async {
    emit(LoadingAuthState());

    try {
      await authRepository.register(event.request);
      final user = await userRepository.getUser();

      emit(AuthenticatedAuthState(user: user));
    } catch (e) {
      emit(ErrorAuthState(e.toString()));
    }
  }

  void _onLogout(LogoutAuthEvent event, emit) async {
    emit(LoadingAuthState());

    try {
      await authRepository.logout();
      emit(UnAuthenticatedAuthState());
    } catch (e) {
      emit(ErrorAuthState(e.toString()));
    }
  }
}
