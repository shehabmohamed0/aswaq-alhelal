import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../../core/request_state.dart';
import '../../../../user_institutions/domain/entities/institution.dart';
import '../../cubit/employees/employees_cubit.dart';
import '../../cubit/job_offers/send_job_offers_cubit.dart';
import '../../cubit/recruitment/recruitment_cubit.dart';
import 'widgets/employees_tab_view.dart';
import 'widgets/job_offer_bottom_sheet.dart';
import 'widgets/offers_tab_view.dart';

class RecruitmentPage extends HookWidget {
  const RecruitmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentBottomSheetController? controller;
    final List<String> tabs = <String>['Employees', 'Offers'];
    final institution =
        ModalRoute.of(context)!.settings.arguments as Institution;

    final phoneController = useTextEditingController();
    final focusNode = useFocusNode();
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        floatingActionButton: BlocConsumer<RecruitmentCubit, RecruitmentState>(
          listenWhen: (previous, current) =>
              previous.bottomSheetOpened != current.bottomSheetOpened,
          listener: (context, state) {
            log('message');
            if (!state.bottomSheetOpened) {
              controller?.close();
            }
          },
          builder: (context, state) {
            return FloatingActionButton(
              child: Icon(state.bottomSheetOpened ? Icons.close : Icons.add),
              onPressed: () {
                if (state.bottomSheetOpened) {
                  context.read<RecruitmentCubit>().onClosed();
                  return;
                }
                context.read<RecruitmentCubit>().onOpened();
                controller = showBottomSheet(
                  context: context,
                  builder: (context) => Padding(
                      padding: EdgeInsets.zero,
                      child: Material(
                        elevation: 18,
                        color: Colors.white,
                        child: JobOfferBottomSheet(
                            phoneController: phoneController,
                            focusNode: focusNode),
                      )),
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
                );

                controller?.closed.then((_) {
                  log('then');
                  context.read<RecruitmentCubit>().onClosed();
                });
              },
            );
          },
        ),
        body: BlocListener<InstitutionJobsOffersCubit,
            InstitutionJobsOffersState>(
          listenWhen: (previous, current) =>
              previous.addJobOfferState != current.addJobOfferState,
          listener: (context, state) {
            switch (state.addJobOfferState) {
              case RequestState.idle:
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
                controller?.close();
                EasyLoading.dismiss();

                showSuccessSnackBar(context, 'Send successfuly');
                break;
              case RequestState.error:
                // controller?.close();

                showErrorSnackBar(context, state.errorMessage!);
                EasyLoading.dismiss();
                break;
            }
          },
          child: RefreshIndicator(
            notificationPredicate: (notification) {
              if (notification is OverscrollNotification || Platform.isIOS) {
                return notification.depth == 2;
              }
              return notification.depth == 0;
            },
            onRefresh: () {
              return Future.wait([
                context.read<EmployeesCubit>().getEmployees(institution.id),
                context
                    .read<InstitutionJobsOffersCubit>()
                    .getSentOffers(institution.id),
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
                      centerTitle: false,
                      title: const Text(
                          'Recruitment'), // This is the title in the app bar.
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
                    EmployeesTabView(),
                    OffersTabView(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
