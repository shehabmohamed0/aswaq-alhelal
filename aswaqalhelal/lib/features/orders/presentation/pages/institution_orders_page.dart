import 'dart:io';

import 'package:flutter/material.dart';

const tabs = ['Pending', 'Shipping'];

class InstitutionOrdersPage extends StatelessWidget {
  const InstitutionOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length, // This is the number of tabs.
        child: Scaffold(
          body: RefreshIndicator(
            notificationPredicate: (notification) {
              if (notification is OverscrollNotification || Platform.isIOS) {
                return notification.depth == 2;
              }
              return notification.depth == 0;
            },
            onRefresh: () {
              return Future.wait([
                // context
                //     .read<EmployeesCubit>()
                //     .getEmployees(arguments.institutionId),
                // context
                //     .read<InstitutionJobsOffersCubit>()
                //     .getSentOffers(arguments.institutionId),
              ]);
            },
            child: NestedScrollView(
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
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      centerTitle: true,
                      elevation: 1,
                      title: const Text(
                          'Orders'), // This is the title in the app bar.
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
                        tabs:
                            tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ];
              },
              body: const TabBarView(
                  // These are the contents of the tab views, below the tabs.
                  children: [
                    // EmployeesTabView(),
                    // OffersTabView(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
