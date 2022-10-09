import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../auth/domain/entities/user_profile.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../user_institutions/presentation/widgets/institution_widget.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/no_data_widget.dart';
import '../cubit/institutions_cubit.dart';

class InstitutionsSliverWidget extends StatelessWidget {
  const InstitutionsSliverWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<AppBloc>().state.profile as UserProfile;
    return BlocBuilder<InstitutionsCubit, InstitutionsState>(
      builder: (context, state) {
        return state.map(
          initial: (initial) => const SliverToBoxAdapter(
            child: SizedBox(
              height: 1,
            ),
          ),
          loading: (loading) {
            return const SliverFillRemaining(
              child: LoadingWidget(),
            );
          },
          loaded: (state) {
            if (state.institutions.isEmpty) {
              return const SliverFillRemaining(
                child: Center(
                    child: NoDataWidget(
                        message:
                            'There is No Available institution\nin your address')),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                    (context, index) => InstitutionWidget(
                          institution: state.institutions[index],
                          isUserInstitution:
                              userProfile.id == state.institutions[index].id,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.clientInstitution,
                                arguments: state.institutions[index]);
                          },
                        ),
                    childCount: state.institutions.length),
              ),
            );
          },
          error: (error) => SliverToBoxAdapter(
            child: CheckInternetConnection(onPressed: () {}),
          ),
        );
      },
    );
  }
}
