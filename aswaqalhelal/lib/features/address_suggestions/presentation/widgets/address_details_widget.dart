import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../domain/entities/entities.dart';
import '../DTOs/ref_address_details.dart';
import '../bloc/address_suggestions2_bloc.dart';
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
          .add(AddressSuggestions2Event.initEdit(fullRefAddress!.refGovernate));
      cityBloc.add(AddressSuggestions2Event.initEdit(fullRefAddress!.refCity));
      neighborhoodBloc.add(
          AddressSuggestions2Event.initEdit(fullRefAddress!.refNeighborhood));
    }
    return Theme(
      data: ThemeData(
        primaryColor: Theme.of(context).primaryColor,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Theme.of(context).primaryColor),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: RefAddressWidget<
                RefGovernate,
                GetGovernatesSuggestionsParams,
                AddNewGovernateParams,
                GovernatesSuggestionsBloc>(
              controller: governateController,
              focusNode: governateFocusNode,
              label: 'Governate',
              searchAddress: (bloc) {
                bloc.add(AddressSuggestions2Event.searchRefAddress(
                  governateController.text,
                  GetGovernatesSuggestionsParams(
                    country: 'egypt',
                    searchText: governateController.text,
                  ),
                ));
              },
              addNewAddress: (bloc) {
                bloc.add(AddressSuggestions2Event.addRefAddress(
                  AddNewGovernateParams(
                      country: 'egypt', governate: governateController.text),
                ));
              },
              onAddressSelected: () {
                cityBloc.add(const AddressSuggestions2Event.enabel());
              },
              onAddressUnSelected: () {
                cityBloc.add(const AddressSuggestions2Event.unSelectRefAddress(
                    enabled: false));
                neighborhoodBloc.add(
                    const AddressSuggestions2Event.unSelectRefAddress(
                        enabled: false));
              },
            ),
          ),
          const SizedBox(height: 8),
          RefAddressWidget<RefCity, GetCitiesSuggestionsParams,
              AddNewCityParams, CitiesSuggestionsBloc>(
            controller: cityController,
            focusNode: cityFocusNode,
            label: 'City',
            searchAddress: (bloc) {
              bloc.add(AddressSuggestions2Event.searchRefAddress(
                cityController.text,
                GetCitiesSuggestionsParams(
                    country: 'egypt',
                    governate:
                        governateBloc.state.addressOrNull.toNullable()!.name,
                    searchText: cityController.text),
              ));
            },
            addNewAddress: (bloc) {
              bloc.add(
                AddressSuggestions2Event.addRefAddress(
                  AddNewCityParams(
                      country: 'egypt',
                      refGovernate:
                          governateBloc.state.addressOrNull.toNullable()!,
                      city: cityController.text),
                ),
              );
            },
            onAddressSelected: () {
              neighborhoodBloc.add(const AddressSuggestions2Event.enabel());
            },
            onAddressUnSelected: () {
              neighborhoodBloc.add(
                  const AddressSuggestions2Event.unSelectRefAddress(
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
              bloc.add(AddressSuggestions2Event.searchRefAddress(
                neighborhoodController.text,
                GetNeighborhoodsSuggestionsParams(
                    country: 'egypt',
                    governate:
                        governateBloc.state.addressOrNull.toNullable()!.name,
                    city: cityBloc.state.addressOrNull.toNullable()!.name,
                    searchText: neighborhoodController.text),
              ));
            },
            addNewAddress: (bloc) {
              bloc.add(AddressSuggestions2Event.addRefAddress(
                AddNewNeighborhoodParams(
                    country: 'egypt',
                    refGovernate:
                        governateBloc.state.addressOrNull.toNullable()!,
                    refCity: cityBloc.state.addressOrNull.toNullable()!,
                    neighborhood: neighborhoodController.text),
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
      ),
    );
  }
}
