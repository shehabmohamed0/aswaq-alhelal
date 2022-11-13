import 'package:aswaqalhelal/core/form_inputs/name.dart';
import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:aswaqalhelal/locator/locator.dart';
import 'package:aswaqalhelal/routes/routes.dart';
import 'package:aswaqalhelal/widgets/snack_bar.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../auth/domain/entities/user_profile.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../bloc/account_info/account_info_cubit.dart';
import '../phone_info/phone_info_page.dart';

class AccountInfoPage extends HookWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();
    final user =
        context.select((AppBloc bloc) => bloc.state.profile) as UserProfile;
    final controller = useTextEditingController(
      text: user.birthDate != null
          ? DateFormat.yMd().format(user.birthDate!).toString()
          : null,
    );

    final phoneController = useTextEditingController(text: user.phoneNumber);
    return BlocProvider<AccountInfoCubit>(
      create: (context) => locator()..initialize(user),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(intl.accountInfo),
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: BlocConsumer<AccountInfoCubit, AccountInfoState>(
            listener: (context, state) {
              if (state.status.isSubmissionInProgress) {
                showLoadingDialog();
              } else if (state.status.isSubmissionFailure) {
                dismissLoadingDialog();
                showErrorSnackBar(
                    context, state.errorMessage ?? intl.updateFailed);
              } else if (state.status.isSubmissionSuccess) {
                dismissLoadingDialog();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if (user.email != null)
                  GestureDetector(
                    onTap: () async {
                      if (user.email == null) {
                        Navigator.of(context).pushNamed(Routes.addEmail);
                      } else {
                        await Navigator.pushNamed(context, Routes.updateEmail);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(intl.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.email ?? 'No email',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 18, color: Colors.grey),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, Routes.updatePhone);
                      phoneController.text = user.phoneNumber;
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(intl.phoneNumber,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.phoneNumber,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 18, color: Colors.grey),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  SettingsTextFormField(
                    labelText: intl.name,
                    initialValue: state.name.value,
                    onChanged: context.read<AccountInfoCubit>().nameChanged,
                    errorText: state.name.validationMessage(),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      final birthDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.utc(1900),
                        initialDate: user.birthDate ?? DateTime.utc(2000),
                        lastDate: DateTime.now(),
                      );

                      if (birthDate != null) {
                        context
                            .read<AccountInfoCubit>()
                            .birthDateChanged(birthDate, controller);
                      }
                    },
                    child: SettingsTextFormField(
                      controller: controller,
                      enabled: false,
                      labelText: intl.dateOfBirth,
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    intl.genderOptional,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      GenderRadio(
                        title: intl.male,
                        value: 'male',
                        groupValue: state.gender,
                        onChanged:
                            context.read<AccountInfoCubit>().genderChanged,
                      ),
                      const SizedBox(width: 8),
                      GenderRadio(
                        title: intl.female,
                        value: 'female',
                        groupValue: state.gender,
                        onChanged:
                            context.read<AccountInfoCubit>().genderChanged,
                      ),
                      GenderRadio(
                        title: intl.notSpecified,
                        value: '',
                        groupValue: state.gender,
                        onChanged:
                            context.read<AccountInfoCubit>().genderChanged,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.status.isSubmissionInProgress
                          ? null
                          : context.read<AccountInfoCubit>().updateProfile,
                      child: Text(
                        intl.save,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )),
      ),
    );
  }
}
