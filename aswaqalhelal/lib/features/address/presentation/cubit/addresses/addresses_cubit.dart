import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/address.dart';
import '../../../domain/usecases/get_addresses.dart';

part 'addresses_state.dart';

@injectable
class AddressesCubit extends Cubit<AddressesState> {
  final GetAddresses _getAddresses;
  AddressesCubit(
    this._getAddresses,
  ) : super(AddressesInitial());

  Future<void> getAddresses() async {
    emit(AddressesLoading());
    final either = await _getAddresses(params: NoArgsParams());
    either.fold((failure) {
      emit(AddressesError());
    }, (addresses) {
      if (addresses.isEmpty) {
        emit(const AddressesEmpty());
      } else {
        emit(AddressesLoaded(addresses: addresses));
      }
    });
  }

  void updateAddress(Address address) {
    final current = state;
    if (current is AddressesLoaded) {
      final newList = List<Address>.from(
        current.addresses.map(
          (currentAddress) {
            if (currentAddress.id == address.id) {
              return address;
            } else {
              return currentAddress;
            }
          },
        ).toList(),
      );
      emit(AddressesLoaded(addresses: newList));
    }
  }

  void deleteAddress(String addressId) {
    final current = state;
    if (current is AddressesLoaded) {
      final newList = List<Address>.from(current.addresses
          .where((element) => element.id != addressId)
          .toList());
      emit(AddressesLoaded(addresses: newList));
    }
  }

  void addAddress(Address address) {
    final current = state;
    if (current is AddressesLoaded) {
      final list = current.addresses;
      final newList = List<Address>.from(list)..add(address);
      emit(AddressesLoaded(addresses: newList));
    } else if (state is AddressesEmpty) {
      emit(AddressesLoaded(addresses: [address]));
    }
  }
}
