part of '../add_institution_page.dart';

class _ContactsStepWidget extends HookWidget {
  const _ContactsStepWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    bool emailSelected = true;
    PhoneNumber phoneNumber = const PhoneNumber.pure();
    Email email = const Email.pure();
    return Column(children: [
      StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  decoration:
                      InputDecoration(errorText: email.validationMessage),
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
                                }
                              : null
                          : phoneNumber.valid
                              ? () {
                                  context
                                      .read<AddInstitutionCubit>()
                                      .addPhoneNumber(phoneNumber);
                                }
                              : null,
                      child:  Text(AppLocalizations.of(context).add)))
            ],
          );
        },
      ),
      // Align(
      //   alignment: AlignmentDirectional.topEnd,
      //   child: IconButton(
      //       visualDensity: VisualDensity.compact,
      //       splashRadius: 18,
      //       onPressed: () {
      //         _showContactsDialog(context);
      //       },
      //       icon: const Icon(Icons.add)),
      // ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        child: BlocBuilder<AddInstitutionCubit, AddInstitutionState>(
          buildWhen: (p, c) =>
              p.emails != c.emails || p.phoneNumbers != c.phoneNumbers,
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...state.emails.map<Widget>(
                  (email) => _ContactRowWidget(
                    contactString: email.value,
                    iconData: Icons.email,
                    onDelete: () {
                      context.read<AddInstitutionCubit>().removeEmail(email);
                    },
                  ),
                ),
                ...state.phoneNumbers.map(
                  (phoneNumber) => _ContactRowWidget(
                    contactString: phoneNumber.value,
                    iconData: Icons.phone,
                    onDelete: () {
                      context
                          .read<AddInstitutionCubit>()
                          .removePhoneNumber(phoneNumber);
                    },
                  ),
                ),
                if (state.emails.isEmpty && state.phoneNumbers.isEmpty)
                  InkWell(
                      onTap: () {
                        _showContactsDialog(context);
                      },
                      child: Container(height: 50)),
              ],
            );
          },
        ),
      ),
    ]);
  }

  Future<dynamic> _showContactsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<AddInstitutionCubit>(),
        child: const _ContactsDialog(),
      ),
    );
  }
}

class _ContactRowWidget extends StatelessWidget {
  const _ContactRowWidget({
    Key? key,
    required this.contactString,
    required this.iconData,
    required this.onDelete,
  }) : super(key: key);

  final IconData iconData;
  final String contactString;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            iconData,
            size: 22,
          ),
        ),
        Text(contactString),
        const Spacer(),
        IconButton(
            visualDensity: VisualDensity.compact,
            splashRadius: 16,
            onPressed: onDelete,
            icon: const Icon(Icons.close, size: 22, color: Colors.red)),
      ],
    );
  }
}
