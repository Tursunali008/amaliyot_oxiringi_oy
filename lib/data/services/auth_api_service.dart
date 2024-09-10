import 'package:dio/dio.dart';
import 'package:amaliyot_oxiringi_oy/core/di/di.dart';
import 'package:amaliyot_oxiringi_oy/core/network/dio_client.dart';
import 'package:amaliyot_oxiringi_oy/data/models/auth/auth_response.dart';
import 'package:amaliyot_oxiringi_oy/data/models/auth/login_request.dart';
import 'package:amaliyot_oxiringi_oy/data/models/auth/register_request.dart';
import 'package:amaliyot_oxiringi_oy/data/models/auth/social_login_request.dart';

class AuthApiService {
  final _dio = getIt.get<DioClient>().dio;

  Future<AuthResponse> register(RegisterRequest request) async {
    // dio post so'rovini yuboramiz
    try {
      final response = await _dio.post(
        '/register',
        data: request.toMap(),
      );

      return AuthResponse.fromMap(response.data['data']);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> login(LoginRequest request) async {
    // dio post so'rovini yuboramiz
    try {
      final response = await _dio.post(
        '/login',
        data: request.toMap(),
      );

      return AuthResponse.fromMap(response.data['data']);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> socialLogin(SocialLoginRequest request) async {
    // dio post so'rovini yuboramiz
    try {
      final response = await _dio.post(
        '/login-social',
        data: request.toMap(),
      );

      return AuthResponse.fromMap(response.data['data']);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    // dio post so'rovini yuboramiz
    try {
      await _dio.post('/logout');
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
