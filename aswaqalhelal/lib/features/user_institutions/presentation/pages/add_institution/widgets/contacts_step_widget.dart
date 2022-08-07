part of '../add_institution_page.dart';

class _ContactsStepWidget extends StatelessWidget {
  const _ContactsStepWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: AlignmentDirectional.topEnd,
        child: IconButton(
            visualDensity: VisualDensity.compact,
            splashRadius: 18,
            onPressed: () {
              _showContactsDialog(context);
            },
            icon: const Icon(Icons.add)),
      ),
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
                    onDelete: () {},
                  ),
                ),
                ...state.phoneNumbers.map(
                  (phoneNumber) => _ContactRowWidget(
                    contactString: phoneNumber.value,
                    iconData: Icons.phone,
                    onDelete: () {},
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
