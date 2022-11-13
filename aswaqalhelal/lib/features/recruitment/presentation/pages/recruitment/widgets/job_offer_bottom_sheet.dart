import 'package:aswaqalhelal/widgets/international_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/form_inputs/phone_number.dart';
import '../../../../../../l10n/l10n.dart';
import '../../../cubit/job_offers/send_job_offers_cubit.dart';
import '../DTOs/recruitment_page_arguments.dart';

class JobOfferBottomSheet extends StatelessWidget {
  const JobOfferBottomSheet({
    Key? key,
    required this.phoneController,
    required this.focusNode,
  }) : super(key: key);
  final TextEditingController phoneController;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as RecruitmentPageArguments;

    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context).sendOffer,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            InternationalPhoneTextField(
              focusNode: focusNode,
              onInputChanged: (phoneNumber) {
                phoneController.text = phoneNumber.phoneNumber ?? '';
              },
              countries: const ['EG'],
              validator: (string) {
                final phoneNumber = PhoneNumber.dirty(phoneController.text);
                return phoneNumber.validationMessage();
              },
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: 'Cashier',
                  child: Text(AppLocalizations.of(context).cashier),
                )
              ],
              value: 'Cashier',
              onChanged: (val) {},
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    focusNode.unfocus();
                    context.read<InstitutionJobsOffersCubit>().sendOffer(
                        arguments.institutionId,
                        arguments.ownerId,
                        phoneController.text,
                        AppLocalizations.of(context).cashier);
                  }
                },
                child: Text(AppLocalizations.of(context).send))
          ],
        ),
      ),
    );
  }
}
