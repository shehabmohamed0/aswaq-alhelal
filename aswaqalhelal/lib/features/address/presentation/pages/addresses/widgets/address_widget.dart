import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/address.dart';

class AddressWidget extends StatelessWidget {
  final Address address;
  final VoidCallback onTap;
  final bool isCurrentAddress;
  const AddressWidget(
      {Key? key,
      required this.address,
      required this.onTap,
      this.isCurrentAddress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${address.governate} - ${address.city} - ${address.neighborhood}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              ),
              if (isCurrentAddress)
                Text(
                  intl.Current,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Cairo'),
                )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
