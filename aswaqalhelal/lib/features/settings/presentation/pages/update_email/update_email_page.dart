import 'package:aswaqalhelal/core/extensions/formz_extesion.dart';
import 'package:aswaqalhelal/features/auth/domain/entities/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:aswaqalhelal/core/form_inputs/email.dart';
import 'package:aswaqalhelal/core/form_inputs/password.dart';
import 'package:aswaqalhelal/locator/locator.dart';
import 'package:aswaqalhelal/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/password_text_field.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../bloc/cubit/update_email_cubit.dart';

class UpdateEmailPage extends StatelessWidget {
  const UpdateEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();

    final user =
        context.select((AppBloc bloc) => bloc.state.profile) as UserProfile;
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.updateEmail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<UpdateEmailCubit, UpdateEmailState>(
          listener: (context, state) {
            switch (state.status) {
              case FormzStatus.submissionFailure:
                showErrorSnackBar(
                    context, state.errorMessage ?? intl.updateEmailFailed);
                break;
              case FormzStatus.submissionSuccess:
                Navigator.pop(context);
                break;
              default:
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(intl.newEmail,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  TextField(
                    onChanged: context.read<UpdateEmailCubit>().emailChanged,
                    decoration: InputDecoration(
                        errorText: state.email.validationMessage),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    intl.currentPassword,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  PasswordTextField(
                    onChanged: context.read<UpdateEmailCubit>().passwordChanged,
                    errorText: state.password.validationMessage,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.status.isButtonValid
                          ? () {
                              context
                                  .read<UpdateEmailCubit>()
                                  .submit(user.email!);
                            }
                          : null,
                      child: state.status.isSubmissionInProgress
                          ? CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            )
                          : Text(intl.update),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
