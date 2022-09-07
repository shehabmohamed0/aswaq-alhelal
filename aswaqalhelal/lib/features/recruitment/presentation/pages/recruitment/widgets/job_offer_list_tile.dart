import 'package:flutter/material.dart';

import '../../../../domain/entities/job_offer.dart';

class JobOfferListTile extends StatelessWidget {
  const JobOfferListTile({Key? key, required this.jobOffer}) : super(key: key);
  final JobOffer jobOffer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.2),
              blurRadius: 2,
            )
          ]),
      child: ListTile(
        visualDensity: VisualDensity.comfortable,
        title: Text(jobOffer.phoneNumber),
        trailing: Text(jobOffer.state.message),
        subtitle: Text(jobOffer.role),
        onTap: () {},
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.2),
              blurRadius: 2,
            )
          ]),
      child: child,
    );
  }
}
