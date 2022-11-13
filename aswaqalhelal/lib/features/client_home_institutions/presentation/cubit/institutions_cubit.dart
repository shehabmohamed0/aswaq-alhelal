import 'dart:developer';

import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../address/domain/entities/address.dart';
import '../../domain/usecases/get_institutions.dart';

part 'institutions_cubit.freezed.dart';
part 'institutions_state.dart';

@injectable
class InstitutionsCubit extends Cubit<InstitutionsState> {
  InstitutionsCubit(this._getInstitution)
      : super(const InstitutionsState.initial());
  final GetAddressInstitutions _getInstitution;

  Future<void> getInstitutions(Address address) async {
    emit(const InstitutionsState.loading());
    final either = await _getInstitution(params: address);

    either.fold((failure) {
      emit(const InstitutionsState.error());
    }, (institutions) {
      emit(InstitutionsState.loaded(institutions: institutions));
    });
  }
}
