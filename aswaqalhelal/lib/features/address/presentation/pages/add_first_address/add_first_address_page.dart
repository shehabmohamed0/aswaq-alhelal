import 'package:aswaqalhelal/core/form_inputs/minimum_lenght_string.dart';
import 'package:aswaqalhelal/core/form_inputs/name.dart';
import 'package:aswaqalhelal/core/utils/dialogs.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aswaqalhelal/locator/locator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formz/formz.dart';

import '../../../../../widgets/snack_bar.dart';
import '../../../../address_suggestions/presentation/bloc/address_suggestions_bloc.dart';
import '../../../../address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart';
import '../../../../address_suggestions/presentation/widgets/address_details_widget.dart';
import '../../../../address_suggestions/presentation/widgets/location_widget.dart';
import '../../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../cubit/add_first_address/add_first_address_cubit.dart';

class AddFirstAddressPage extends StatelessWidget {
  const AddFirstAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddFirstAddressCubit>();
    final intl = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddFirstAddressCubit>(
          create: (context) => locator(),
        ),
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
      child: BlocListener<AddFirstAddressCubit, AddFirstAddressState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          switch (state.status) {
            case FormzStatus.submissionInProgress:
              showLoadingDialog();
              break;
            case FormzStatus.submissionSuccess:
              dismissLoadingDialog();
              break;
            case FormzStatus.submissionFailure:
              dismissLoadingDialog();
              showErrorSnackBar(context, state.errorMessage!);
              break;
            default:
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        intl.userName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      IconButton(
                          visualDensity: VisualDensity.compact,
                          splashRadius: 24,
                          style: const ButtonStyle(
                              visualDensity: VisualDensity.compact),
                          onPressed: () {
                            context.read<AppBloc>().add(AppLogoutRequested());
                          },
                          icon: const Icon(Icons.exit_to_app))
                    ],
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<AddFirstAddressCubit, AddFirstAddressState>(
                    buildWhen: (previous, current) =>
                        previous.name != current.name,
                    builder: (context, state) {
                      return TextField(
                        onChanged: cubit.nameChanged,
                        decoration: InputDecoration(
                          errorText: state.name.validationMessage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  Text(
                    intl.deliveryAddress,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  LocationWidget(onGeoPointSelected: (geoPoint) {
                    context
                        .read<AddFirstAddressCubit>()
                        .geoPointChanged(geoPoint);
                  }),
                  const SizedBox(height: 8),
                  AddressDetailsWidget(
                    onfullRefAddress: (refAddressDetails) {
                      context
                          .read<AddFirstAddressCubit>()
                          .addressDetailsChanged(refAddressDetails);
                    },
                    onNeighborhoodUnSelected: () {
                      context
                          .read<AddFirstAddressCubit>()
                          .deleteAddressDetails();
                    },
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<AddFirstAddressCubit, AddFirstAddressState>(
                    buildWhen: (previous, current) =>
                        previous.description != current.description,
                    builder: (context, state) {
                      return TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: context
                            .read<AddFirstAddressCubit>()
                            .descriptionchanged,
                        decoration: InputDecoration(
                          labelText: intl.description,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          errorText: state.description.validationMessage,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child:
                        BlocBuilder<AddFirstAddressCubit, AddFirstAddressState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: state.refAddressDetails.valid &&
                                  state.description.valid &&
                                  state.geoPoint.valid &&
                                  state.name.valid
                              ? () {
                                  context.read<AddFirstAddressCubit>().submit();
                                }
                              : null,
                          child: Text(intl.Continue),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
