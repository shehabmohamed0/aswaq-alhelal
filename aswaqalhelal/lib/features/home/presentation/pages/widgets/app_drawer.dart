import 'package:aswaqalhelal/core/request_state.dart';
import 'package:aswaqalhelal/features/widgets/check_internet_connection_widget.dart';
import 'package:aswaqalhelal/features/widgets/constants.dart';
import 'package:aswaqalhelal/features/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:root_package/core/locale/locale_cubit.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';
import 'package:root_package/packages/url_launcher.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/avatar.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../auth/domain/entities/base_profile.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);

    return Drawer(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final profile = state.profile;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DrawerHeader(
                profile: profile,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: ChangeProfileDialog(),
                    ),
                  );
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, Routes.institutions);
                },
                leading: const Icon(Icons.business_rounded),
                title: const Text('My institutions'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, Routes.workInstitutions,
                      arguments: profile);
                },
                leading: const Icon(Icons.business_center),
                title: const Text('Work institutions'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, Routes.jobsOffers,
                      arguments: profile.id);
                },
                leading: const Icon(FontAwesomeIcons.userTag),
                title: const Text('Job offers'),
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
                    title: Text(
                        Localizations.localeOf(context).languageCode == 'ar'
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
          );
        },
      ),
    );
  }
}

class ChangeProfileDialog extends StatelessWidget {
  const ChangeProfileDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((AppBloc element) => element.state);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        state.user.profiles.length == 1
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ListTile(
                  leading: FittedBox(child: Avatar()),
                  title: Text(state.profile.name),
                ),
              )
            : ExpansionTile(
                textColor: Colors.black87,
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: const FittedBox(child: Avatar()),
                title: Text(state.profile.name),
                trailing: const SizedBox.shrink(),
                children: state.user.profiles
                    .where((element) => element.id != state.profile.id)
                    .map((e) => ListTile(
                          leading: const FittedBox(child: Avatar()),
                          title: Text(e.name),
                        ))
                    .toList(),
              ),
        TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black45),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.addInstitution,
                  arguments: state.user.userProfile);
            },
            child: Text('+ Create institution'))
      ],
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
    required this.profile,
    required this.onTap,
  }) : super(key: key);

  final BaseProfile profile;
  final VoidCallback onTap;
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
              photo: profile.photoURL,
              onTap: onTap,
            ),
            const SizedBox(height: 8),
            if (profile.name.isNotEmpty)
              FittedBox(
                child: Text(
                  profile.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                ),
              ),
            const FittedBox(
              child: Text(
                'user.phoneNumber',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
