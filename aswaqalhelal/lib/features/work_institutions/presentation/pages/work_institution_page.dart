import 'package:aswaqalhelal/features/auth/domain/entities/user.dart';
import 'package:aswaqalhelal/features/work_institutions/presentation/cubit/work_institutions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../core/request_state.dart';
import '../../../user_institutions/presentation/widgets/institutions_grid_view.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';

class WorkInstitutionsPage extends StatelessWidget {
  const WorkInstitutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return BlocConsumer<WorkInstitutionsCubit, WorkInstitutionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.institutionsState) {
          case RequestState.initial:
            return kEmptyWidget;
          case RequestState.loading:
            return const LoadingWidget();
          case RequestState.error:
            return CheckInternetConnection(onPressed: () {
              context.read<WorkInstitutionsCubit>().getInstitutions(user.id);
            });
          case RequestState.loaded:
            if (state.institutions.isEmpty) {
              return const Center(
                child: Text('No Institutions'),
              );
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Work institutions'),
              ),
              body: InstitutionsGridView(
                institutions: state.institutions,
                userId: user.id,
                onPressed: (institution) {
                  Navigator.pushNamed(
                    context,
                    Routes.insPage,
                    arguments: institution,
                  );
                },
              ),
            );
        }
      },
    );
  }
}
