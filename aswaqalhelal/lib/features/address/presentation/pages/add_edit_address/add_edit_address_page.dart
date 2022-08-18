import 'package:flutter/material.dart';
import 'package:root_package/core/form_inputs/minimum_lenght_string.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../address_suggestions/presentation/bloc/address_suggestions2_bloc.dart';
import '../../../../address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart';
import '../../../../address_suggestions/presentation/widgets/address_details_widget.dart';
import '../../../../address_suggestions/presentation/widgets/location_widget.dart';
import '../../../domain/entities/address.dart';
import '../../cubit/add_edit_address/add_edit_address_cubit.dart';

class AddEditAddressPage extends StatelessWidget {
  const AddEditAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final address = ModalRoute.of(context)!.settings.arguments as Address?;

    return MultiBlocProvider(
      providers: [
        BlocProvider<GovernatesSuggestionsBloc>(
          create: (context) =>
              locator()..add(const AddressSuggestions2Event.enabel()),
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
      child: BlocListener<AddEditAddressCubit, AddEditAddressState>(
        listener: (context, state) {
          switch (state.status) {
            case AddEditAddressStatus.initial:
              break;
            case AddEditAddressStatus.loading:
              EasyLoading.show(
                  indicator: const FittedBox(
                child: SpinKitRipple(
                  duration: Duration(milliseconds: 1200),
                  color: Colors.white,
                ),
              ));
              break;
            case AddEditAddressStatus.success:
              EasyLoading.dismiss();
              Navigator.pop(context, state.address);
              showSuccessSnackBar(context,
                  address == null ? 'Added succefully' : 'Updated succefully');
              break;
            case AddEditAddressStatus.failure:
              EasyLoading.dismiss();
              showErrorSnackBar(context, state.errorMessage!);
              break;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(address == null ? 'Add address' : 'Edit address'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: [
                AddressDetailsWidget(
                  fullRefAddress: address?.toRefAddressDetails(),
                  onfullRefAddress: (refAddressDetails) {
                    context
                        .read<AddEditAddressCubit>()
                        .addressDetailsChanged(refAddressDetails);
                  },
                  onNeighborhoodUnSelected: () {
                    context.read<AddEditAddressCubit>().deleteAddressDetails();
                  },
                ),
                const SizedBox(height: 18),
                Theme(
                  data: ThemeData(
                    primaryColor: Theme.of(context).primaryColor,
                    colorScheme: Theme.of(context)
                        .colorScheme
                        .copyWith(primary: Theme.of(context).primaryColor),
                    inputDecorationTheme: const InputDecorationTheme(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  child: BlocBuilder<AddEditAddressCubit, AddEditAddressState>(
                    buildWhen: (previous, current) =>
                        previous.description != current.description,
                    builder: (context, state) {
                      return TextFormField(
                        maxLines: null,
                        initialValue: address?.description,
                        keyboardType: TextInputType.multiline,
                        onChanged: context
                            .read<AddEditAddressCubit>()
                            .descriptionchanged,
                        decoration: InputDecoration(
                            labelText: 'Description',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            errorText: state.description.validationMessage),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                LocationWidget(
                    geoPoint: address?.geoPoint,
                    onGeoPointSelected: (geoPoint) {
                      context
                          .read<AddEditAddressCubit>()
                          .geoPointChanged(geoPoint);
                    }),
                const SizedBox(height: 16),
                SizedBox(
                    width: double.infinity,
                    child:
                        BlocBuilder<AddEditAddressCubit, AddEditAddressState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: state.refAddressDetails.valid &&
                                  state.description.valid &&
                                  state.geoPoint.valid
                              ? () {
                                  context
                                      .read<AddEditAddressCubit>()
                                      .submit(id: address?.id);
                                }
                              : null,
                          child: Text(address == null ? 'Add' : 'Update'),
                        );
                      },
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
