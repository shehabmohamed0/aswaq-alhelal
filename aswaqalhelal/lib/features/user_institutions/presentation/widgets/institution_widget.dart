import 'package:flutter/material.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';
import 'package:root_package/routes/routes.dart';

import '../../domain/entities/institution.dart';

class InstitutionWidget extends StatelessWidget {
  const InstitutionWidget({
    Key? key,
    required this.institution,
    required this.isUserInstitution,

    
  }) : super(key: key);

  final Institution institution;
  final bool isUserInstitution;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.grey.shade300,
              spreadRadius: 1,
            ),
            BoxShadow(
              blurRadius: 12,
              color: Colors.grey.shade200,
              spreadRadius: 3,
              offset: const Offset(0, 2),
            ),
          ]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.institutionItems,
              arguments: institution);
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: const FaIcon(
                  FontAwesomeIcons.building,
                  size: 52,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      institution.officialName,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      institution.nickName,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
