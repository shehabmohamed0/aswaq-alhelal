import 'package:flutter/material.dart';
import 'package:geo_logic/features/domain/entities/geo_point.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';

import '../../../../../address_suggestions/domain/entities/ref_city.dart';
import '../../../../../address_suggestions/domain/entities/ref_district.dart';
import '../../../../../address_suggestions/domain/entities/ref_governate.dart';
import '../../../../../address_suggestions/presentation/DTOs/address_details.dart';
import '../../../../../address_suggestions/presentation/bloc/address_suggestions_bloc.dart';
import '../../../../../address_suggestions/presentation/cubit/cubit/location_widget_cubit.dart';
import '../../../../../address_suggestions/presentation/widgets/location_widget.dart';
import '../../../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';

class AddUpdateAddressWidget extends HookWidget {
  const AddUpdateAddressWidget({
    Key? key,
    required this.onAddressDetailsChanged,
  }) : super(key: key);
  final void Function(AddressDetails addressDetails) onAddressDetailsChanged;
  @override
  Widget build(BuildContext context) {
    final governateController = useTextEditingController();
    final cityController = useTextEditingController();
    final neighborhoodController = useTextEditingController();

    final governateFocusNode = useFocusNode();
    final cityFocusNode = useFocusNode();
    final neighborhoodFocusNode = useFocusNode();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AddressSuggestionsBloc>(
          create: (context) => locator(),
        ),
        BlocProvider<LocationWidgetCubit>(
          create: (context) => locator(),
        ),
      ],
      child: BlocListener<AddressSuggestionsBloc, AddressSuggestionsState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          switch (state.status) {
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
              EasyLoading.dismiss();
              _getAddressDetailsFromGeoPointAndData(context, state);

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
            case AddressSuggestionsStatus.addingNeighborhoodSuccess:
              neighborhoodFocusNode.unfocus();
              EasyLoading.dismiss();
              _getAddressDetailsFromGeoPointAndData(context, state);
              break;
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AddressSuggestionsBloc, AddressSuggestionsState>(
                buildWhen: (p, c) =>
                    p.governateOrNull != c.governateOrNull ||
                    p.governateSearch != c.governateSearch ||
                    p.governatesSuggestionState !=
                        c.governatesSuggestionState ||
                    p.governatesSuggestions != c.governatesSuggestions,
                builder: (context, state) {
                  final bloc = context.read<AddressSuggestionsBloc>();

                  return AutoSuggestTextField<RefGovernate>(
                    controller: governateController,
                    focusNode: governateFocusNode,
                    labelText: 'Governate',
                    onChanged: (searctText) {
                      bloc.add(
                          AddressSuggestionsEvent.searchGovernate(searctText));
                    },
                    suggestionState: state.governatesSuggestionState,
                    suggestions: state.governatesSuggestions,
                    suggestionBuilder: (context, governate) => ListTile(
                      leading: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      title: Text(governate.governate),
                    ),
                    onSuggestionSelected: (governate) {
                      governateController.text = governate.governate;
                      bloc.add(
                          AddressSuggestionsEvent.selectGovernate(governate));
                    },
                    onEmptyWidgetClicked: () {
                      bloc.add(AddressSuggestionsEvent.addNewGovernate(
                          governateController.text));
                    },
                    enabled: state.governateOrNull.isNone(),
                    showRemoveButton: state.governateOrNull.isSome(),
                    onRemoveSelection: () {
                      bloc.add(
                          const AddressSuggestionsEvent.unSelectGovernate());
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AddressSuggestionsBloc, AddressSuggestionsState>(
                buildWhen: (p, c) =>
                    p.cityOrNull != c.cityOrNull ||
                    p.citySearch != c.citySearch ||
                    p.citiesSuggestionState != c.citiesSuggestionState ||
                    p.citiesSuggestions != c.citiesSuggestions ||
                    p.governateOrNull != c.governateOrNull,
                builder: (context, state) {
                  final bloc = context.read<AddressSuggestionsBloc>();
                  return AutoSuggestTextField<RefCity>(
                    controller: cityController,
                    focusNode: cityFocusNode,
                    labelText: 'City',
                    onChanged: (searchText) {
                      bloc.add(AddressSuggestionsEvent.searchCity(searchText));
                    },
                    suggestionState: state.citiesSuggestionState,
                    suggestions: state.citiesSuggestions,
                    suggestionBuilder: (context, city) => ListTile(
                      leading: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      title: Text(city.city),
                    ),
                    onSuggestionSelected: (city) {
                      cityController.text = city.city;
                      bloc.add(AddressSuggestionsEvent.selectCity(city));
                    },
                    onEmptyWidgetClicked: () {
                      bloc.add(AddressSuggestionsEvent.addNewCity(
                          cityController.text));
                    },
                    enabled: state.governateOrNull.isSome() &&
                        state.cityOrNull.isNone(),
                    showRemoveButton: state.cityOrNull.isSome(),
                    onRemoveSelection: () {
                      bloc.add(const AddressSuggestionsEvent.unSelectCity());
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AddressSuggestionsBloc, AddressSuggestionsState>(
                buildWhen: (p, c) =>
                    p.neighborhoodOrNull != c.neighborhoodOrNull ||
                    p.neighborhoodSearch != c.neighborhoodSearch ||
                    p.neighborhoodsSuggestionState !=
                        c.neighborhoodsSuggestionState ||
                    p.neighborhoodsSuggestions != c.neighborhoodsSuggestions ||
                    p.cityOrNull != c.cityOrNull,
                builder: (context, state) {
                  final bloc = context.read<AddressSuggestionsBloc>();
                  return AutoSuggestTextField<RefNeighborhood>(
                    controller: neighborhoodController,
                    focusNode: neighborhoodFocusNode,
                    labelText: 'Neighborhood / Village',
                    onChanged: (searchText) {
                      bloc.add(AddressSuggestionsEvent.searchNeighborhood(
                          searchText));
                    },
                    suggestionState: state.neighborhoodsSuggestionState,
                    suggestions: state.neighborhoodsSuggestions,
                    suggestionBuilder: (context, neighborhood) => ListTile(
                      leading: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      title: Text(neighborhood.neighborhood),
                    ),
                    onSuggestionSelected: (neighborhood) {
                      neighborhoodController.text = neighborhood.neighborhood;
                      bloc.add(AddressSuggestionsEvent.selectNeighborhood(
                          neighborhood));
                    },
                    onEmptyWidgetClicked: () {
                      bloc.add(AddressSuggestionsEvent.addNewNeighborhood(
                          neighborhoodController.text));
                    },
                    enabled: state.cityOrNull.isSome() &&
                        state.neighborhoodOrNull.isNone(),
                    showRemoveButton: state.neighborhoodOrNull.isSome(),
                    onRemoveSelection: () {
                      bloc.add(
                          const AddressSuggestionsEvent.unSelectNeighborhood());
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Builder(builder: (context) {
                return LocationWidget(
                  onGeoPointSelected: (geoPoint) {
                    final suggestionState =
                        context.read<AddressSuggestionsBloc>().state;
                    if (_neighborhoodIsNotNull(suggestionState)) {
                      final addressDetails = _getAddressDetailsGeoPointChanged(
                          suggestionState, geoPoint);

                      onAddressDetailsChanged(addressDetails);
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  void _getAddressDetailsFromGeoPointAndData(
      BuildContext context, AddressSuggestionsState state) {
    final locationState =
        context.select((LocationWidgetCubit value) => value.state);
    if (_geoPointIsNotNull(locationState)) {
      final addressDetails =
          _getAddressDetailsRefDataChanged(state, locationState);
      onAddressDetailsChanged(addressDetails);
    }
  }

  AddressDetails _getAddressDetailsGeoPointChanged(
      AddressSuggestionsState suggestionState, GeoPoint geoPoint) {
    return AddressDetails(
      refGovernate: suggestionState.governateOrNull.toNullable()!,
      refCity: suggestionState.cityOrNull.toNullable()!,
      refNeighborhood: suggestionState.neighborhoodOrNull.toNullable()!,
      geoPoint: geoPoint,
    );
  }

  AddressDetails _getAddressDetailsRefDataChanged(
      AddressSuggestionsState state, LocationWidgetState locationState) {
    return AddressDetails(
      refGovernate: state.governateOrNull.toNullable()!,
      refCity: state.cityOrNull.toNullable()!,
      refNeighborhood: state.neighborhoodOrNull.toNullable()!,
      geoPoint: locationState.geoPointOrNull.toNullable()!,
    );
  }

  bool _geoPointIsNotNull(LocationWidgetState locationState) =>
      locationState.geoPointOrNull.isSome();

  bool _neighborhoodIsNotNull(AddressSuggestionsState suggestionState) =>
      suggestionState.neighborhoodOrNull.isSome();
}
