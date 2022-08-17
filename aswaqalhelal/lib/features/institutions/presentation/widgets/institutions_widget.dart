import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:users_presentation/features/auth/bloc/app_status/app_bloc.dart';

import '../../../user_institutions/presentation/widgets/institution_widget.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../cubit/institutions_cubit.dart';

class InstitutionsSliverWidget extends StatelessWidget {
  const InstitutionsSliverWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppBloc>().state.user;
    return BlocProvider<InstitutionsCubit>(
      create: (context) => locator()..getInstitutions(),
      child: BlocBuilder<InstitutionsCubit, InstitutionsState>(
        builder: (context, state) {
          return state.map(
            initial: (initial) => const SliverToBoxAdapter(
              child: SizedBox(
                height: 1,
              ),
            ),
            loading: (loading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            loaded: (state) => SliverPadding(
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
                              user.id == state.institutions[index].id,
                              onPressed: (){
                                //TODO:
                              },
                        ),
                    childCount: state.institutions.length),
              ),
            ),
            error: (error) => SliverToBoxAdapter(
              child: CheckInternetConnection(onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}
