import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/core/resources/color_manager.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/url_launcher.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/ensure_visible_when_focused.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../bloc/sign_in/phone_sign_in_form/phone_sign_in_form_cubit.dart';
import '../verifiy_phone/widgets/otp_widget.dart';
import 'sign_in_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();
    final phoneConrtoller = useTextEditingController();
    final focusNode = useFocusNode();
    final textController = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: MultiBlocListener(
                listeners: [
                  BlocListener<PhoneSignInFormCubit, PhoneSignInFormState>(
                    listenWhen: (previous, current) =>
                        previous.verificationSuccess !=
                        current.verificationSuccess,
                    listener: (context, state) {
                      if (state.verificationSuccess) {
                        textController.text = state.otp.value;
                      }
                    },
                  ),
                  BlocListener<PhoneSignInFormCubit, PhoneSignInFormState>(
                    listenWhen: ((previous, current) =>
                        previous.status != current.status),
                    listener: (context, state) {
                      switch (state.status) {
                        case FormzStatus.submissionFailure:
                          showErrorSnackBar(context,
                              state.errorMessage ?? intl.authenticationFailure);

                          break;
                        case FormzStatus.submissionSuccess:
                          break;
                        case FormzStatus.submissionCanceled:
                          showDialog(
                            context: context,
                            builder: (context) => DialogH(
                              btnOkOnPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, Routes.signup,
                                    arguments: phoneConrtoller.text);
                              },
                              btnCancelOnPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );

                          break;
                        default:
                      }
                    },
                  ),
                ],
                child: BlocBuilder<PhoneSignInFormCubit, PhoneSignInFormState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 48),
                        Text(
                          intl.login,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          intl.phoneNumber,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        InternationalPhoneTextField(
                          controller: phoneConrtoller,
                          countries: const ['EG'],
                          errorText: state.phoneNumber.validationMessage,
                          onInputChanged: (phone) => context
                              .read<PhoneSignInFormCubit>()
                              .phoneChanged(phone.phoneNumber!),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: !state.status.isInvalid &&
                                    !state.status.isSubmissionInProgress &&
                                    !state.status.isPure
                                ? context.read<PhoneSignInFormCubit>().verifiy
                                : null,
                            child: state.status.isSubmissionInProgress
                                ? CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  )
                                : Text(
                                    intl.verifiy,
                                    style: TextStyle(letterSpacing: 2),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton.icon(
                            onPressed: () async {
                              if (await launchUrl(
                                  Uri.parse(
                                      'https://aswaqalhelal.godaddysites.com/'),
                                  mode: LaunchMode.externalApplication)) {
                              } else {
                                showErrorSnackBar(context, intl.error);
                              }
                            },
                            icon: Icon(
                              Icons.privacy_tip,
                              color: ColorManager.primary.withBlue(255),
                            ),
                            label: Text(
                              intl.privacyPolicy,
                              style: TextStyle(
                                  color: ColorManager.primary.withBlue(255)),
                            )),
                        // Row(
                        //   children: [
                        //     Text(
                        //       intl.notRegisteredYet,
                        //       style:
                        //           Theme.of(context).textTheme.titleMedium,
                        //     ),
                        //     TextButton(
                        //       style: TextButton.styleFrom(
                        //           visualDensity: VisualDensity.compact),
                        //       onPressed: () {
                        //         Navigator.pushNamed(
                        //             context, Routes.signup);
                        //       },
                        //       child: Text(
                        //         intl.createAnAccount,
                        //         style: TextStyle(
                        //             color: Colors.orange.shade900),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        if (state.codeSent)
                          const Text(
                            'Verifiy phone number',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        SizedBox(height: 8),
                        if (state.codeSent)
                          EnsureVisibleWhenFocused(
                            focusNode: focusNode,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: OTPWidget(
                                controller: textController,
                                focusNode: focusNode,
                                onCompleted: (s) {
                                  context
                                      .read<PhoneSignInFormCubit>()
                                      .signInWithPhoneNumber();
                                  //  onSubmit(bloc);
                                },
                                onChanged: context
                                    .read<PhoneSignInFormCubit>()
                                    .otpChanged,
                              ),
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
