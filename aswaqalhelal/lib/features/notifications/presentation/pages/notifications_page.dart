import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../../core/request_state.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/loading_widget.dart';
import '../bloc/notifications_bloc.dart';
import 'notification_widget.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          switch (state.initStatus) {
            case RequestState.initial:
              return kEmptyWidget;
            case RequestState.loading:
              return const LoadingWidget();

            case RequestState.error:
              return CheckInternetConnection(onPressed: () {
                context.read<NotificationsBloc>().add(InitNotifications());
              });
            case RequestState.loaded:
              if (state.notifications.isEmpty) {
                return Center(
                  child: Text('No notifications',
                      style: Theme.of(context).textTheme.titleLarge),
                );
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => NotificationWidget(
                              notification: state.notifications[index]),
                          childCount: state.notifications.length)),
                  if (state.loadingStatus.isLoading)
                    const SliverToBoxAdapter(child: LoadingWidget())
                ],
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<NotificationsBloc>().add(GetNotifications());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

//#EAF2FF