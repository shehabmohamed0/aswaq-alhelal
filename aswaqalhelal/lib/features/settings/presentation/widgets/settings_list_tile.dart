import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.onTap,
    required this.title,
    this.leading,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}
