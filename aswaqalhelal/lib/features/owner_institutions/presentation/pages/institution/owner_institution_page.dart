import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aswaqalhelal/routes/routes.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../auth/domain/entities/institution_profile.dart';
import '../../../../recruitment/presentation/pages/recruitment/DTOs/recruitment_page_arguments.dart';

// class OwnerInstitutionPage extends StatelessWidget {
//   const OwnerInstitutionPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final institution =
//         ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
//     return Scaffold(
//       body: InstitutionPageBody(institution: institution),
//     );
//   }
// }

class InstitutionPageBody extends StatelessWidget {
  const InstitutionPageBody({
    Key? key,
    required this.institution,
  }) : super(key: key);

  final InstitutionProfile institution;

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        GridTile(
          backgroundColor: Colors.lightBlueAccent,
          iconData: Icons.category_rounded,
          title: intl.items,
          onTap: () {
            Navigator.pushNamed(context, Routes.institutionItems,
                arguments: institution);
          },
        ),
        GridTile(
          backgroundColor: Colors.tealAccent.shade400,
          iconData: Icons.list_alt_rounded,
          title: intl.orders,
          onTap: () {
            Navigator.pushNamed(context, Routes.institutionOrders,
                arguments: institution);
          },
        ),
        GridTile(
          backgroundColor: Colors.orangeAccent,
          iconData: Icons.local_shipping_rounded,
          title: intl.distribution,
          onTap: () {
            Navigator.pushNamed(context, Routes.distributionAreas,
                arguments: institution);
          },
        ),
        GridTile(
          backgroundColor: Colors.lightGreen,
          iconData: FontAwesomeIcons.receipt,
          title: intl.receipts,
          onTap: () {
            Navigator.pushNamed(context, Routes.institutionReceipts,
                arguments: institution);
          },
        ),
        GridTile(
          backgroundColor: Colors.redAccent.shade400,
          iconData: Icons.group_work_rounded,
          title: intl.recruitment,
          onTap: () {
            Navigator.pushNamed(context, Routes.recruitment,
                arguments: RecruitmentPageArguments(
                    ownerId: institution.userId,
                    institutionId: institution.id));
          },
        ),
        GridTile(
          backgroundColor: Colors.pinkAccent,
          iconData: Icons.people_rounded,
          title: 'Clients',
          onTap: () {
            Navigator.pushNamed(context, Routes.institutionClients,
                arguments: institution);
          },
        ),
        GridTile(
          backgroundColor: Colors.deepPurpleAccent,
          iconData: Icons.settings,
          title: intl.settings,
          onTap: () {},
        ),
      ],
    );
  }
}

class GridTile extends StatelessWidget {
  GridTile({
    Key? key,
    this.extent,
    this.backgroundColor,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key) {
    assert(
      iconData != Icons.abc,
      '',
    );
  }

  final double? extent;
  final Color? backgroundColor;
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: backgroundColor,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: FaIcon(iconData, color: Colors.grey.shade100),
                ),
              ),
              Expanded(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SuggestionExamble extends StatelessWidget {
//   const SuggestionExamble({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
