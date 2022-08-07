import 'package:flutter/material.dart';
import 'package:geo_logic/features/domain/entities/address.dart';


class AddressWidget extends StatelessWidget {
  final Address address;
  final VoidCallback onTap;
  const AddressWidget({
    Key? key,
    required this.address,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          Text(
            address.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          const Divider()
        ],
      ),
    );
  }
}
