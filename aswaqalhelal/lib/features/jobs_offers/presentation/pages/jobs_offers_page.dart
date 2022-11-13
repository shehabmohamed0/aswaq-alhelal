import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/request_state.dart';
import '../../../../l10n/l10n.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/jobs_offers_cubit.dart';
import 'widgets/user_offer_list_tile.dart';

class JobsOffersPage extends StatelessWidget {
  const JobsOffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<JobsOffersCubit>();
    final userId = context.select((AppBloc e) => e.state.profile.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).jobsOffers),
        elevation: 0,
      ),
      body: BlocConsumer<JobsOffersCubit, JobsOffersState>(
        listenWhen: (previous, current) =>
            previous.updateOfferState != current.updateOfferState,
        listener: (context, state) {
          switch (state.updateOfferState) {
            case RequestState.initial:
              break;
            case RequestState.loading:
              showLoadingDialog();
              break;
            case RequestState.loaded:
              dismissLoadingDialog();
              break;
            case RequestState.error:
              dismissLoadingDialog();
              showErrorSnackBar(context, state.errorMessage!);
              break;
          }
        },
        buildWhen: (previous, current) =>
            previous.jobsOffersState != current.jobsOffersState,
        builder: (context, state) {
          switch (state.jobsOffersState) {
            case RequestState.initial:
              return kEmptyWidget;
            case RequestState.loading:
              return const LoadingWidget();
            case RequestState.error:
              return CheckInternetConnection(
                  onPressed: () => cubit.getJobOffers(userId));
            case RequestState.loaded:
              return LayoutBuilder(builder: (context, constraines) {
                return RefreshIndicator(
                    onRefresh: () => cubit.getJobOffers(userId),
                    child: BlocBuilder<JobsOffersCubit, JobsOffersState>(
                      buildWhen: (previous, current) =>
                          previous.jobsOffers != current.jobsOffers &&
                          previous.jobsOffersState == current.jobsOffersState,
                      builder: (context, state) {
                        return CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            if (state.jobsOffers.isNotEmpty)
                              SliverPadding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) => UserJobOfferListTile(
                                            jobOffer: state.jobsOffers[index],
                                          ),
                                      childCount: state.jobsOffers.length),
                                ),
                              )
                            else
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: constraines.maxHeight,
                                  child: Center(
                                      child: Text(
                                    AppLocalizations.of(context).noJobsnoffers,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(letterSpacing: 1.5),
                                  )),
                                ),
                              )
                          ],
                        );
                      },
                    )

                    // ListView.builder(
                    //   itemCount: state.jobsOffers.length,
                    //   itemBuilder:
                    // ),
                    );
              });
          }
        },
      ),
    );
  }
}
