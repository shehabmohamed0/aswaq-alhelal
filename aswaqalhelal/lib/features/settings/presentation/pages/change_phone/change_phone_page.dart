import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:root_package/core/extensions/formz_extesion.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/core/resources/values_manager.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../../auth/presentation/pages/verifiy_phone/verifiy_phone_page.dart';
import '../../bloc/change_phone/update_phone_cubit.dart';
import '../../bloc/change_phone/update_phone_verification_cubit.dart';

class ChangePhonePage extends HookWidget {
  const ChangePhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final textController = useTextEditingController();
    return BlocProvider<UpdatePhoneCubit>(
      create: (context) => locator(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(intl.changePhoneNumber),
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<UpdatePhoneCubit, UpdatePhoneState>(
          listenWhen: (previous, current) =>
              previous.phoneNumber != current.phoneNumber ||
              previous.status != current.status,
          listener: (context, state) {
            switch (state.status) {
              case FormzStatus.submissionFailure:
                showErrorSnackBar(
                    context, state.errorMessage ?? intl.changeNumberFailure);
                break;

              case FormzStatus.submissionSuccess:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BlocProvider<UpdatePhoneVerificationCubit>(
                        create: (context) => locator(),
                        child: VerifiyPhonePage<UpdatePhoneVerificationCubit>(
                          phoneNumber: state.phoneNumber.value,
                          onSubmit: (bloc) {
                            bloc.updatePhone(
                                state.phoneNumber.value, state.verificationId);
                          },
                          onSubmmisionSuccess: () {
                            Navigator.popUntil(
                                context,
                                (route) =>
                                    route.settings.name == Routes.contactInfo);
                            showSuccessSnackBar(
                                context, intl.phoneHasBeenUpdatedSuccessfully);
                          },
                        ),
                      ),
                    ));
                break;
              default:
            }
          },
          buildWhen: (previous, current) {
            return previous.phoneNumber != current.phoneNumber ||
                previous.status != current.status;
          },
          builder: (context, state) {
            return ListView(children: [
              if (state.status.isSubmissionInProgress)
                const LinearProgressIndicator(),
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(children: [
                    InternationalPhoneTextField(
                      controller: textController,
                      countries: const ['EG'],
                      errorText: () {
                        return state.phoneNumber
                            .validationMessageWithOldPhone(user.phoneNumber);
                      },
                      onInputChanged: (phoneNumber) {
                        context
                            .read<UpdatePhoneCubit>()
                            .phoneChanged(phoneNumber.phoneNumber!);
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: state.status.isButtonValid
                                ? context.read<UpdatePhoneCubit>().verifiy
                                : null,
                            child: const Text('Submit'))),
                  ])),
            ]);
          },
        ),
      ),
    );
  }
}
