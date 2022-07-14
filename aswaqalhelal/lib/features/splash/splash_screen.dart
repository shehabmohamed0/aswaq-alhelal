import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:root_package/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2500)).then((_) {
      Navigator.pushReplacementNamed(context, Routes.landingPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('assets/jsons/splash_animation.json'),
      ),
    );
  }
}
