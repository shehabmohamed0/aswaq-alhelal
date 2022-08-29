import 'package:aswaqalhelal/features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import '../../../../address/presentation/pages/add_first_address/add_first_address_page.dart';
import '../../bloc/app_status/app_bloc.dart';
import '../../bloc/sign_in/email_sign_in_form/email_sign_in_form_cubit.dart';
import '../../bloc/sign_in/login_form_selection/login_form_selection_cubit.dart';
import '../../bloc/sign_in/phone_sign_in_form/phone_sign_in_form_cubit.dart';
import '../signin/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.homePage,
  }) : super(key: key);
  final Widget homePage;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        EasyLoading.dismiss();
        switch (state.status) {
          case AppStatus.authenticated:
            return widget.homePage;
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
              child: const LoginPage(),
            );
          case AppStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case AppStatus.authenticatedWithoutAddress:
            return BlocProvider<AddFirstAddressCubit>(
              create: (context) => locator(),
              child: const AddFirstAddressPage(),
            );
        }
      },
    );
  }
}
