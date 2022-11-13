import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aswaqalhelal/features/widgets/check_internet_connection_widget.dart';

import '../../../../../core/request_state.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../widgets/constants.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/no_data_widget.dart';
import '../../cubit/cubit/institution_orders_cubit.dart';
import 'order_widget.dart';

class ProcessingTabView extends StatelessWidget {
  const ProcessingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: BlocConsumer<InstitutionOrdersCubit, InstitutionOrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.processingOrdersState) {
            case RequestState.initial:
              return kEmptyWidget;
            case RequestState.error:
              return CheckInternetConnection(onPressed: () {});
            case RequestState.loading:
              return const LoadingWidget();
            case RequestState.loaded:
              final orders = state.processingOrders;
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    // This is the flip side of the SliverOverlapAbsorber
                    // above.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  if (orders.isEmpty)
                    SliverFillRemaining(
                      child: Material(
                        color: Colors.white,
                        child: Center(
                            child: NoDataWidget(
                          message: AppLocalizations.of(context).noOrdersYet,
                        )),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: OrderWidget(
                                      order: orders[index],
                                    ),
                                  ),
                              childCount: orders.length)),
                    )
                ],
              );
          }
        },
      ),
    );
  }
}
