import 'package:flutter/material.dart';
import 'package:root_package/packages/font_awesome_flutter.dart';

import '../../../auth/domain/entities/institution_profile.dart';

class InstitutionWidget extends StatelessWidget {
  const InstitutionWidget({
    Key? key,
    required this.institution,
    required this.isUserInstitution,
    required this.onPressed,
  }) : super(key: key);

  final InstitutionProfile institution;
  final bool isUserInstitution;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
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
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: FaIcon(
                  FontAwesomeIcons.building,
                  color: Colors.black54,
                  size: 52,
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      institution.name,
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

class InstitutionWidget2 extends StatelessWidget {
  const InstitutionWidget2({
    Key? key,
    required this.institution,
    required this.isUserInstitution,
    required this.onPressed,
  }) : super(key: key);

  final InstitutionProfile institution;
  final bool isUserInstitution;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
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
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: FaIcon(
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
                      institution.name,
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
