import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/minimum_lenght_string.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/widgets/ensure_visible_when_focused.dart';

import '../../../../../../l10n/l10n.dart';
import '../../../../../address/domain/entities/entities.dart';
import '../../../../../address/presentation/DTOs/full_address_details.dart';
import '../../../../../address_suggestions/presentation/DTOs/ref_address_details.dart';
import '../../../../../address_suggestions/presentation/bloc/address_suggestions_bloc.dart';
import '../../../../../address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart';
import '../../../../../address_suggestions/presentation/widgets/address_details_widget.dart';
import '../../../../../address_suggestions/presentation/widgets/location_widget.dart';
import '../../../cubit/add_institution/add_institution_cubit.dart';

class AddUpdateAddressWidget extends StatefulWidget {
  const AddUpdateAddressWidget({
    Key? key,
    required this.onAddressDetailsChanged,
  }) : super(key: key);
  final void Function(FullAddressDetails addressDetails)
      onAddressDetailsChanged;

  @override
  State<AddUpdateAddressWidget> createState() => _AddUpdateAddressWidgetState();
}

class _AddUpdateAddressWidgetState extends State<AddUpdateAddressWidget> {
  GeoPoint? geoPoint;
  RefAddressDetails? refAddressDetails;
  MinimumLengthString description = const MinimumLengthString.pure(8);
  final focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GovernatesSuggestionsBloc>(
          create: (context) => locator()..add(const EnableAddressSuggestions()),
        ),
        BlocProvider<CitiesSuggestionsBloc>(
          create: (context) => locator(),
        ),
        BlocProvider<NeighborhoodsSuggestionsBloc>(
          create: (context) => locator(),
        ),
        BlocProvider<LocationWidgetCubit>(
          create: (context) => locator(),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationWidget(
            onGeoPointSelected: (geoPoint) {
              this.geoPoint = geoPoint;
              if (refAddressDetails != null && description.valid) {
                context.read<AddInstitutionCubit>().addressChanged(
                    FullAddressDetails(
                        refAddressDetails: refAddressDetails!,
                        geoPoint: geoPoint,
                        description: description.value));
              }
            },
            geoPoint: geoPoint,
          ),
          const SizedBox(height: 12),
          AddressDetailsWidget(
            onfullRefAddress: (refAddressDetails) {
              this.refAddressDetails = refAddressDetails;
              if (geoPoint != null && description.valid) {
                context.read<AddInstitutionCubit>().addressChanged(
                    FullAddressDetails(
                        refAddressDetails: refAddressDetails,
                        geoPoint: geoPoint!,
                        description: description.value));
              }
            },
            onNeighborhoodUnSelected: () {
              context.read<AddInstitutionCubit>().addressChanged(null);
            },
          ),
          const SizedBox(height: 8),
          EnsureVisibleWhenFocused(
            focusNode: focusNode,
            child: StatefulBuilder(builder: (context, setState) {
              return TextField(
                focusNode: focusNode,
                onChanged: (s) {
                  setState(() {
                    description = description.dirty(s);
                    if (geoPoint != null &&
                        refAddressDetails != null &&
                        description.valid) {
                      context.read<AddInstitutionCubit>().addressChanged(
                          FullAddressDetails(
                              refAddressDetails: refAddressDetails!,
                              geoPoint: geoPoint!,
                              description: description.value));
                    } else {
                      context.read<AddInstitutionCubit>().addressChanged(null);
                    }
                  });
                },
                decoration: InputDecoration(
                  errorText: description.validationMessage,
                  labelText: AppLocalizations.of(context).description,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              );
            }),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
