import 'package:aswaqalhelal/features/institutions/presentation/cubit/institutions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../institutions/presentation/widgets/institutions_widget.dart';
import '../../../notifications/presentation/widgets/notifications_bell.dart';
import '../../../user_institutions/presentation/pages/institution/user_institution_page.dart';
import '../cubit/items/items_cubit.dart';
import 'widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsCubit>(
      create: (context) => locator()..getItems(),
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.profile != current.profile,
        builder: (context, state) {
          return Scaffold(
              drawer: const AppDrawer(),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).aswaqLhelal),
                elevation: 0,
                actions: const [NotificationsBell()],
              ),
              body: state.profile.fold((user) {
                final cubit = locator<InstitutionsCubit>()
                  ..getInstitutions(user.address!);
                return BlocProvider.value(
                  value: cubit,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      cubit.getInstitutions(user.address!);
                    },
                    child: const CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverToBoxAdapter(
                            child: Text('Institutions',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        InstitutionsSliverWidget()
                      ],
                    ),
                  ),
                );
              },
                  (institution) =>
                      InstitutionPageBody(institution: institution)));
        },
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }
}
