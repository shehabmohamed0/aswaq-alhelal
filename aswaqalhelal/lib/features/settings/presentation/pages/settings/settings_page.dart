import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../../l10n/l10n.dart';
import '../../widgets/settings_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    final intl = locator<AppLocalizations>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
        centerTitle: true,
        elevation: 1,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          SettingsListTile(
            title: intl.accountInfo,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.accountInfo);
            },
          ),
          SettingsListTile(
            title: intl.contactInfo,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.contactInfo);
            },
          ),
          SettingsListTile(
            title: intl.addresses,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.addresses);
            },
          ),
        ],
      ),
    );
  }
}
