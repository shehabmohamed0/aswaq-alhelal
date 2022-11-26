import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../../core/utils/dialogs.dart';
import '../../../../l10n/l10n.dart';
import '../../../../locator/locator.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../address/data/models/address_model.dart';
import '../../../address/domain/entities/address.dart';
import '../../../address/presentation/pages/addresses/widgets/address_widget.dart';
import '../../../address/presentation/pages/select_location_map/select_location_map_page.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../client_home_institutions/presentation/cubit/institutions_cubit.dart';
import '../../../client_home_institutions/presentation/widgets/institutions_widget.dart';
import '../../../notifications/presentation/widgets/notifications_bell.dart';
import '../../../owner_institutions/presentation/pages/institution/owner_institution_page.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../cubit/items/items_cubit.dart';
import 'widgets/app_drawer.dart';

part 'widgets/user_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsCubit>(
      create: (context) => locator()..getItems(),
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.profile.id != current.profile.id,
        builder: (context, state) => Scaffold(
          drawer: const AppDrawer(),
          appBar: AppBar(
            elevation: 0,
            title: state.profile.mapOrElse(
              userProfile: (user) =>
                  Text(AppLocalizations.of(context).aswaqAlhilal),
              institutionProfile: (institution) => Text(institution.name),
              orElse: () => const Text('Error'),
            ),
            actions: const [
              NotificationsBell(),
            ],
          ),
          body: state.profile.mapOrElse(
            userProfile: (user) {
              final cubit = locator<InstitutionsCubit>()
                ..getInstitutions(user.address!);
              return BlocProvider.value(
                value: cubit,
                child: UserHomeWidget(cubit: cubit),
              );
            },
            institutionProfile: (institution) => InstitutionPageBody(
              institution: institution,
            ),
            orElse: () => const Text('Error'),
          ),
        ),
      ),
    );
  }
}
