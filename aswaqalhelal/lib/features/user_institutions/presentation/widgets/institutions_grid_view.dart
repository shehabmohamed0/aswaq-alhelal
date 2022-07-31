import 'package:flutter/material.dart';

import '../../domain/entities/institution.dart';
import 'institution_widget.dart';

class InstitutionsGridView extends StatelessWidget {
  const InstitutionsGridView({
    Key? key,
    required this.institutions,
    required this.userId,
  }) : super(key: key);
  final List<Institution> institutions;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => InstitutionWidget(
          institution: institutions[index],
          isUserInstitution: institutions[index].id == userId),
      itemCount: institutions.length,
    );
  }
}
