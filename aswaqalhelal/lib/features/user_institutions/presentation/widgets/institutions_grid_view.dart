import 'package:flutter/material.dart';

import '../../domain/entities/institution.dart';
import 'institution_widget.dart';

class InstitutionsGridView extends StatelessWidget {
  const InstitutionsGridView({Key? key, required this.institutions})
      : super(key: key);
  final List<Institution> institutions;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => InstitutionWidget(
        institution: institutions[index],
      ),
      itemCount: institutions.length,
    );
  }
}
