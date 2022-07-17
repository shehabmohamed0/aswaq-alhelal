import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../widgets/check_internet_connection_widget.dart';
import '../../cubit/institutions_cubit/institutions_cubit.dart';
import 'institution_widget.dart';

class InstitutionsPage extends StatelessWidget {
  const InstitutionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstitutionsCubit>();

    return BlocBuilder<InstitutionsCubit, InstitutionsState>(
      builder: (context, state) {
        if (state is InstitutionsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is InstitutionsLoaded) {
          return _InstitutionsLoadedWidget(state: state);
        } else if (state is InstitutionsEmpty) {
          return const _InstitutionsEmptyWidget();
        } else if (state is InstitutionsError) {
          return CheckInternetConnection(
            onPressed: () {
              cubit.getInstitutions();
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _InstitutionsLoadedWidget extends StatelessWidget {
  final InstitutionsLoaded state;

  const _InstitutionsLoadedWidget({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final institutions = state.institutions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institutions'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.addInstitution,
                  arguments: context.read<InstitutionsCubit>());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: const Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => InstitutionWidget(
          institution: institutions[index],
        ),
        itemCount: institutions.length,
      ),
    );
  }
}

class _InstitutionsEmptyWidget extends StatelessWidget {
  const _InstitutionsEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You have no institutions'),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: const Text('Add institution'),
          onPressed: () {
            Navigator.pushNamed(context, Routes.addInstitution,
                arguments: context.read<InstitutionsCubit>());
          },
        )
      ],
    );
  }
}
