import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amaliyot_oxiringi_oy/core/network/dio_client.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/auth_repository.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/user_repository.dart';
import 'package:amaliyot_oxiringi_oy/data/services/auth_api_service.dart';
import 'package:amaliyot_oxiringi_oy/data/services/auth_local_service.dart';
import 'package:amaliyot_oxiringi_oy/data/services/user_service.dart';

final getIt = GetIt.instance;

Future<void> dependencyInit() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);
  getIt.registerLazySingleton(() => DioClient(dio: Dio()));

  // Services
  getIt.registerLazySingleton(() => AuthApiService());
  getIt.registerLazySingleton(() => AuthLocalService());
  getIt.registerLazySingleton(() => UserService());

  // Repositories
  getIt.registerSingleton(
    AuthRepository(
      authApiService: getIt.get<AuthApiService>(),
      authLocalService: getIt.get<AuthLocalService>(),
    ),
  );

  getIt.registerSingleton(
    UserRepository(
      userService: getIt.get<UserService>(),
    ),
  );
}
