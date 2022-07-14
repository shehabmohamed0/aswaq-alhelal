import 'package:aswaqalhelal/features/institutions/presentation/cubit/add_institution/add_institution_cubit.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../widgets/check_internet_connection_widget.dart';
import '../../../domain/entities/institution.dart';
import '../../cubit/institutions_cubit/institutions_cubit.dart';
import '../add_institution/add_institution_page.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(institutions.length, (index) {
            return InstitutionWidget(institution: institutions[index]);
          }),
        ),
      ),
    );
  }
}

class InstitutionWidget extends StatelessWidget {
  const InstitutionWidget({
    Key? key,
    required this.institution,
  }) : super(key: key);

  final Institution institution;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.institution,
            arguments: institution);
      },
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                institution.officialName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                institution.brandName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                institution.commercialName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                institution.nickname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
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
