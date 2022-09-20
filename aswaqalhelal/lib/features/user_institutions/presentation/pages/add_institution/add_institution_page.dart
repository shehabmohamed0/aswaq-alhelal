import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/core/form_inputs/minimum_lenght_string.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

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
    final cubit = context.read<AddInstitutionCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Institution'),
      ),
      body: BlocConsumer<AddInstitutionCubit, AddInstitutionState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          switch (state.status) {
            case AddInstitutionStatus.initial:
              break;
            case AddInstitutionStatus.loading:
              EasyLoading.show(
                indicator: const FittedBox(
                  child: SpinKitRipple(
                    duration: Duration(milliseconds: 1200),
                    color: Colors.white,
                  ),
                ),
                dismissOnTap: false,
              );
              break;
            case AddInstitutionStatus.failure:
              EasyLoading.dismiss();
              showErrorSnackBar(context, state.errorMessage!);
              break;
            case AddInstitutionStatus.success:
              EasyLoading.dismiss();
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
                          title: const Text('Name'),
                          isActive: cubit.isActive(0),
                          content: _NameStepWidget(cubit: cubit),
                        ),
                        Step(
                            title: const Text('Contacts'),
                            isActive: cubit.isActive(1),
                            content: const _ContactsStepWidget()),
                        Step(
                            title: const Text('Address'),
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
