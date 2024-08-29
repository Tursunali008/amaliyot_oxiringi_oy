import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio) {
    _dio.options.baseUrl = 'http://recipe.flutterwithakmaljon.uz/api';
  }

  Future<Response> register(String name, String email, String phone,
      String password, String passwordConfirmation) async {
    try {
      final response = await _dio.post(
        '/register',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to register: ${e.response?.data}');
    }
  }

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to login: ${e.response?.data}');
    }
  }

  Future<Response> forgotPassword(String email) async {
    try {
      final response = await _dio.post(
        '/forgot_password',
        data: {
          'email': email,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to reset password: ${e.response?.data}');
    }
  }
}
