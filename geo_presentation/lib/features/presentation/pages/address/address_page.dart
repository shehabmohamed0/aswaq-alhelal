import 'package:flutter/material.dart';
import 'package:geo_logic/features/domain/entities/entities.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/core/form_inputs/required_string.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';
import 'package:root_package/packages/flutter_hooks.dart';
import 'package:root_package/packages/flutter_spinkit.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/snack_bar.dart';

import '../../../../l10n/l10n.dart';
import '../../cubit/addresses/addresses_cubit.dart';
import '../../cubit/base_address/base_address_cubit.dart';
import '../../widgets/clickable_text_field.dart';
import '../../widgets/normal_text_field.dart';
import 'widgets/select_dialog.dart';

class AddressPage<T extends BaseAddressCubit> extends HookWidget {
  const AddressPage({
    Key? key,
    required this.onAddSuccess,
    required this.onEditSuccess,
  }) : super(key: key);
  final Function(Address address) onAddSuccess;
  final Function(Address address) onEditSuccess;
  @override
  Widget build(BuildContext context) {
    final intl = locator<GeoPresentationLocalizations>();
    final address = ModalRoute.of(context)!.settings.arguments as Address?;
    final bloc = context.read<T>();
    final countryController = useTextEditingController(text: 'Egypt');
    final governateController = useTextEditingController();
    final cityController = useTextEditingController();
    final districtController = useTextEditingController();
    final descriptionController = useTextEditingController();
    return BlocConsumer<T, AddAddressState>(
      listener: (context, state) {
        if (state is AddAddressLoadedState) {
          if (state.isEdit) {
            if (!state.initEdit) {
              governateController.text = state.governate.value?.enName ?? '';
              cityController.text = state.city.value?.enName ?? '';
              districtController.text = state.neighborhood.value;
              descriptionController.text = state.description.value;
              bloc.addAddressEditInitCompleted();
            }
          }
          if (state.status.isSubmissionInProgress) {
            EasyLoading.show(
                status: 'loading',
                indicator: const FittedBox(
                  child: SpinKitRipple(
                    duration: Duration(milliseconds: 1200),
                    color: Colors.white,
                  ),
                ));
          } else if (state.status.isSubmissionFailure) {
            EasyLoading.dismiss();
            showErrorSnackBar(context, state.errorMessage ?? 'Update Failed');
          }
        } else if (state is AddAddressAddedState) {
          EasyLoading.dismiss();
          onAddSuccess(state.address);
          // context.read<AddressesCubit>().addAddress(state.address);
          // Navigator.pop(context);
        } else if (state is AddAddressUpdatedState) {
          EasyLoading.dismiss();
          onEditSuccess(state.address);
          // context.read<AddressesCubit>().updateAddress(state.address);
          // Navigator.pop(context);
        } else if (state is AddAddressDeletedState) {
          EasyLoading.dismiss();
          context.read<AddressesCubit>().deleteAddress(state.id);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is AddAddressLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.isEdit ? intl.editAddress : intl.addAddress),
              actions: state.isEdit
                  ? [
                      GestureDetector(
                        onTap: () {
                          bloc.deleteAddress(address!.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.center,
                          child: Text(
                            intl.delete,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : null,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ClickableTextField(
                    controller: countryController,
                    label: intl.county,
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                  ClickableTextField(
                    controller: governateController,
                    label: intl.governate,
                    errorText: state.governate.validationMessage,
                    onTap: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => SelectDialog<Governate>(
                          choises: state.country.governates.values.toList(),
                          itemBuilder: (governate) => SelectWidget<Governate>(
                            title: governate.enName,
                            onSelect: () {
                              bloc.governateChanged(governate);
                              governateController.text = governate.enName;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  ClickableTextField(
                    controller: cityController,
                    label: intl.city,
                    errorText: state.city.validationMessage,
                    onTap: () {
                      if (state.governate.value != null) {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => SelectDialog<City>(
                            choises:
                                state.governate.value!.cities.values.toList(),
                            itemBuilder: (city) => SelectWidget<City>(
                              title: city.enName,
                              onSelect: () {
                                bloc.cityChanged(city);
                                cityController.text = city.enName;
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  NormalTextFormField(
                    controller: districtController,
                    labelText: intl.districtVillageNeighbourhood,
                    errorText: state.neighborhood.validationMessage,
                    onChanged: (district) {
                      bloc.districtChanged(district);
                    },
                  ),
                  const SizedBox(height: 8),
                  NormalTextFormField(
                    controller: descriptionController,
                    textArea: true,
                    labelText: intl.description,
                    errorText: state.description.validationMessage,
                    onChanged: (description) {
                      bloc.descriptionChanged(description);
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        intl.location,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 8),
                      if (state.geoPointLoading)
                        const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      else
                        Icon(
                          state.geoPoint.valid
                              ? Icons.check
                              : Icons.question_mark,
                          color: state.geoPoint.valid
                              ? Colors.green
                              : Colors.yellow.shade700,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          bloc.getCurrentLocation();
                        },
                        label: Text(
                          intl.currentLocation,
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(
                          Icons.my_location,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 18),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(10),
                        ),
                        label: Text(
                          intl.selectLocation,
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(
                          Icons.location_on_outlined,
                          size: 28,
                        ),
                        onPressed: () async {
                          Navigator.of(context)
                              .pushNamed(Routes.selectLocationMap,
                                  arguments: state.geoPoint.value)
                              .then((geoPoint) {
                            if (geoPoint != null) {
                              bloc.geoPointChanged(geoPoint as GeoPoint);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          bloc.addressSubmitted(address?.id);
                        },
                        child: Text(intl.saveAddress)),
                  )
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
