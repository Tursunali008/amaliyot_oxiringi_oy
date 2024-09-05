import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amaliyot_oxiringi_oy/logic/blocs/auth/auth_bloc.dart';
import 'package:amaliyot_oxiringi_oy/logic/repositories/auth_repository.dart';
import 'package:amaliyot_oxiringi_oy/logic/services/auth_service.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/country_select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
              authRepository: AuthRepository(authService: AuthService())),
        ),
      ],
      child: MaterialApp(
        home: const CountrySelectionScreen(),
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
}
