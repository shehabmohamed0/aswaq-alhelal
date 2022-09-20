import 'package:aswaqalhelal/core/extensions/prepare_for_search.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../domain/entities/entities.dart';
import '../DTOs/ref_address_details.dart';
import '../bloc/address_suggestions_bloc.dart';
import 'ref_address_widget.dart';

class AddressDetailsWidget extends HookWidget {
  const AddressDetailsWidget({
    Key? key,
    this.fullRefAddress,
    required this.onfullRefAddress,
    required this.onNeighborhoodUnSelected,
  }) : super(key: key);
  final RefAddressDetails? fullRefAddress;
  final Function(RefAddressDetails address) onfullRefAddress;
  final VoidCallback onNeighborhoodUnSelected;
  @override
  Widget build(BuildContext context) {
    final governateController = useTextEditingController();
    final governateFocusNode = useFocusNode();
    final cityController = useTextEditingController();
    final cityFocusNode = useFocusNode();
    final neighborhoodController = useTextEditingController();
    final neighborhoodFocusNode = useFocusNode();
    final governateBloc = context.read<GovernatesSuggestionsBloc>();
    final cityBloc = context.read<CitiesSuggestionsBloc>();
    final neighborhoodBloc = context.read<NeighborhoodsSuggestionsBloc>();

    if (fullRefAddress != null) {
      governateBloc
          .add(AddressSuggestionsEvent.initEdit(fullRefAddress!.refGovernate));
      cityBloc.add(AddressSuggestionsEvent.initEdit(fullRefAddress!.refCity));
      neighborhoodBloc.add(
          AddressSuggestionsEvent.initEdit(fullRefAddress!.refNeighborhood));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: RefAddressWidget<RefGovernate, GetGovernatesSuggestionsParams,
              AddNewGovernateParams, GovernatesSuggestionsBloc>(
            controller: governateController,
            focusNode: governateFocusNode,
            label: 'Governate',
            searchAddress: (bloc) {
              bloc.add(AddressSuggestionsEvent.searchRefAddress(
                governateController.text,
                GetGovernatesSuggestionsParams(
                  country: 'egypt',
                  searchText: governateController.text.prepareForSearch(),
                ),
              ));
            },
            addNewAddress: (bloc) {
              if (governateController.text.trim().isEmpty) return;

              bloc.add(AddressSuggestionsEvent.addRefAddress(
                AddNewGovernateParams(
                    country: 'egypt',
                    governate: governateController.text.trim(),
                    searchText: governateController.text.prepareForSearch()),
              ));
            },
            onAddressSelected: () {
              cityBloc.add(const AddressSuggestionsEvent.enabel());
            },
            onAddressUnSelected: () {
              cityBloc.add(const AddressSuggestionsEvent.unSelectRefAddress(
                  enabled: false));
              neighborhoodBloc.add(
                  const AddressSuggestionsEvent.unSelectRefAddress(
                      enabled: false));
            },
          ),
        ),
        const SizedBox(height: 8),
        RefAddressWidget<RefCity, GetCitiesSuggestionsParams, AddNewCityParams,
            CitiesSuggestionsBloc>(
          controller: cityController,
          focusNode: cityFocusNode,
          label: 'City',
          searchAddress: (bloc) {
            bloc.add(AddressSuggestionsEvent.searchRefAddress(
              cityController.text,
              GetCitiesSuggestionsParams(
                  country: 'egypt',
                  governate:
                      governateBloc.state.addressOrNull.toNullable()!.name,
                  searchText: cityController.text.prepareForSearch()),
            ));
          },
          addNewAddress: (bloc) {
            if (cityController.text.trim().isEmpty) return;
            bloc.add(
              AddressSuggestionsEvent.addRefAddress(
                AddNewCityParams(
                    country: 'egypt',
                    refGovernate:
                        governateBloc.state.addressOrNull.toNullable()!,
                    city: cityController.text.trim(),
                    searchText: cityController.text.prepareForSearch()),
              ),
            );
          },
          onAddressSelected: () {
            neighborhoodBloc.add(const AddressSuggestionsEvent.enabel());
          },
          onAddressUnSelected: () {
            neighborhoodBloc.add(
                const AddressSuggestionsEvent.unSelectRefAddress(
                    enabled: false));
          },
        ),
        const SizedBox(height: 8),
        RefAddressWidget<RefNeighborhood, GetNeighborhoodsSuggestionsParams,
            AddNewNeighborhoodParams, NeighborhoodsSuggestionsBloc>(
          controller: neighborhoodController,
          focusNode: neighborhoodFocusNode,
          label: 'Neighborhood',
          searchAddress: (bloc) {
            bloc.add(AddressSuggestionsEvent.searchRefAddress(
              neighborhoodController.text,
              GetNeighborhoodsSuggestionsParams(
                  country: 'egypt',
                  governate:
                      governateBloc.state.addressOrNull.toNullable()!.name,
                  city: cityBloc.state.addressOrNull.toNullable()!.name,
                  searchText: neighborhoodController.text.prepareForSearch()),
            ));
          },
          addNewAddress: (bloc) {
            if (neighborhoodController.text.trim().isEmpty) return;
            bloc.add(AddressSuggestionsEvent.addRefAddress(
              AddNewNeighborhoodParams(
                country: 'egypt',
                refGovernate: governateBloc.state.addressOrNull.toNullable()!,
                refCity: cityBloc.state.addressOrNull.toNullable()!,
                neighborhood: neighborhoodController.text.trim(),
                searchText: neighborhoodController.text.prepareForSearch(),
              ),
            ));
          },
          onAddressSelected: () {
            final fullAddressDetails = RefAddressDetails(
                refGovernate: governateBloc.state.addressOrNull.toNullable()!,
                refCity: cityBloc.state.addressOrNull.toNullable()!,
                refNeighborhood:
                    neighborhoodBloc.state.addressOrNull.toNullable()!);

            onfullRefAddress(fullAddressDetails);
          },
          onAddressUnSelected: () {
            onNeighborhoodUnSelected();
          },
        ),
      ],
    );
  }
}
