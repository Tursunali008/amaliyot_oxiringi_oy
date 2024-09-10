import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:amaliyot_oxiringi_oy/core/network/dio_client.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/auth_repository.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/user_repository.dart';
import 'package:amaliyot_oxiringi_oy/data/services/auth_api_service.dart';
import 'package:amaliyot_oxiringi_oy/data/services/auth_local_service.dart';
import 'package:amaliyot_oxiringi_oy/data/services/user_service.dart';

final getIt = GetIt.instance;

Future<void> dependencyInit() async {
  // Initialize Hive and open the required box
  await Hive.initFlutter();
  await Hive.openBox('authBox'); // Open a Hive box for storing auth data

  // Register Dio client
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
