import 'package:aswaqalhelal/features/user_institutions/domain/entities/institution.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../../core/request_state.dart';
import '../../../../../widgets/check_internet_connection_widget.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/loading_widget.dart';
import '../../../cubit/job_offers/send_job_offers_cubit.dart';
import 'job_offer_list_tile.dart';

class OffersTabView extends StatelessWidget {
  const OffersTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final institution =
        ModalRoute.of(context)!.settings.arguments as Institution;

    return SafeArea(
      top: false,
      bottom: false,
      child: BlocBuilder<InstitutionJobsOffersCubit, InstitutionJobsOffersState>(
        builder: (context, state) {
          switch (state.jobsOffersState) {
            case RequestState.idle:
              return kEmptyWidget;
            case RequestState.loading:
              return const LoadingWidget();
            case RequestState.error:
              return CheckInternetConnection(onPressed: () {
                context.read<InstitutionJobsOffersCubit>().getSentOffers(institution.id);
              });
            case RequestState.loaded:
              if (state.jobsOffers.isEmpty) {
                return const Center(
                  child: Text('No Sent Offers'),
                );
              }
              return CustomScrollView(
                // The "controller" and "primary" members should be left
                // unset, so that the NestedScrollView can control this
                // inner scroll view.
                // If the "controller" property is set, then this scroll
                // view will not be associated with the NestedScrollView.
                // The PageStorageKey should be unique to this ScrollView;
                // it allows the list to remember its scroll position when
                // the tab view is not on the screen.
                key: const PageStorageKey<String>('Offers'),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    // This is the flip side of the SliverOverlapAbsorber
                    // above.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    // In this example, the inner scroll view has
                    // fixed-height list items, hence the use of
                    // SliverFixedExtentList. However, one could use any
                    // sliver widget here, e.g. SliverList or SliverGrid.
                    sliver: SliverList(
                      // The items in this example are fixed to 48 pixels
                      // high. This matches the Material Design spec for
                      // ListTile widgets.
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          // This builder is called for each child.
                          // In this example, we just number each list item.
                          return JobOfferListTile(
                              jobOffer: state.jobsOffers[index]);
                        },
                        // The childCount of the SliverChildBuilderDelegate
                        // specifies how many children this inner list
                        // has. In this example, each tab has a list of
                        // exactly 30 items, but this is arbitrary.
                        childCount: state.jobsOffers.length,
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
