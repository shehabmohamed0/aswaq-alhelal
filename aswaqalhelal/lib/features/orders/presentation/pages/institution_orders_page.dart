import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../core/request_state.dart';
import '../../../../l10n/l10n.dart';
import '../cubit/cubit/institution_orders_cubit.dart';
import 'widgets/pending_tab_view.dart';
import 'widgets/processing_tab_view.dart';

const tabs = ['Pending', 'Processing'];

class InstitutionOrdersPage extends StatelessWidget {
  const InstitutionOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length, // This is the number of tabs.
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                  // This widget takes the overlapping behavior of the SliverAppBar,
                  // and redirects it to the SliverOverlapInjector below. If it is
                  // missing, then it is possible for the nested "inner" scroll view
                  // below to end up under the SliverAppBar even when the inner
                  // scroll view thinks it has not been scrolled.
                  // This is not necessary if the "headerSliverBuilder" only builds
                  // widgets that do not overlap the next sliver.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    centerTitle: true,
                    elevation: 1,

                    title: Text(AppLocalizations.of(context)
                        .orders), // This is the title in the app bar.
                    pinned: true,
                    floating: true,
                    // The "forceElevated" property causes the SliverAppBar to show
                    // a shadow. The "innerBoxIsScrolled" parameter is true when the
                    // inner scroll view is scrolled beyond its "zero" point, i.e.
                    // when it appears to be scrolled below the SliverAppBar.
                    // Without this, there are cases where the shadow would appear
                    // or not appear inappropriately, because the SliverAppBar is
                    // not actually aware of the precise position of the inner
                    // scroll views.
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      // These are the widgets to put in each tab in the tab bar.
                      tabs: tabs.map((String name) => Tab(text: name)).toList(),
                    ),
                  ),
                ),
              ];
            },
            body: BlocListener<InstitutionOrdersCubit, InstitutionOrdersState>(
              listenWhen: (previous, current) =>
                  previous.updateState != current.updateState,
              listener: (context, state) {
                switch (state.updateState) {
                  case RequestState.initial:
                    break;
                  case RequestState.loading:
                    EasyLoading.show(
                        indicator: const FittedBox(
                      child: SpinKitRipple(
                        duration: Duration(milliseconds: 1200),
                        color: Colors.white,
                      ),
                    ));
                    break;
                  case RequestState.loaded:
                    EasyLoading.dismiss();
                    break;
                  case RequestState.error:
                    EasyLoading.dismiss();
                    showErrorSnackBar(context, state.errorMessage);
                    break;
                }
              },
              child: const TabBarView(

                  // These are the contents of the tab views, below the tabs.
                  children: [PendingTabView(), ProcessingTabView()]),
            ),
          ),
        ),
      ),
    );
  }
}
