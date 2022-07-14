import 'package:flutter/material.dart';
import 'package:root_package/core/locale/locale_cubit.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/url_launcher.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/avatar.dart';
import 'package:root_package/widgets/snack_bar.dart';
import 'package:users_logic/features/auth/domain/entities/user.dart';
import 'package:users_presentation/features/auth/bloc/app_status/app_bloc.dart';

import '../../../../../l10n/l10n.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);

    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DrawerHeader(user: user),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Routes.institutions);
            },
            leading: const Icon(Icons.business_rounded),
            title: const Text('Institutions'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Routes.currency);
            },
            leading: const Icon(Icons.currency_exchange),
            title: Text(
              intl.currency,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Routes.settings);
            },
            leading: const Icon(Icons.settings),
            title: Text(intl.settings),
          ),
          BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.language),
                onTap: () {
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? context.read<LocaleCubit>().toEnglish()
                      : context.read<LocaleCubit>().toArabic();
                },
                title: Text(Localizations.localeOf(context).languageCode == 'ar'
                    ? 'English'
                    : 'العربية'),
              );
            },
          ),
          ListTile(
            onTap: () async {
              if (await launchUrl(
                  Uri.parse('https://aswaqalhelal.godaddysites.com/'),
                  mode: LaunchMode.externalApplication)) {
              } else {
                showErrorSnackBar(context, intl.somethingWentWrong);
              }
            },
            leading: const Icon(Icons.privacy_tip_sharp),
            title: Text(intl.privacyPolicy),
          ),
          ListTile(
            onTap: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
            leading: const Icon(Icons.logout),
            title: Text(intl.logout),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(8),
      curve: Curves.bounceIn,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: FittedBox(
        child: Column(
          children: [
            Avatar(
              photo: user.photoURL,
              onTap: () {
                Navigator.pushNamed(context, Routes.settings);
              },
            ),
            const SizedBox(height: 8),
            FittedBox(
              child: Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 26,
                      color: Colors.white,
                    ),
              ),
            ),
            Text(
              user.phoneNumber,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
