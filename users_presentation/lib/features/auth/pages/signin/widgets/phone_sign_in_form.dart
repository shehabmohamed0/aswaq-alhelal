part of '../sign_in_page.dart';

class PhoneSignInForm extends HookWidget {
  const PhoneSignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<UsersPresentationLocalizations>();
    final phoneConrtoller = useTextEditingController();
    return BlocConsumer<PhoneSignInFormCubit, PhoneSignInFormState>(
      listener: (context, state) {
        switch (state.status) {
          case FormzStatus.submissionFailure:
            showErrorSnackBar(
                context, state.errorMessage ?? intl.authenticationFailure);

            break;
          case FormzStatus.submissionSuccess:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider<PhoneSignInVerificationCubit>(
                  create: (context) => locator(),
                  child: VerifiyPhonePage<PhoneSignInVerificationCubit>(
                    phoneNumber: state.phoneNumber.value,
                    onSubmit: (bloc) {
                      bloc.signInWithPhoneNumber(state.verificationId!);
                    },
                    onSubmmisionSuccess: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            );
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
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

class DialogH extends StatelessWidget {
  const DialogH({
    Key? key,
    required this.btnOkOnPressed,
    required this.btnCancelOnPressed,
  }) : super(key: key);
  final VoidCallback btnOkOnPressed;
  final VoidCallback btnCancelOnPressed;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.all(16).copyWith(),
      children: [
        Text('Login failed', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Text(
          'Phone number is not registered,\nwant to sign up?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.grey.shade200,
                  onPrimary: Colors.black45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(6),
                ),
                onPressed: btnCancelOnPressed,
                child: const Text('Cacnel'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(6),
                ),
                onPressed: btnOkOnPressed,
                child: const Text('Ok'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
