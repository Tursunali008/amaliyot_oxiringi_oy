import 'package:amaliyot_oxiringi_oy/bloc/auth_bloc.dart';
import 'package:amaliyot_oxiringi_oy/repository/user_repository.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/auth/login_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      return HomeScreen(); // If token exists, show HomeScreen
    } else {
      return LoginScreen(); // If no token, show WelcomeScreen or LoginScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _getInitialScreen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else {
          return BlocProvider(
            create: (context) => AuthBloc(AuthService(Dio())),
            child: MaterialApp(
              home: snapshot.data,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                textTheme: GoogleFonts.dmSansTextTheme(),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                textTheme: GoogleFonts.dmSansTextTheme(),
              ),
              themeMode: ThemeMode.system,
            ),
          );
        }
      },
    );
  }
}
