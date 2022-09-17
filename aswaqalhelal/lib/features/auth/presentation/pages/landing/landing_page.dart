import 'package:aswaqalhelal/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_easyloading.dart';

import '../../../../address/presentation/cubit/add_first_address/add_first_address_cubit.dart';
import '../../../../address/presentation/pages/add_first_address/add_first_address_page.dart';
import '../../bloc/app_status/app_bloc.dart';
import '../../bloc/sign_in/phone_sign_in_form_cubit.dart';
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
    return BlocConsumer<AppBloc, AppState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AppStatus.authenticated) {
          context.read<NotificationsBloc>().add(InitNotifications());
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        EasyLoading.dismiss();
        switch (state.status) {
          case AppStatus.authenticated:
            return widget.homePage;
          case AppStatus.unauthenticated:
            return BlocProvider<PhoneSignInFormCubit>(
              create: (context) => locator(),
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
