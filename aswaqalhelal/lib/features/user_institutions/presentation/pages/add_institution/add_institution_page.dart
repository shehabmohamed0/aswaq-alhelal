import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/core/form_inputs/required_string.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../domain/entities/institution.dart';
import '../../cubit/add_institution/add_institution_cubit.dart';
import '../../cubit/institutions_cubit/institutions_cubit.dart';

class AddInstitutionPage extends StatelessWidget {
  const AddInstitutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddInstitutionCubit>();
    final institution =
        ModalRoute.of(context)?.settings.arguments as Institution?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add institution'),
      ),
      body: BlocListener<AddInstitutionCubit, AddInstitutionState>(
        listener: (context, state) {
          if (state.status == FormzStatus.submissionFailure) {
            EasyLoading.dismiss();
            showErrorSnackBar(context, state.errorMessage!);
          } else if (state.status == FormzStatus.submissionSuccess) {
            EasyLoading.dismiss();
            state.isEdit
                ? context
                    .read<UserInstitutionsCubit>()
                    .updateInstitution(state.institution!)
                : context
                    .read<UserInstitutionsCubit>()
                    .addInstitution(state.institution!);
            Navigator.of(context).pop();
          } else if (state.status == FormzStatus.submissionInProgress) {
            EasyLoading.show(
                status: 'loading',
                indicator: const FittedBox(
                  child: SpinKitRipple(
                    duration: Duration(milliseconds: 1200),
                    color: Colors.white,
                  ),
                ));
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            BlocBuilder<AddInstitutionCubit, AddInstitutionState>(
              buildWhen: (previous, current) =>
                  previous.brandName != current.brandName ||
                  previous.commercialName != current.commercialName ||
                  previous.nickName != current.nickName ||
                  previous.officialName != current.officialName,
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic information',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: institution?.officialName,
                      onChanged: cubit.officialNameChanged,
                      decoration: InputDecoration(
                          labelText: 'Official name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          errorText: state.officialName.validationMessage),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: institution?.commercialName,
                      onChanged: cubit.commercialNameChanged,
                      decoration: InputDecoration(
                          labelText: 'Commercial name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          errorText: state.commercialName.validationMessage),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: institution?.brandName,
                      onChanged: cubit.brandNameChanged,
                      decoration: InputDecoration(
                        labelText: 'Brand name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.brandName.validationMessage,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: institution?.nickname,
                      onChanged: cubit.nickNameChanged,
                      decoration: InputDecoration(
                        labelText: 'Nick name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorText: state.nickName.validationMessage,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Contact information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Emails',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            BlocBuilder<AddInstitutionCubit, AddInstitutionState>(
              buildWhen: (previous, current) =>
                  previous.emails != current.emails,
              builder: (context, state) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.emails.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: index < (institution?.emails.length ?? 0)
                          ? institution?.emails[index]
                          : null,
                      onChanged: (value) {
                        cubit.emailChanged(index, value);
                      },
                      decoration: InputDecoration(
                        errorText: state.emails[index].validationMessage,
                        suffixIcon: index == 0
                            ? null
                            : DeleteIconButton(
                                onPressed: () {
                                  cubit.deleteEmail(index);
                                },
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
            DottedPlusButton(onPressed: cubit.addNewEmail),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Phone numbers',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            BlocBuilder<AddInstitutionCubit, AddInstitutionState>(
              buildWhen: (previous, current) =>
                  previous.phoneNumbers != current.phoneNumbers,
              builder: (context, state) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.phoneNumbers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InternationalPhoneTextField(
                      initialNumber:
                          index < (institution?.phoneNumbers.length ?? 0)
                              ? institution?.phoneNumbers[index]
                              : null,
                      errorText: state.phoneNumbers[index].validationMessage,
                      onInputChanged: (phoneNumber) {
                        cubit.phoneNumberChanged(
                            index, phoneNumber.phoneNumber ?? '');
                      },
                      countries: const ['EG'],
                      suffixIcon: index == 0
                          ? null
                          : DeleteIconButton(
                              onPressed: () {
                                cubit.deletePhoneNumber(index);
                              },
                            ),
                    ),
                  ),
                );
              },
            ),
            DottedPlusButton(onPressed: cubit.addNewPhoneNumber),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: cubit.submit, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}

class DottedPlusButton extends StatelessWidget {
  const DottedPlusButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0) +
          const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onPressed,
        child: DottedBorder(
          borderType: BorderType.Rect,
          dashPattern: const [8, 4],
          padding: const EdgeInsets.all(8.0),
          strokeWidth: 2,
          color: Colors.black38,
          strokeCap: StrokeCap.butt,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}
