import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import '../../../../../core/form_inputs/email.dart';
import '../../../../../core/form_inputs/minimum_lenght_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:aswaqalhelal/widgets/snack_bar.dart';

import '../../../../../core/form_inputs/phone_number.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/international_phone_text_field.dart';
import '../../cubit/add_institution/add_institution_cubit.dart';
import 'widgets/address_step.dart';

part 'widgets/contacts_dialog.dart';
part 'widgets/contacts_step_widget.dart';
part 'widgets/name_step_widget.dart';
part 'widgets/stepper_buttons.dart';

class AddInstitutionPage extends StatelessWidget {
  const AddInstitutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final cubit = context.read<AddInstitutionCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(intl.addInstitution),
      ),
      body: BlocConsumer<AddInstitutionCubit, AddInstitutionState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          switch (state.status) {
            case AddInstitutionStatus.initial:
              break;
            case AddInstitutionStatus.loading:
              showLoadingDialog();
              break;
            case AddInstitutionStatus.failure:
              dismissLoadingDialog();
              showErrorSnackBar(context, state.errorMessage!);
              break;
            case AddInstitutionStatus.success:
              dismissLoadingDialog();
              Navigator.of(context).pop(state.addedInstitution);
              break;
          }
        },
        buildWhen: (p, c) => p.step != c.step,
        builder: (context, state) {
          return Column(
            children: [
              Flexible(
                child: Theme(
                  data: ThemeData(
                      primaryColor: Theme.of(context).primaryColor,
                      colorScheme: Theme.of(context)
                          .colorScheme
                          .copyWith(primary: Theme.of(context).primaryColor),
                      inputDecorationTheme: const InputDecorationTheme(
                          border: OutlineInputBorder())),
                  child: Stepper(
                      margin: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      controlsBuilder: (d, ds) => const SizedBox.shrink(),
                      elevation: 0,
                      onStepTapped: cubit.onStepTapped,
                      currentStep: state.step,
                      type: StepperType.horizontal,
                      steps: [
                        Step(
                          title: Text(intl.name),
                          isActive: cubit.isActive(0),
                          content: _NameStepWidget(cubit: cubit),
                        ),
                        Step(
                            title: Text(intl.contacts),
                            isActive: cubit.isActive(1),
                            content: const _ContactsStepWidget()),
                        Step(
                            title: Text(AppLocalizations.of(context).address),
                            isActive: cubit.isActive(2),
                            content: AddUpdateAddressWidget(
                              onAddressDetailsChanged: (addressDetails) {
                                context
                                    .read<AddInstitutionCubit>()
                                    .addressChanged(addressDetails);
                              },
                            )

                            //const _AddressStepWidget(),
                            ),
                      ]),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: const StepperButtons(),
              ),
            ],
          );
        },
      ),
    );
  }
}
