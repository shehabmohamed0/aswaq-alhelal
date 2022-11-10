import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../core/request_state.dart';
import '../../../../l10n/l10n.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../owner_institutions/presentation/widgets/institutions_grid_view.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/work_institutions_cubit.dart';

class WorkInstitutionsPage extends StatelessWidget {
  const WorkInstitutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserProfile;
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
              return Center(
                child: Text(AppLocalizations.of(context).noInstitutions),
              );
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).workInstitutions),
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
