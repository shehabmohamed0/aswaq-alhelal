import 'package:flutter/material.dart';
import 'package:root_package/routes/routes.dart';

import '../../../domain/entities/institution.dart';

class OwnerInstitution extends StatelessWidget {
  const OwnerInstitution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final institution =
        ModalRoute.of(context)!.settings.arguments as Institution;
    return Scaffold(
      appBar: AppBar(
        title: Text(institution.officialName),
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
              backgroundColor: Colors.lightBlueAccent,
              iconData: Icons.category_rounded,
              title: 'Items',
              onTap: () {},
            ),
            GridTile(
              backgroundColor: Colors.tealAccent.shade400,
              iconData: Icons.list_alt_rounded,
              title: 'Orders',
              onTap: () {},
            ),
            GridTile(
              backgroundColor: Colors.orangeAccent,
              iconData: Icons.local_shipping,
              title: 'Distribution ',
              onTap: () {
                Navigator.pushNamed(context, Routes.distributionAreas,
                    arguments: institution);
              },
            ),
            GridTile(
              backgroundColor: Colors.deepPurpleAccent,
              iconData: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile({
    Key? key,
    this.extent,
    this.backgroundColor,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

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
                  child: Icon(iconData, color: Colors.grey.shade100),
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