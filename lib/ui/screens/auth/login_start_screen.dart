import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amaliyot_oxiringi_oy/blocs/auth/auth_bloc.dart';
import 'package:amaliyot_oxiringi_oy/core/core.dart';
import 'package:amaliyot_oxiringi_oy/core/extensions/extensions.dart';
import 'package:amaliyot_oxiringi_oy/core/helpers/dialogs.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/auth/login_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/auth/register_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/home/home_screen.dart';

class LoginStartScreen extends StatelessWidget {
  const LoginStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          AppDialogs.showLoading(context);
        } else {
          AppDialogs.hideLoading(context);
        }

        if (state is AuthenticatedAuthState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }),
            (route) => false,
          );
        }

        if (state is ErrorAuthState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 538.h,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Images.loginBg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create an\nAccount",
                        style: TextStyles.medium.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur  elit, sed do eiusmod tempor incididunt ut.",
                        style: const TextStyle(
                          color: Colors.white,
                        ).gordita,
                      ),
                      const SizedBox(height: 45),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.email_outlined,
                        size: 20,
                      ),
                      label: const Text("Register using email"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary22Opacity,
                            elevation: 0,
                          ),
                          onPressed: () async {
                            // google sign in
                            context.read<AuthBloc>().add(
                                SocialLoginAuthEvent(SocialLoginType.google));
                          },
                          child: SvgPicture.asset(Images.google),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary22Opacity,
                            elevation: 0,
                          ),
                          onPressed: () {
                            // facebook sign in
                            context.read<AuthBloc>().add(
                                SocialLoginAuthEvent(SocialLoginType.facebook));
                          },
                          child: SvgPicture.asset(Images.apple),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Login",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to login screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
