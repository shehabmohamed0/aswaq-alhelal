import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:root_package/core/extensions/formz_extesion.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/core/resources/color_manager.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/url_launcher.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../bloc/sign_up/phone_sign_up_verification_cubit.dart';
import '../../bloc/sign_up/sign_up_form/sign_up_form_cubit.dart';
import '../verifiy_phone/verifiy_phone_page.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();

    final phoneNumber = ModalRoute.of(context)!.settings.arguments as String?;
    final phoneController = useTextEditingController();
    final focusNode = useFocusNode();
    context
        .read<SignUpFormCubit>()
        .init(phoneController, focusNode, phoneNumber);

    return Scaffold(
      appBar: AppBar(title: Text(intl.signUp)),
      body: Align(
        alignment: const Alignment(0, -2 / 3),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<SignUpFormCubit, SignUpFormState>(
              listener: (context, state) {
                switch (state.status) {
                  case FormzStatus.submissionFailure:
                    showErrorSnackBar(
                        context, state.errorMessage ?? intl.error);
                    break;
                  case FormzStatus.submissionSuccess:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            BlocProvider<PhoneSignUpVerificationCubit>(
                          create: (context) => locator(),
                          child: VerifiyPhonePage<PhoneSignUpVerificationCubit>(
                            phoneNumber: state.phoneNumber.value,
                            onSubmit: (bloc) {
                              bloc.signUp(
                                  state.name.value,
                                  state.phoneNumber.value,
                                  state.verificationId!);
                            },
                            onSubmmisionSuccess: () {
                              Navigator.popUntil(
                                context,
                                (route) => route.isFirst,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                    break;
                  default:
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intl.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      focusNode: focusNode,
                      onChanged: context.read<SignUpFormCubit>().nameChanged,
                      decoration: InputDecoration(
                          errorText: state.name.validationMessage()),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      intl.phoneNumber,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    InternationalPhoneTextField(
                      controller: phoneController,
                      countries: const ['EG'],
                      errorText: () {
                        return state.phoneNumber.validationMessage();
                      },
                      onInputChanged: (phoneNumber) {
                        context
                            .read<SignUpFormCubit>()
                            .phoneChanged(phoneNumber.phoneNumber!);
                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.status.isButtonValid
                            ? context.read<SignUpFormCubit>().verifiy
                            : null,
                        child: state.status.isSubmissionInProgress
                            ? CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              )
                            : Text(intl.signUp),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: TextButton.icon(
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
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
