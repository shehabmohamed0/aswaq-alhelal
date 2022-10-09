import 'package:aswaqalhelal/features/orders/presentation/cubit/user_orders/user_orders_bloc.dart';
import 'package:aswaqalhelal/features/orders/presentation/pages/widgets/order_widget.dart';
import 'package:aswaqalhelal/features/widgets/constants.dart';
import 'package:aswaqalhelal/features/widgets/loading_widget.dart';
import 'package:aswaqalhelal/features/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/widgets/check_internet_connection_widget.dart';

import '../../../../core/request_state.dart';

class UserOrdersPage extends StatelessWidget {
  const UserOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My orders')),
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
                return const Center(
                  child: NoDataWidget(
                    message: 'There is no orders yet',
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
