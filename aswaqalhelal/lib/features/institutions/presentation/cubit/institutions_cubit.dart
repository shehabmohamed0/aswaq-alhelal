import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../../../user_institutions/domain/entities/institution.dart';
import '../../domain/usecases/get_institutions.dart';

part 'institutions_cubit.freezed.dart';
part 'institutions_state.dart';

@injectable
class InstitutionsCubit extends Cubit<InstitutionsState> {
  InstitutionsCubit(this._getInstitutionItems)
      : super(const InstitutionsState.initial());
  final GetInstitutions _getInstitutionItems;

  Future<void> getInstitutions() async {
    final either = await _getInstitutionItems(params: NoArgsParams());

    either.fold((failure) {
      emit(const InstitutionsState.error());
    }, (institutions) {
      emit(InstitutionsState.loaded(institutions: institutions));
    });
  }
}
