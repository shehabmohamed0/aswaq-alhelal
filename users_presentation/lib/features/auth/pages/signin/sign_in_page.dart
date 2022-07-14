import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:root_package/core/resources/constants_manager.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/root_package.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/password_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../l10n/l10n.dart';
import '../../bloc/sign_in/email_sign_in_form/email_sign_in_form_cubit.dart';
import '../../bloc/sign_in/login_form_selection/login_form_selection_cubit.dart';
import '../../bloc/sign_in/phone_sign_in_form/phone_sign_in_form_cubit.dart';
import '../../bloc/sign_in/phone_sign_in_form/phone_sign_in_verification_cubit.dart';
import '../verifiy_phone/verifiy_phone_page.dart';
import 'widgets/toggle_buttons.dart';

part 'widgets/email_sign_in_form.dart';
part 'widgets/phone_sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SignInPage());

  @override
  Widget build(BuildContext context) {
    final intl = locator<UsersPresentationLocalizations>();

    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? context.read<LocaleCubit>().toEnglish()
                      : context.read<LocaleCubit>().toArabic();
                },
                icon: Icon(Icons.language),
                label: Text(Localizations.localeOf(context).languageCode == 'ar'
                    ? 'English'
                    : 'العربية')),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    intl.loginAccount,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constrains) {
                    return ToggleButton(
                      width: constrains.maxWidth,
                      height: 50.0,
                      toggleBackgroundColor: const Color(0xffF6F5FA),
                      toggleBorderColor: Colors.grey[350]!,
                      toggleColor: Colors.white,
                      inActiveTextColor: Colors.grey,
                      activeTextColor: Colors.black54,
                      leftDescription: intl.email,
                      rightDescription: intl.phoneNumber,
                      onLeftToggleActive: () {
                        context
                            .read<LoginFormSelectionCubit>()
                            .showEmaileForm();
                        context.read<PhoneSignInFormCubit>().reset();
                      },
                      onRightToggleActive: () {
                        context.read<LoginFormSelectionCubit>().showPhoneForm();
                        context.read<EmailSignInFormCubit>().reset();
                      },
                    );
                  },
                ),
                BlocConsumer<LoginFormSelectionCubit, LoginFormSelectionState>(
                  listener: (context, state) {
                    if (state is LoginFormEmail) {
                    } else if (state is LoginFormPhone) {}
                  },
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: AppConstants.duration200ms,
                      child: state is LoginFormPhone
                          ? const SizedBox(
                              key: Key('1'),
                              height: 400,
                              child: PhoneSignInForm(),
                            )
                          : const SizedBox(
                              key: Key('2'),
                              height: 400,
                              child: EmailSignInForm(),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
