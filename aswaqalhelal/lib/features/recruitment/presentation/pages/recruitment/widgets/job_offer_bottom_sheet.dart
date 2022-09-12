import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/form_inputs.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';

import '../../../../../user_institutions/domain/entities/institution.dart';
import '../../../cubit/job_offers/send_job_offers_cubit.dart';

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
    final institution =
        ModalRoute.of(context)!.settings.arguments as Institution;
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
                'Send offer',
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
              items: const [
                DropdownMenuItem(
                  value: 'Cachier',
                  child: Text('Cachier'),
                )
              ],
              value: 'Cachier',
              onChanged: (val) {},
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    focusNode.unfocus();
                    context.read<InstitutionJobsOffersCubit>().sendOffer(
                        institution, phoneController.text, 'Cachier');
                  }
                },
                child: Text('Send'))
          ],
        ),
      ),
    );
  }
}
