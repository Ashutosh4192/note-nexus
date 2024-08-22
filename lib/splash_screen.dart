import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_nexus/bottom_nav.dart';
import 'package:note_nexus/feature_home/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset(
          "assets/animation/Animation - 1722664313706.json",
        ),
      ),
      animationDuration: const Duration(milliseconds: 2000),
      nextScreen: kIsWeb ? const HomePage() : const BottomNav(),
      // nextScreen: kIsWeb ? const HomePage() : const Scaffold(),
      splashIconSize: size.height * 0.6,
    );
  }
}
