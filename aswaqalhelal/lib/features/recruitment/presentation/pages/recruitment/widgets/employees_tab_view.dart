import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import '../../../../../../core/request_state.dart';
import '../../../../../user_institutions/domain/entities/institution.dart';
import '../../../../../widgets/check_internet_connection_widget.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/loading_widget.dart';
import '../../../cubit/employees/employees_cubit.dart';
import '../DTOs/recruitment_page_arguments.dart';
import 'employee_list_tile.dart';

class EmployeesTabView extends StatelessWidget {
  const EmployeesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as RecruitmentPageArguments;

    return SafeArea(
      top: false,
      bottom: false,
      child: BlocConsumer<EmployeesCubit, EmployeesState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.employeesState) {
            case RequestState.initial:
              return kEmptyWidget;
            case RequestState.loading:
              return const LoadingWidget();
            case RequestState.error:
              return CheckInternetConnection(onPressed: () {
                context.read<EmployeesCubit>().getEmployees(arguments.institutionId);
              });
            case RequestState.loaded:
              if (state.employees.isEmpty) {
                return const Center(
                  child: Text('No Employees yet'),
                );
              }
              return CustomScrollView(
                // The "controller" and "primary" members should be left
                // unset, so that the NestedScrollView can control this
                // inner scroll view.
                // If the "controller" property is set, then this scroll
                // view will not be associated with the NestedScrollView.
                // The PageStorageKey should be unique to this ScrollView;
                // it allows the list to remember its scroll position when
                // the tab view is not on the screen.
                key: const PageStorageKey<String>('Offers'),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    // This is the flip side of the SliverOverlapAbsorber
                    // above.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    // In this example, the inner scroll view has
                    // fixed-height list items, hence the use of
                    // SliverFixedExtentList. However, one could use any
                    // sliver widget here, e.g. SliverList or SliverGrid.
                    sliver: SliverList(
                      // The items in this example are fixed to 48 pixels
                      // high. This matches the Material Design spec for
                      // ListTile widgets.
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          // This builder is called for each child.
                          // In this example, we just number each list item.
                          return EmployeeListTile(
                              employee: state.employees[index]);
                        },

                        // The childCount of the SliverChildBuilderDelegate
                        // specifies how many children this inner list
                        // has. In this example, each tab has a list of
                        // exactly 30 items, but this is arbitrary.
                        childCount: state.employees.length,
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
