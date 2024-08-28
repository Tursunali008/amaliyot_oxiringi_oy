import 'package:amaliyot_oxiringi_oy/core/constants/app_constants.dart';
import 'package:amaliyot_oxiringi_oy/ui/onboarding/view/onboarding_page.dart';
import 'package:amaliyot_oxiringi_oy/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
            image: AssetImage(
              Images.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(),
                  Text(
                    'Meals On\n Demand',
                    style: TextStyles.semiBold.copyWith(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: const OnboardingScreen(),
                          );
                        },
                      ),
                    );
                  },
                  child: const Text("Let's start"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
