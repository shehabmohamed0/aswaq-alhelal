import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../domain/entities/institution.dart';

class InstitutionPage extends StatelessWidget {
  const InstitutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppBloc>();
    final institution =
        ModalRoute.of(context)!.settings.arguments as Institution;
    return Scaffold(
      appBar: AppBar(
        title: Text(institution.officialName),
      ),
      body: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.institutionItems,
                    arguments: institution.id);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                child: const Text('Items'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
