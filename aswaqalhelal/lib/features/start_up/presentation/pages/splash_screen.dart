import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../cubit/start_up/start_up_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartUpCubit, StartUpState>(
      listener: (context, state) {
        if (state is StartUpOnboarding) {
          Navigator.pushReplacementNamed(context, Routes.onboarding);
        } else {
          Navigator.pushReplacementNamed(context, Routes.landingPage);
        }
      },
      child: Scaffold(
        body: Center(
          child: LottieBuilder.asset('assets/jsons/splash_animation.json'),
        ),
      ),
    );
  }
}
