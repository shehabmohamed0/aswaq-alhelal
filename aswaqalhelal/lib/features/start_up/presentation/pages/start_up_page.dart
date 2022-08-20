import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../cubit/cubit/start_up_cubit.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartUpCubit>(
      create: (context) => locator()..handleStartUp(),
      child: BlocListener<StartUpCubit, StartUpState>(
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
      ),
    );
  }
}
