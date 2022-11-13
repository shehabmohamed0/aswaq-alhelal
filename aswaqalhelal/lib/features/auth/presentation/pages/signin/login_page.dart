import 'package:aswaqalhelal/core/form_inputs/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:aswaqalhelal/locator/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/ensure_visible_when_focused.dart';
import '../../../../../widgets/international_phone_text_field.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../bloc/sign_in/phone_sign_in_form_cubit.dart';
import '../verifiy_phone/widgets/otp_widget.dart';

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
                        previous.verificationCompleted !=
                        current.verificationCompleted,
                    listener: (context, state) {
                      if (state.verificationCompleted) {
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
                          // Todo:
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
                                      'https://sites.google.com/view/aswaq-alhelal/home'),
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
                          Text(
                            intl.verifiyPhoneNumber,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        const SizedBox(height: 8),
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
