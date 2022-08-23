part of '../sign_in_page.dart';

class EmailSignInForm extends StatelessWidget {
  const EmailSignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();
    return BlocConsumer<EmailSignInFormCubit, EmailSignInFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          showErrorSnackBar(
              context, state.errorMessage ?? intl.authenticationFailure);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              intl.email,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            TextField(
              onChanged: context.read<EmailSignInFormCubit>().emailChanged,
              decoration:
                  InputDecoration(errorText: state.email.validationMessage),
            ),
            const SizedBox(height: 16),
            Text(
              intl.password,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            PasswordTextField(
              onChanged: context.read<EmailSignInFormCubit>().passwordChanged,
              errorText: state.password.validationMessage,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: !state.status.isInvalid &&
                        !state.status.isSubmissionInProgress &&
                        !state.status.isPure
                    ? context
                        .read<EmailSignInFormCubit>()
                        .signInWithEmailAndPassword
                    : null,
                child: state.status.isSubmissionInProgress
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : Text(
                        intl.login,
                        style: TextStyle(letterSpacing: 2),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  intl.notRegisteredYet,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signup);
                  },
                  child: Text(
                    intl.createAnAccount,
                    style: TextStyle(color: Colors.orange.shade900),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
