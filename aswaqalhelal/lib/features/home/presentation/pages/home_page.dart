import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../../l10n/l10n.dart';
import '../../../address/data/models/address_model.dart';
import '../../../address/domain/entities/address.dart';
import '../../../address/presentation/pages/addresses/widgets/address_widget.dart';
import '../../../address/presentation/pages/select_location_map/select_location_map_page.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../institutions/presentation/cubit/institutions_cubit.dart';
import '../../../institutions/presentation/widgets/institutions_widget.dart';
import '../../../notifications/presentation/widgets/notifications_bell.dart';
import '../../../user_institutions/presentation/pages/institution/owner_institution_page.dart';
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
        buildWhen: (previous, current) {
          return previous.profile.id != current.profile.id;
        },
        builder: (context, state) {
          return Scaffold(
              drawer: const AppDrawer(),
              appBar: AppBar(
                title: state.profile.fold(
                    (user) => Text(AppLocalizations.of(context).aswaqAlhilal),
                    (institution) => Text(institution.name)),
                elevation: 0,
                actions: const [NotificationsBell()],
              ),
              body: state.profile.fold((user) {
                final cubit = locator<InstitutionsCubit>()
                  ..getInstitutions(user.address!);
                return BlocProvider.value(
                  value: cubit,
                  child: UserHomeWidget(cubit: cubit),
                );
              },
                  (institution) =>
                      InstitutionPageBody(institution: institution)));
        },
      ),
    );
  }
}




