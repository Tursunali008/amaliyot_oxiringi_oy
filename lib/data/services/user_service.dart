import 'package:dio/dio.dart';
import 'package:amaliyot_oxiringi_oy/core/di/di.dart';
import 'package:amaliyot_oxiringi_oy/core/network/dio_client.dart';
import 'package:amaliyot_oxiringi_oy/data/models/user/user.dart';

class UserService {
  final dio = getIt.get<DioClient>().dio;

  Future<User> getUser() async {
    try {
      final response = await dio.get('/user');

      return User.fromMap(response.data['data']);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
