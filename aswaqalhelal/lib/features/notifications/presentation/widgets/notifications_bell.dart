import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aswaqalhelal/routes/routes.dart';

import '../bloc/notifications_bloc.dart';

class NotificationsBell extends StatelessWidget {
  const NotificationsBell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return IconButton(
          splashRadius: 18,
          onPressed: () {
            context.read<NotificationsBloc>().add(NotificationsOpened());
            context.read<NotificationsBloc>().add(InitNotifications());
            Navigator.pushNamed(context, Routes.notifications);
          },
          icon: Badge(
            padding: const EdgeInsets.all(4),
            badgeContent: Text(
              state.badgeCounter.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            showBadge: state.badgeCounter != 0,
            child: const Icon(Icons.notifications),
          ),
        );
      },
    );
  }
}
