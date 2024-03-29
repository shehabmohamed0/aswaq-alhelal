import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aswaqalhelal/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/locale/locale_cubit.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../widgets/avatar.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../../auth/domain/entities/base_profile.dart';
import '../../../../auth/domain/entities/user_profile.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  bool _canChangeProfile(BaseProfile profile) {
    return profile.mapOrElse(
      userProfile: (user) =>
          user.phoneNumber == '+201553583931' ||
          user.phoneNumber == '+201001042111' ||
          user.phoneNumber == '+201111354351',
      institutionProfile: (institution) => true,
      orElse: () => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);

    return Drawer(
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.profile != current.profile,
        builder: (context, state) {
          final profile = state.profile;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DrawerHeader(
                profile: profile,
                onTap: !_canChangeProfile(state.profile)
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            clipBehavior: Clip.antiAlias,
                            child: ChangeProfileDialog(
                              onProfileClicked: (profile) {
                                context
                                    .read<AppBloc>()
                                    .add(ProfileChanged(profile));
                                Navigator.pop(context);
                                Scaffold.of(context).closeDrawer();
                              },
                            ),
                          ),
                        );
                      },
              ),
              if (state.profile.isUser)
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.userOrders,
                        arguments: profile);
                  },
                  leading: const Icon(FontAwesomeIcons.boxOpen),
                  title: Text(intl.myOrders),
                ),
              if (state.profile.isUser)
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.workInstitutions,
                        arguments: profile);
                  },
                  leading: const Icon(Icons.business_center),
                  title: Text(intl.work),
                ),
              if (state.profile.isUser)
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.jobsOffers,
                        arguments: profile.id);
                  },
                  leading: const Icon(FontAwesomeIcons.userTag),
                  title: Text(intl.jobOffers),
                ),
              if (state.profile.isUser)
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
                      Uri.parse(
                          'https://sites.google.com/view/aswaq-alhelal/home'),
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
    required this.onProfileClicked,
  }) : super(key: key);
  final void Function(BaseProfile profile) onProfileClicked;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.user.profiles.length == 1
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ListTile(
                      leading: const FittedBox(child: Avatar()),
                      title: Text(state.profile.name),
                    ),
                  )
                : ExpansionTile(
                    initiallyExpanded: true,
                    textColor: Colors.black87,
                    tilePadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: FittedBox(
                        child: state.profile.isUser
                            ? const Avatar()
                            : const InstitutionAvatar(iconSize: 74)),
                    title: Text(state.profile.name),
                    trailing: state.user.profiles.length == 1
                        ? const SizedBox.shrink()
                        : null,
                    childrenPadding: const EdgeInsets.all(4),
                    children: state.user.profiles
                        .where((element) => element.id != state.profile.id)
                        .map((profile) => ListTile(
                              onTap: () {
                                onProfileClicked(profile);
                              },
                              leading: FittedBox(
                                child: profile.isUser
                                    ? const Avatar()
                                    : const InstitutionAvatar(),
                              ),
                              title: Text(profile.name),
                            ))
                        .toList(),
                  ),
            TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.black45),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.addInstitution,
                      arguments: state.user.userProfile);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    SizedBox(width: 4),
                    Text('Add institution', style: TextStyle(fontSize: 16))
                  ],
                ))
          ],
        );
      },
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
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DrawerHeader(
        padding: const EdgeInsets.all(8),
        curve: Curves.bounceIn,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Column(
          children: [
            profile.mapOrElse(
              userProfile: (user) => Flexible(
                  child: Avatar(photo: profile.photoURL, onTap: onTap)),
              institutionProfile: (institution) => const Flexible(
                child: InstitutionAvatar(),
              ),
              orElse: () => const Text('Error'),
            ),
            const SizedBox(height: 8),
            if (profile.name.isNotEmpty)
              FittedBox(
                child: Text(
                  profile.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24, color: Colors.white),
                ),
              ),
            if (profile.isUser)
              FittedBox(
                child: Text(
                  (profile as UserProfile).phoneNumber,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class InstitutionAvatar extends StatelessWidget {
  final double? iconSize;
  const InstitutionAvatar({Key? key, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: FaIcon(
        FontAwesomeIcons.building,
        color: Colors.black54,
        size: iconSize ?? 48,
      ),
    );
  }
}
