part of '../add_institution_page.dart';

class StepperButtons extends StatelessWidget {
  const StepperButtons({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddInstitutionCubit>();
    return BlocBuilder<AddInstitutionCubit, AddInstitutionState>(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: cubit.onStepContinue(),
                child: state.step == 2
                    ? const Text('Submit')
                    : const Text('Continue')),
            const SizedBox(width: 4),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: state.step > 0
                    ? () {
                        cubit.previousStep();
                      }
                    : null,
                child: const Text(
                  'Previous',
                  style: TextStyle(fontSize: 16),
                )),
          ],
        );
      },
    );
  }
}
