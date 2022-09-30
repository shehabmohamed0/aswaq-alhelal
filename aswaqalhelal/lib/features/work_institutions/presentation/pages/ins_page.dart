import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';
import 'package:root_package/routes/routes.dart';


class InsPage extends StatelessWidget {
  const InsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    return Scaffold(
      appBar: AppBar(
        title: Text(institution.name),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            GridTile(
              backgroundColor: Colors.lightGreen,
              iconData: FontAwesomeIcons.receipt,
              title: 'Receipts',
              onTap: () {
                Navigator.pushNamed(context, Routes.institutionReceipts,
                    arguments: institution);
              },
            ),
          ],
        ),
      ),
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
