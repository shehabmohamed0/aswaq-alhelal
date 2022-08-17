import 'package:aswaqalhelal/features/address_suggestions/presentation/DTOs/full_ref_address.dart';
import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import '../../../../core/params/address_suggestion/params.dart';
import '../../domain/entities/entities.dart';
import '../bloc/address_suggestions2_bloc.dart';
import 'ref_address_widget.dart';

class AddressDetailsWidget extends HookWidget {
  const AddressDetailsWidget({
    Key? key,
    this.fullRefAddress,
  }) : super(key: key);
  final FullRefAddress? fullRefAddress;

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RefAddressWidget<RefGovernate, GovernatesSuggestionsBloc>(
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
            cityBloc.add(const AddressSuggestions2Event.unSelectRefAddress());
            neighborhoodBloc
                .add(const AddressSuggestions2Event.unSelectRefAddress());
          },
        ),
        RefAddressWidget<RefCity, CitiesSuggestionsBloc>(
          controller: cityController,
          focusNode: cityFocusNode,
          label: 'City',
          searchAddress: (bloc) {
            bloc.add(AddressSuggestions2Event.searchRefAddress(
              governateController.text,
              GetCitiesSuggestionsParams(
                  country: 'egypt',
                  governate:
                      governateBloc.state.addressOrNull.toNullable()!.name,
                  searchText: governateController.text),
            ));
          },
          addNewAddress: (bloc) {
            bloc.add(AddressSuggestions2Event.addRefAddress(
              AddNewCityParams(
                  country: 'egypt',
                  refGovernate: governateBloc.state.addressOrNull.toNullable()!,
                  city: cityController.text),
            ));
          },
          onAddressSelected: () {
            neighborhoodBloc.add(const AddressSuggestions2Event.enabel());
          },
          onAddressUnSelected: () {
            neighborhoodBloc
                .add(const AddressSuggestions2Event.unSelectRefAddress());
          },
        ),
        RefAddressWidget<RefNeighborhood, NeighborhoodsSuggestionsBloc>(
          controller: neighborhoodController,
          focusNode: neighborhoodFocusNode,
          label: 'Neighborhood',
          searchAddress: (bloc) {
            bloc.add(AddressSuggestions2Event.searchRefAddress(
              governateController.text,
              GetNeighborhoodsSuggestionsParams(
                  country: 'egypt',
                  governate:
                      governateBloc.state.addressOrNull.toNullable()!.name,
                  city: cityBloc.state.addressOrNull.toNullable()!.name,
                  searchText: governateController.text),
            ));
          },
          addNewAddress: (bloc) {
            bloc.add(AddressSuggestions2Event.addRefAddress(
              AddNewNeighborhoodParams(
                  country: 'egypt',
                  refGovernate: governateBloc.state.addressOrNull.toNullable()!,
                  refCity: cityBloc.state.addressOrNull.toNullable()!,
                  neighborhood: neighborhoodController.text),
            ));
          },
          onAddressSelected: () {},
          onAddressUnSelected: () {},
        ),
      ],
    );
  }
}
