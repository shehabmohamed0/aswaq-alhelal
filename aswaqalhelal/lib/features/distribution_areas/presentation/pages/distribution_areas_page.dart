import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../l10n/l10n.dart';
import '../../../address_suggestions/domain/entities/entities.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../bloc/distribution_areas_bloc.dart';

class DistributionAreasPage extends HookWidget {
  const DistributionAreasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final governateController = useTextEditingController();
    final cityController = useTextEditingController();
    final neighborhoodController = useTextEditingController();

    final governateFocusNode = useFocusNode();
    final cityFocusNode = useFocusNode();
    final neighborhoodFocusNode = useFocusNode();
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;

    final bloc = context.read<DistributionAreasBloc>();
    return BlocConsumer<DistributionAreasBloc, DistributionAreasState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {},
      buildWhen: (previous, current) =>
          previous.status != current.status &&
          (current.status == DistributionAreasStatus.distributionAreasloading ||
              current.status ==
                  DistributionAreasStatus.distributionArealoaded ||
              current.status == DistributionAreasStatus.error),
      builder: (context, state) {
        switch (state.status) {
          case DistributionAreasStatus.distributionAreasloading:
            return const Center(child: CircularProgressIndicator());
          case DistributionAreasStatus.error:
            return CheckInternetConnection(onPressed: () {
              context
                  .read<DistributionAreasBloc>()
                  .add(LoadDistributionAreas(institution.id));
            });
          default:
            return Scaffold(
              appBar: AppBar(
                title: Text(intl.distributionAreas),
              ),
              body: Theme(
                data: ThemeData(
                  primaryColor: Theme.of(context).primaryColor,
                  colorScheme: Theme.of(context)
                      .colorScheme
                      .copyWith(primary: Theme.of(context).primaryColor),
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(),
                  ),
                ),
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<DistributionAreasBloc, DistributionAreasState>(
                      listenWhen: (previous, current) =>
                          previous.status != current.status,
                      listener: (context, state) {
                        switch (state.status) {
                          case DistributionAreasStatus.loading:
                            EasyLoading.show(
                              indicator: const FittedBox(
                                child: SpinKitRipple(
                                    duration: Duration(milliseconds: 1200),
                                    color: Colors.white),
                              ),
                              dismissOnTap: false,
                            );
                            break;
                          case DistributionAreasStatus.success:
                            EasyLoading.dismiss();
                            break;
                          case DistributionAreasStatus.failure:
                            EasyLoading.dismiss();
                            showErrorSnackBar(context, state.errorMessage!);
                            break;
                          default:
                        }
                      },
                    ),
                    BlocListener<DistributionAreasBloc, DistributionAreasState>(
                      listenWhen: (previous, current) =>
                          previous.addressStatus != current.addressStatus,
                      listener: (context, state) {
                        switch (state.addressStatus) {
                          case AddressSuggestionsStatus.initial:
                            break;
                          case AddressSuggestionsStatus.governateSelected:
                            governateFocusNode.unfocus();
                            break;
                          case AddressSuggestionsStatus.citySelected:
                            cityFocusNode.unfocus();
                            break;
                          case AddressSuggestionsStatus.neighborhoodSelected:
                            neighborhoodFocusNode.unfocus();
                            //                        _checkGeoPointAndUpdateAddress(context, state);

                            break;
                          case AddressSuggestionsStatus.governateUnSelected:
                            governateFocusNode.unfocus();
                            cityFocusNode.unfocus();
                            neighborhoodFocusNode.unfocus();
                            governateController.clear();
                            cityController.clear();
                            neighborhoodController.clear();
                            break;
                          case AddressSuggestionsStatus.cityUnSelected:
                            cityFocusNode.unfocus();
                            neighborhoodFocusNode.unfocus();
                            cityController.clear();
                            neighborhoodController.clear();
                            break;
                          case AddressSuggestionsStatus.neighborhoodUnSelected:
                            neighborhoodFocusNode.unfocus();
                            neighborhoodController.clear();
                            break;
                          case AddressSuggestionsStatus.loading:
                            EasyLoading.show(
                              indicator: const FittedBox(
                                child: SpinKitRipple(
                                  duration: Duration(milliseconds: 1200),
                                  color: Colors.white,
                                ),
                              ),
                              dismissOnTap: false,
                            );
                            break;
                          case AddressSuggestionsStatus.addingGovernateSucess:
                            governateFocusNode.unfocus();
                            EasyLoading.dismiss();
                            break;
                          case AddressSuggestionsStatus.addingCitySuccess:
                            cityFocusNode.unfocus();
                            EasyLoading.dismiss();
                            break;
                          case AddressSuggestionsStatus
                              .addingNeighborhoodSuccess:
                            neighborhoodFocusNode.unfocus();
                            EasyLoading.dismiss();
                            // _checkGeoPointAndUpdateAddress(context, state);

                            break;
                        }
                      },
                    ),
                  ],
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        BlocBuilder<DistributionAreasBloc,
                            DistributionAreasState>(
                          buildWhen: (p, c) =>
                              p.governateOrNull != c.governateOrNull ||
                              p.governateSearch != c.governateSearch ||
                              p.governatesSuggestionState !=
                                  c.governatesSuggestionState ||
                              p.governatesSuggestions !=
                                  c.governatesSuggestions,
                          builder: (context, state) {
                            final bloc = context.read<DistributionAreasBloc>();

                            return AutoSuggestTextField<RefGovernate>(
                              controller: governateController,
                              focusNode: governateFocusNode,
                              labelText: intl.governate,
                              onChanged: (searctText) {
                                bloc.add(DistributionAreasEvent.searchGovernate(
                                    searctText));
                              },
                              suggestionState: state.governatesSuggestionState,
                              suggestions: state.governatesSuggestions,
                              suggestionBuilder: (context, governate) =>
                                  ListTile(
                                leading: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                title: Text(governate.name),
                              ),
                              onSuggestionSelected: (governate) {
                                governateController.text = governate.name;
                                bloc.add(DistributionAreasEvent.selectGovernate(
                                    governate));
                              },
                              onEmptyWidgetClicked: () {
                                if (governateController.text.trim().isEmpty)
                                  return;
                                bloc.add(DistributionAreasEvent.addNewGovernate(
                                    governateController.text.trim()));
                              },
                              enabled: state.governateOrNull.isNone(),
                              showRemoveButton: state.governateOrNull.isSome(),
                              onRemoveSelection: () {
                                bloc.add(const DistributionAreasEvent
                                    .unSelectGovernate());
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<DistributionAreasBloc,
                            DistributionAreasState>(
                          buildWhen: (p, c) =>
                              p.cityOrNull != c.cityOrNull ||
                              p.citySearch != c.citySearch ||
                              p.citiesSuggestionState !=
                                  c.citiesSuggestionState ||
                              p.citiesSuggestions != c.citiesSuggestions ||
                              p.governateOrNull != c.governateOrNull,
                          builder: (context, state) {
                            final bloc = context.read<DistributionAreasBloc>();
                            return AutoSuggestTextField<RefCity>(
                              controller: cityController,
                              focusNode: cityFocusNode,
                              labelText: intl.city,
                              onChanged: (searchText) {
                                bloc.add(DistributionAreasEvent.searchCity(
                                    searchText));
                              },
                              suggestionState: state.citiesSuggestionState,
                              suggestions: state.citiesSuggestions,
                              suggestionBuilder: (context, city) => ListTile(
                                leading: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                title: Text(city.name),
                              ),
                              onSuggestionSelected: (city) {
                                cityController.text = city.name;
                                bloc.add(
                                    DistributionAreasEvent.selectCity(city));
                              },
                              onEmptyWidgetClicked: () {
                                if (cityController.text.trim().isEmpty) return;
                                bloc.add(DistributionAreasEvent.addNewCity(
                                  cityController.text.trim(),
                                ));
                              },
                              enabled: state.governateOrNull.isSome() &&
                                  state.cityOrNull.isNone(),
                              showRemoveButton: state.cityOrNull.isSome(),
                              onRemoveSelection: () {
                                bloc.add(const DistributionAreasEvent
                                    .unSelectCity());
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<DistributionAreasBloc,
                            DistributionAreasState>(
                          buildWhen: (p, c) =>
                              p.neighborhoodOrNull != c.neighborhoodOrNull ||
                              p.neighborhoodSearch != c.neighborhoodSearch ||
                              p.neighborhoodsSuggestionState !=
                                  c.neighborhoodsSuggestionState ||
                              p.neighborhoodsSuggestions !=
                                  c.neighborhoodsSuggestions ||
                              p.cityOrNull != c.cityOrNull,
                          builder: (context, state) {
                            final bloc = context.read<DistributionAreasBloc>();
                            return AutoSuggestTextField<RefNeighborhood>(
                              controller: neighborhoodController,
                              focusNode: neighborhoodFocusNode,
                              labelText: intl.neighborhoodVillage,
                              onChanged: (searchText) {
                                bloc.add(
                                    DistributionAreasEvent.searchNeighborhood(
                                        searchText));
                              },
                              suggestionState:
                                  state.neighborhoodsSuggestionState,
                              suggestions: state.neighborhoodsSuggestions,
                              suggestionBuilder: (context, neighborhood) =>
                                  ListTile(
                                leading: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                title: Text(neighborhood.name),
                              ),
                              onSuggestionSelected: (neighborhood) {
                                neighborhoodController.text = neighborhood.name;
                                bloc.add(
                                    DistributionAreasEvent.selectNeighborhood(
                                        neighborhood));
                              },
                              onEmptyWidgetClicked: () {
                                if (neighborhoodController.text.trim().isEmpty)
                                  return;

                                bloc.add(
                                    DistributionAreasEvent.addNewNeighborhood(
                                        neighborhoodController.text.trim()));
                              },
                              enabled: state.cityOrNull.isSome() &&
                                  state.neighborhoodOrNull.isNone(),
                              showRemoveButton:
                                  state.neighborhoodOrNull.isSome(),
                              onRemoveSelection: () {
                                bloc.add(const DistributionAreasEvent
                                    .unSelectNeighborhood());
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(intl.add),
                            onPressed: () {
                              context.read<DistributionAreasBloc>().add(
                                  DistributionAreasEvent.addDistributionAreas(
                                      institution.id));
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: BlocBuilder<DistributionAreasBloc,
                              DistributionAreasState>(
                            buildWhen: (previous, current) =>
                                previous.distribtionAreas !=
                                current.distribtionAreas,
                            builder: (context, state) {
                              if (state.distribtionAreas.isEmpty) {
                                return const SizedBox.shrink();
                              }
                              return FittedBox(
                                child: DataTable(
                                    horizontalMargin: 12,
                                    columnSpacing: 27,
                                    showCheckboxColumn: true,
                                    onSelectAll: (s) {},
                                    columns: [
                                      const DataColumn(
                                        label: Text(''),
                                      ),
                                      DataColumn(label: Text(intl.governate)),
                                      DataColumn(label: Text(intl.city)),
                                      DataColumn(
                                          label: Text(intl.neighborhood)),
                                    ],
                                    rows: state.distribtionAreas
                                        .map(
                                          (distributionArea) => DataRow(
                                            cells: [
                                              DataCell(
                                                const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ),
                                                onTap: () {
                                                  bloc.add(
                                                    DistributionAreasEvent
                                                        .deleteDistributionAreas(
                                                      institution.id,
                                                      distributionArea,
                                                    ),
                                                  );
                                                },
                                              ),
                                              DataCell(Text(
                                                  distributionArea.governate)),
                                              DataCell(Text(
                                                  distributionArea.city ??
                                                      intl.all)),
                                              DataCell(Text(distributionArea
                                                      .neighborhood ??
                                                  intl.all)),
                                            ],
                                          ),
                                        )
                                        .toList()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
