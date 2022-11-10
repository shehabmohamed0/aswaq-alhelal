import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:flutter/material.dart';

import 'institution_widget.dart';

class InstitutionsGridView extends StatelessWidget {
  const InstitutionsGridView(
      {Key? key,
      required this.institutions,
      required this.userId,
      required this.onPressed})
      : super(key: key);
  final List<InstitutionProfile> institutions;
  final String userId;
  final void Function(InstitutionProfile institution) onPressed;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => InstitutionWidget(
        institution: institutions[index],
        isUserInstitution: institutions[index].id == userId,
        onPressed: () {
          onPressed(institutions[index]);
        },
      ),
      itemCount: institutions.length,
    );
  }
}
