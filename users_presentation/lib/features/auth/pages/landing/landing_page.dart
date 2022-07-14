import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root_package/locator/locator.dart';

import '../../bloc/app_status/app_bloc.dart';
import '../../bloc/sign_in/email_sign_in_form/email_sign_in_form_cubit.dart';
import '../../bloc/sign_in/login_form_selection/login_form_selection_cubit.dart';
import '../../bloc/sign_in/phone_sign_in_form/phone_sign_in_form_cubit.dart';
import '../signin/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
    required this.homePage,
  }) : super(key: key);
  final Widget homePage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        switch (state.status) {
          case AppStatus.authenticated:
            return homePage;
          case AppStatus.unauthenticated:
            return MultiBlocProvider(
              providers: [
                BlocProvider<LoginFormSelectionCubit>(
                  create: (context) => locator(),
                ),
                BlocProvider<PhoneSignInFormCubit>(
                  create: (context) => locator(),
                ),
                BlocProvider<EmailSignInFormCubit>(
                  create: (context) => locator(),
                ),
              ],
              child: const SignInPage(),
            );
          case AppStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
