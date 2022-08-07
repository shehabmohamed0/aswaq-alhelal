import 'package:aswaqalhelal/features/user_institutions/presentation/pages/add_institution/widgets/test.dart';
import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/core/form_inputs/minimum_lenght_string.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../address_suggestions/domain/entities/entities.dart';
import '../../../../address_suggestions/presentation/bloc/address_suggestions_bloc.dart';
import '../../../../address_suggestions/presentation/cubit/cubit/location_widget_cubit.dart';
import '../../../../address_suggestions/presentation/widgets/location_widget.dart';
import '../../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../cubit/add_institution/add_institution_cubit.dart';

part 'widgets/address_step_widget.dart';
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
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: const StepperButtons(),
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
            ],
          );
        },
      ),
    );
  }
}
