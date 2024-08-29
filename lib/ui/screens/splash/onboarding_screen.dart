import 'package:amaliyot_oxiringi_oy/ui/screens/splash/choose_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {});
      if (_controller.page == 2) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const CreateAccountScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              final double pageOffset =
                  _controller.hasClients && _controller.position.haveDimensions
                      ? _controller.page ?? 0
                      : 0;
              final double opacity =
                  1 - (pageOffset - index).abs().clamp(0.0, 1.0);
              return AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 500),
                child: buildOnboardingPage(
                  image: 'assets/images/on_${index + 1}.png',
                  title: index == 0
                      ? 'Share Your Recipes'
                      : index == 1
                          ? 'Learn to Cook'
                          : 'Become a Master Chef',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut.',
                ),
              );
            },
          ),
          Positioned(
            bottom: 10.0,
            child: buildPageIndicator(),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(
      {required String image,
      required String title,
      required String description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.1),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator() {
    return SmoothPageIndicator(
      controller: _controller,
      count: 3,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 30.0,
          height: 8.0,
          color: const Color(0xff3FB4B1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        dotDecoration: DotDecoration(
          width: 30.0,
          height: 8.0,
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        spacing: 0.0,
      ),
    );
  }
}
