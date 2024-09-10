import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amaliyot_oxiringi_oy/blocs/auth/auth_bloc.dart';
import 'package:amaliyot_oxiringi_oy/core/core.dart';
import 'package:amaliyot_oxiringi_oy/core/di/di.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/auth_repository.dart';
import 'package:amaliyot_oxiringi_oy/data/repositories/user_repository.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/screens.dart';

import 'package:hive_flutter/hive_flutter.dart';
void main() async {

  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('authBox'); 
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: getIt.get<AuthRepository>(),
              userRepository: getIt.get<UserRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'amaliyot_oxiringi_oy',
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          home: const WelcomeScreen(),
        ),
      ),
    );
  }
}
