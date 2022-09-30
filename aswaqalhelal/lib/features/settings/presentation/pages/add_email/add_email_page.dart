import 'package:aswaqalhelal/features/auth/domain/entities/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:root_package/core/extensions/formz_extesion.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/custom_text_field.dart';
import 'package:root_package/widgets/password_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../../auth/presentation/pages/verifiy_phone/verifiy_phone_page.dart';
import '../../bloc/add_email/add_email_cubit.dart';
import '../../bloc/add_email/add_email_verification_cubit.dart';

class LinkEmailAndPasswordPage extends StatelessWidget {
  const LinkEmailAndPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =
        context.select((AppBloc bloc) => bloc.state.profile) as UserProfile;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Email'),
        elevation: 0,
      ),
      body: BlocConsumer<LinkEmailAndPasswordCubit, LinkEmailAndPasswordState>(
        listener: (context, state) {
          switch (state.status) {
            case FormzStatus.submissionSuccess:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider<AddEmailVerificationCubit>(
                    create: (context) => locator(),
                    child: VerifiyPhonePage<AddEmailVerificationCubit>(
                      phoneNumber: user.phoneNumber,
                      onSubmit: (bloc) {
                        bloc.linkEmailAndPassword(state.email.value,
                            state.password.value, state.verificationId!);
                      },
                      onSubmmisionSuccess: () {
                        Navigator.popUntil(
                            context,
                            (route) =>
                                route.settings.name == Routes.accountInfo);
                        showSuccessSnackBar(
                            context, 'Email has been added successfully.');
                      },
                    ),
                  ),
                ),
              );
              break;
            case FormzStatus.submissionFailure:
              showErrorSnackBar(context,
                  state.errorMessage ?? 'Error while adding the email.');
              break;
            case FormzStatus.submissionCanceled:
              showErrorSnackBar(context,
                  state.errorMessage ?? 'Error while adding the email.');

              break;
            default:
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: 'Email',
                  onChanged:
                      context.read<LinkEmailAndPasswordCubit>().emailChanged,
                  errorText: state.email.validationMessage,
                ),
                const SizedBox(height: 8),
                PasswordTextField(
                    labelText: 'Password',
                    onChanged: context
                        .read<LinkEmailAndPasswordCubit>()
                        .passwordChanged,
                    errorText: state.password.validationMessage),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: state.status.isButtonValid
                      ? () => context
                          .read<LinkEmailAndPasswordCubit>()
                          .verifiy(user.phoneNumber)
                      : null,
                  child: state.status.isSubmissionInProgress
                      ? CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        )
                      : const Text('Add'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
