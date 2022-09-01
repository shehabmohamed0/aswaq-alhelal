import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../widgets/check_internet_connection_widget.dart';
import '../../../domain/entities/address.dart';
import '../../cubit/addresses/addresses_cubit.dart';
import 'widgets/address_widget.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Addresses'),
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () async {
              final address = await Navigator.of(context)
                  .pushNamed(Routes.addAddresses) as Address?;

              if (address != null) {
                context.read<AddressesCubit>().addAddress(address);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: const Text(
                'Add',
                style: TextStyle(
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
                    onTap: () async {
                      final address = await Navigator.of(context).pushNamed(
                          Routes.addAddresses,
                          arguments: state.addresses[index]) as Address?;

                      if (address != null) {
                        context.read<AddressesCubit>().updateAddress(address);
                      }
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
}
