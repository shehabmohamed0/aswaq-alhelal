part of'../add_institution_page.dart';
class _ContactsDialog extends StatefulWidget {
  const _ContactsDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<_ContactsDialog> createState() => _ContactsDialogState();
}

class _ContactsDialogState extends State<_ContactsDialog> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool emailSelected = true;
  PhoneNumber phoneNumber = PhoneNumber.pure();
  Email email = Email.pure();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add contact', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: emailSelected
                        ? null
                        : () {
                            setState(() {
                              emailSelected = true;
                            });
                          },
                    child: Icon(Icons.email)),
                const SizedBox(width: 4),
                ElevatedButton(
                    onPressed: emailSelected
                        ? () {
                            setState(() {
                              emailSelected = false;
                            });
                          }
                        : null,
                    child: const Icon(Icons.phone)),
              ],
            ),
            const SizedBox(height: 8),
            if (emailSelected)
              TextField(
                controller: emailController,
                onChanged: (v) {
                  setState(() {
                    email = Email.dirty(v);
                  });
                },
                decoration: InputDecoration(errorText: email.validationMessage),
              )
            else
              InternationalPhoneTextField(
                controller: phoneController,
                onInputChanged: (phone) {
                  setState(() {
                    phoneNumber = PhoneNumber.dirty(phone.phoneNumber ?? '');
                  });
                },
                errorText: phoneNumber.validationMessage,
                countries: ['EG'],
              ),
            const SizedBox(height: 8),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: emailSelected
                        ? email.valid
                            ? () {
                                context
                                    .read<AddInstitutionCubit>()
                                    .addEmail(email);
                                Navigator.of(context).pop();
                              }
                            : null
                        : phoneNumber.valid
                            ? () {
                                context
                                    .read<AddInstitutionCubit>()
                                    .addPhoneNumber(phoneNumber);
                                Navigator.of(context).pop();
                              }
                            : null,
                    child: const Text('Add')))
          ],
        ),
      ),
    );
  }
}
