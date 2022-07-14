import 'package:flutter/material.dart';
import 'package:geo_logic/features/domain/entities/entities.dart';
import 'package:geo_presentation/features/presentation/cubit/user_address/user_address_cubit.dart';
import 'package:geo_presentation/features/presentation/pages/addresses/widgets/address_widget.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/widgets/check_internet_connection_widget.dart';

import '../../../../l10n/l10n.dart';
import '../../cubit/addresses/addresses_cubit.dart';
import '../address/address_page.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GeoPresentationLocalizations.of(context).addresses),
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              _navigateToAddAddress(context: context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: Text(
                GeoPresentationLocalizations.of(context).add,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<AddressesCubit, AddressesState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case AddressesLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case AddressesError:
                return CheckInternetConnection(
                  onPressed: () {
                    context.read<AddressesCubit>().getAddresses();
                  },
                );
              case AddressesLoaded:
                return ListView.builder(
                  itemCount: (state as AddressesLoaded).addresses.length,
                  itemBuilder: (context, index) => AddressWidget(
                    address: state.addresses[index],
                    onTap: () {
                      _navigateToAddAddress(
                          context: context, address: state.addresses[index]);
                    },
                  ),
                );
              case AddressesEmpty:
                return Center(
                  child: Text(
                    'Their is no address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  void _navigateToAddAddress(
      {required BuildContext context, Address? address}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(arguments: address),
        builder: (_) => BlocProvider<UserAddressCubit>(
          create: (context) {
            if (address != null) {
              return locator()..initEdit(address);
            } else {
              return locator()..init();
            }
          },
          child: AddressPage<UserAddressCubit>(
            onAddSuccess: (address) {
              context.read<AddressesCubit>().addAddress(address);
              Navigator.pop(context);
            },
            onEditSuccess: (address) {
              context.read<AddressesCubit>().updateAddress(address);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
