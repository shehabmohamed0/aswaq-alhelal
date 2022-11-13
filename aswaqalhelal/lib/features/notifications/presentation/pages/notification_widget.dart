import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aswaqalhelal/routes/routes.dart';
import 'package:timeago/timeago.dart' as timeage;

import '../../../recruitment/presentation/pages/recruitment/DTOs/recruitment_page_arguments.dart';
import '../../domain/entities/fstore_notification_item.dart';
import '../bloc/notifications_bloc.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});
  final FStoreNotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<NotificationsBloc>()
            .add(NotificationClicked(notification));
        _handleNotificationClick(context, notification);
      },
      child: Ink(
        color: notification.seen ? Colors.white : const Color(0xffEAF2FF),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            notification.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  notification.body,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: notification.seen ? Colors.white : Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              timeage.format(notification.creationTime,
                  allowFromNow: true,
                  locale: Localizations.localeOf(context).languageCode),
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
            ),
          ),
        ]),
      ),
    );
  }
}

_handleNotificationClick(
    BuildContext context, FStoreNotificationItem notification) {
  final route = notification.data?['route'] as String?;

  if (route == Routes.recruitment) {
    final institutionId = notification.data?['institutionId'] as String?;
    final ownerId = notification.data?['userId'] as String?;
    Navigator.pushNamed(context, Routes.recruitment,
        arguments: RecruitmentPageArguments(
            ownerId: ownerId!, institutionId: institutionId!));
  } else if (route == Routes.jobsOffers) {
    final userId = notification.data?['userId'] as String?;

    Navigator.pushNamed(context, Routes.jobsOffers, arguments: userId);
  }
}
