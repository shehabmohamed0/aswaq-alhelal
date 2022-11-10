part of '../add_institution_page.dart';

class _NameStepWidget extends StatelessWidget {
  const _NameStepWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final AddInstitutionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddInstitutionCubit, AddInstitutionState>(
      buildWhen: (p, c) =>
          p.officialName != c.officialName || p.nickName != c.nickName,
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                TextFormField(
                  onChanged: cubit.officialNameChanged,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).officialName,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      errorText: state.officialName.validationMessage),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  onChanged: cubit.nickNameChanged,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).nickName,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      errorText: state.nickName.validationMessage),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
