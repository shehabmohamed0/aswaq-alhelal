import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:root_package/core/resources/assets_manager.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/url_launcher.dart';

import '../cubit/start_up/start_up_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocListener<StartUpCubit, StartUpState>(
      listener: (context, state) {
        if (state is StartUpFinished) {
          Navigator.pushReplacementNamed(context, state.routeName,
              arguments: state.arguments);
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<StartUpCubit, StartUpState>(
            builder: (context, state) {
              if (state is StartupNeedToUpdateTheApp) {
                return Stack(fit: StackFit.expand, children: [
                  const Material(color: Colors.black54),
                  Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(ImageAssets.logoJPG, width: width / 3),
                          const Text(
                            'The version you use is outdated version. We have some cool updates is the store. Please update the app to use it further.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {
                              if (Platform.isAndroid || Platform.isIOS) {
                                final appId = Platform.isAndroid
                                    ? 'com.synamall.aswaqalhelal'
                                    : 'YOUR_IOS_APP_ID';
                                final url = Uri.parse(
                                  Platform.isAndroid
                                      ? "market://details?id=com.snapchat.android"
                                      : "https://apps.apple.com/app/id$appId",
                                );
                                launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            child: const Text(
                              'Update now',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]);
              }
              return LottieBuilder.asset('assets/jsons/splash_animation.json');
            },
          ),
        ),
      ),
    );
  }
}
