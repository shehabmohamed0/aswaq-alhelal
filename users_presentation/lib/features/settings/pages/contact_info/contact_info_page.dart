import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../l10n/l10n.dart';
import '../../../auth/bloc/app_status/app_bloc.dart';

class ContactInfoPage extends StatelessWidget {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<UsersPresentationLocalizations>();
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.contactInfo),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            intl.phoneNumber,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.phoneNumber,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.updatePhone);
                    },
                    child: const Icon(Icons.edit)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            intl.emailAddress,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          if (user.email != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      user.email!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.updateEmail);
                      },
                      child: const Icon(Icons.edit)),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    intl.noEmailLinkedToTheAccount,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.addEmail);
                      },
                      child: const Icon(Icons.add)),
                ],
              ),
            )
        ]),
      ),
    );
  }
}
