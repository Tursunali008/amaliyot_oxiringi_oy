import 'dart:async';

import 'package:amaliyot_oxiringi_oy/core/constants/app_constants.dart';
import 'package:amaliyot_oxiringi_oy/core/extensions/extensions.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/auth/login_start_screen.dart';
import 'package:flutter/material.dart';

import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final streamPageController = StreamController<int>.broadcast();
  final List<OnboardingData> pages = [
    OnboardingData(
      title: 'Share Your\nRecipes',
      description:
          'Eiusmod proident ex occaecat fugiat esse pariatur laboris eiusmod labore qui elit aliqua.',
      image: Images.splash1,
    ),
    OnboardingData(
      title: 'Learn to\nCook',
      description:
          'Eiusmod proident ex occaecat fugiat esse pariatur laboris eiusmod labore qui elit aliqua.',
      image: Images.splash2,
    ),
    OnboardingData(
      title: 'Become a\nMaster Chef',
      description:
          'Eiusmod proident ex occaecat fugiat esse pariatur laboris eiusmod labore qui elit aliqua.',
      image: Images.splash3,
    ),
  ];
  Offset scrollOffset = const Offset(0, 0);
  int currentPage = 0;
  @override
  void initState() {
    super.initState();

    streamPageController.sink.add(0);
  }

  @override
  void dispose() {
    streamPageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) async {
          if (details.primaryVelocity! > 0) {
            // previous page
            if (currentPage != 0) {
              currentPage--;
              streamPageController.add(currentPage);
              return;
            }
          } else if (details.primaryVelocity! < 0) {
            // next page
            if (currentPage != pages.length - 1) {
              currentPage++;
              streamPageController.add(currentPage);
              return;
            }

            if (currentPage == pages.length - 1) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: const LoginStartScreen(),
                    );
                  },
                ),
              );
            }
          }
        },
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Stack(
            children: [
              StreamBuilder(
                stream: streamPageController.stream,
                builder: (context, snapshot) {
                  return AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: 1,
                    child: OnboardingPage(
                      data: pages[snapshot.data ?? 0],
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 100,
                  height: 7,
                  margin: const EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.32),
                    borderRadius: BorderRadius.circular(3.5),
                  ),
                  alignment: Alignment.centerLeft,
                  child: StreamBuilder(
                    stream: streamPageController.stream,
                    builder: (context, snapshot) {
                      final width = (snapshot.data ?? 0) + 1;
                      return AnimatedFractionallySizedBox(
                        duration: const Duration(milliseconds: 300),
                        widthFactor: width / pages.length,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(3.5),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(data.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: TextStyles.medium.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.description,
                style: const TextStyle(
                  color: Colors.white,
                ).gordita,
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
