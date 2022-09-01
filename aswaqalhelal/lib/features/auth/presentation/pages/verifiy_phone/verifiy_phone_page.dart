import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:root_package/core/extensions/formz_extesion.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/widgets/ensure_visible_when_focused.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../bloc/verifiy_phone/verifiy_phone_cubit.dart';
import 'widgets/otp_widget.dart';

class VerifiyPhonePage<T extends VerifiyPhoneCubit> extends HookWidget {
  const VerifiyPhonePage({
    Key? key,
    required this.phoneNumber,
    required this.onSubmit,
    required this.onSubmmisionSuccess,
  }) : super(key: key);
  final String phoneNumber;
  final Function(T t) onSubmit;
  final VoidCallback onSubmmisionSuccess;
  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();
    final textController = useTextEditingController();
    final focusNode = useFocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.otp),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/otp.png',
                        package: 'users_presentation',
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      intl.verificationCode,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      intl.weHaveSentTheCodeVerifiactionTonyourMobileNumber,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        phoneNumber,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocConsumer<T, VerifiyPhoneState>(
                      listener: (context, state) {
                        if (state.status.isSubmissionSuccess) {
                          onSubmmisionSuccess();
                        } else if (state.status.isSubmissionFailure) {
                          showErrorSnackBar(
                              context, state.errorMessage ?? intl.failed);
                        }
                      },
                      builder: (context, state) {
                        if (state.autoRecievedCode) {
                          textController.text = state.otp.value;
                          print(textController.value);
                        }
                        return EnsureVisibleWhenFocused(
                          focusNode: focusNode,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: OTPWidget(
                              controller: textController,
                              focusNode: focusNode,
                              onCompleted: state.autoVerified
                                  ? null
                                  : (s) {
                                      final bloc = context.read<T>();
                                      onSubmit(bloc);
                                      bloc.onComplete();
                                    },
                              onChanged: context.read<T>().otpChanged,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<T, VerifiyPhoneState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: state.status.isButtonValid
                      ? () {
                          final bloc = context.read<T>();
                          onSubmit(bloc);
                        }
                      : null,
                  child: state.status.isSubmissionInProgress
                      ? CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        )
                      : Text(intl.verifiybuttontext),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}