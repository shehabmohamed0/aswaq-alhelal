import 'package:aswaqalhelal/features/widgets/check_internet_connection_widget.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aswaqalhelal/features/widgets/check_internet_connection_widget.dart';

import '../../../../core/request_state.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/no_data_widget.dart';
import '../cubit/user_orders/user_orders_bloc.dart';
import 'widgets/order_widget.dart';

class UserOrdersPage extends StatelessWidget {
  const UserOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).myOrders)),
      body: BlocConsumer<UserOrdersBloc, UserOrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.ordersState) {
            case RequestState.initial:
              return kEmptyWidget;
            case RequestState.loading:
              return const LoadingWidget();
            case RequestState.error:
              return CheckInternetConnection(onPressed: () {});
            case RequestState.loaded:
              if (state.orders.isEmpty) {
                return Center(
                  child: NoDataWidget(
                    message: AppLocalizations.of(context).thereIsNoOrdersYet,
                  ),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) => OrderWidget(
                  order: state.orders[index],
                  isUser: true,
                ),
                itemCount: state.orders.length,
              );
          }
        },
      ),
    );
  }
}
