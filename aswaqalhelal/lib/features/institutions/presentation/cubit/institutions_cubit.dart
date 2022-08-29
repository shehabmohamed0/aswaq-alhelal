import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../address/domain/entities/address.dart';
import '../../../user_institutions/domain/entities/institution.dart';
import '../../domain/usecases/get_institutions.dart';

part 'institutions_cubit.freezed.dart';
part 'institutions_state.dart';

@injectable
class InstitutionsCubit extends Cubit<InstitutionsState> {
  InstitutionsCubit(this._getInstitution)
      : super(const InstitutionsState.initial());
  final GetAddressInstitutions _getInstitution;

  Future<void> getInstitutions(Address address) async {
    final either = await _getInstitution(params: address);

    either.fold((failure) {
      emit(const InstitutionsState.error());
    }, (institutions) {
      emit(InstitutionsState.loaded(institutions: institutions));
    });
  }
}
