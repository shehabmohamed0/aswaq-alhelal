import 'dart:io';

import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:aswaqalhelal/widgets/snack_bar.dart';

import '../../../../../core/request_state.dart';
import '../../../../../l10n/l10n.dart';
import '../../cubit/employees/employees_cubit.dart';
import '../../cubit/job_offers/send_job_offers_cubit.dart';
import '../../cubit/recruitment/recruitment_cubit.dart';
import 'DTOs/recruitment_page_arguments.dart';
import 'widgets/employees_tab_view.dart';
import 'widgets/job_offer_bottom_sheet.dart';
import 'widgets/offers_tab_view.dart';

class RecruitmentPage extends HookWidget {
  const RecruitmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentBottomSheetController? controller;
    final List<String> tabs = <String>[
      AppLocalizations.of(context).employees,
      AppLocalizations.of(context).offers
    ];
    final arguments =
        ModalRoute.of(context)!.settings.arguments as RecruitmentPageArguments;

    final phoneController = useTextEditingController();
    final focusNode = useFocusNode();
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        floatingActionButton: BlocConsumer<RecruitmentCubit, RecruitmentState>(
          listenWhen: (previous, current) =>
              previous.bottomSheetOpened != current.bottomSheetOpened,
          listener: (context, state) {
            if (!state.bottomSheetOpened) {
              controller?.close();
            }
          },
          builder: (context, state) {
            return FloatingActionButton(
              child: Icon(
                state.bottomSheetOpened ? Icons.close : Icons.add,
                color: Colors.white,
              ),
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
              case RequestState.initial:
                break;
              case RequestState.loading:
                showLoadingDialog();
                

                break;
              case RequestState.loaded:
                controller?.close();
                dismissLoadingDialog();
                showSuccessSnackBar(
                    context, AppLocalizations.of(context).sendSuccessfuly);
                break;
              case RequestState.error:
                // controller?.close();

                showErrorSnackBar(context, state.errorMessage!);
                dismissLoadingDialog();
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
                context
                    .read<EmployeesCubit>()
                    .getEmployees(arguments.institutionId),
                context
                    .read<InstitutionJobsOffersCubit>()
                    .getSentOffers(arguments.institutionId),
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
                      title: Text(AppLocalizations.of(context)
                          .recruitment), // This is the title in the app bar.
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
