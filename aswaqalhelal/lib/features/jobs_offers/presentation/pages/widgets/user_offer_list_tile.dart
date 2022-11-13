import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../l10n/l10n.dart';
import '../../../../recruitment/domain/entities/job_offer.dart';
import '../../cubit/jobs_offers_cubit.dart';

class UserJobOfferListTile extends StatelessWidget {
  const UserJobOfferListTile({Key? key, required this.jobOffer})
      : super(key: key);
  final JobOffer jobOffer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffECEDF1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  jobOffer.role,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  timeago.format(jobOffer.creationTime,
                      locale: Localizations.localeOf(context).languageCode),
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    text: TextSpan(
                        text: AppLocalizations.of(context).from,
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: jobOffer.institutionName,
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        ]),
                  ),
                ),
                if (jobOffer.state != OfferState.pending)
                  Align(
                    child: Text(
                      jobOffer.state.message,
                      style: TextStyle(
                          color: jobOffer.state == OfferState.accepted
                              ? Colors.green
                              : Colors.red),
                    ),
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleIconButton(
                        backgroundColor: Colors.greenAccent,
                        icon: const Icon(Icons.check, color: Colors.white),
                        onPressed: () {
                          context
                              .read<JobsOffersCubit>()
                              .acceptJobOffer(jobOffer);
                        },
                      ),
                      const SizedBox(width: 4),
                      CircleIconButton(
                        backgroundColor: Colors.redAccent,
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          context
                              .read<JobsOffersCubit>()
                              .declineJobOffer(jobOffer);
                        },
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(),
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed,
        child: Padding(padding: const EdgeInsets.all(8), child: icon),
      ),
    );
  }
}
