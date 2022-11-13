import 'package:aswaqalhelal/core/form_inputs/minimum_lenght_string.dart';
import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../locator/locator.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../../address_suggestions/presentation/bloc/address_suggestions_bloc.dart';
import '../../../../address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart';
import '../../../../address_suggestions/presentation/widgets/address_details_widget.dart';
import '../../../../address_suggestions/presentation/widgets/location_widget.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../domain/entities/address.dart';
import '../../cubit/add_edit_address/add_edit_address_cubit.dart';

class AddEditAddressPage extends HookWidget {
  const AddEditAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.of(context);
    final user = context.read<AppBloc>().state.profile.toUser();
    final address = ModalRoute.of(context)!.settings.arguments as Address?;
    final focusNode = useFocusNode();
    return MultiBlocProvider(
      providers: [
        BlocProvider<GovernatesSuggestionsBloc>(
          create: (context) =>
              locator()..add(const AddressSuggestionsEvent.enabel()),
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
              showLoadingDialog();
              EasyLoading.show(
                  indicator: const FittedBox(
                child: SpinKitRipple(
                  duration: Duration(milliseconds: 1200),
                  color: Colors.white,
                ),
              ));
              break;
            case AddEditAddressStatus.success:
              dismissLoadingDialog();
              Navigator.pop(context, state.address);
              showSuccessSnackBar(
                  context,
                  address == null
                      ? intl.addedSuccefully
                      : intl.updatedSuccefully);
              break;
            case AddEditAddressStatus.failure:
              dismissLoadingDialog();
              showErrorSnackBar(context, state.errorMessage!);
              break;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(address == null ? intl.addAddress : intl.editAddress),
            actions: address != null && user.address?.id != address.id
                ? [
                    TextButton(
                        onPressed: () {
                          // context.read<AddEditAddressCubit>().;
                        },
                        child: Text(
                          intl.delete,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ))
                  ]
                : null,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: [
                LocationWidget(
                    geoPoint: address?.geoPoint,
                    onGeoPointSelected: (geoPoint) {
                      context
                          .read<AddEditAddressCubit>()
                          .geoPointChanged(geoPoint);
                    }),
                const SizedBox(height: 16),
                AddressDetailsWidget(
                  fullRefAddress: address?.toRefAddressDetails(),
                  onfullRefAddress: (refAddressDetails) {
                    context
                        .read<AddEditAddressCubit>()
                        .addressDetailsChanged(refAddressDetails);
                    focusNode.requestFocus();
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
                        focusNode: focusNode,
                        initialValue: address?.description,
                        keyboardType: TextInputType.multiline,
                        onChanged: context
                            .read<AddEditAddressCubit>()
                            .descriptionchanged,
                        decoration: InputDecoration(
                            labelText: intl.description,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            errorText: state.description.validationMessage),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
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
                                  context.read<AddEditAddressCubit>().submit(
                                      id: address?.id,
                                      isMain: user.address!.id == address?.id);
                                }
                              : null,
                          child: Text(address == null ? intl.add : intl.update),
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
