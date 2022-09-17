import 'package:aswaqalhelal/features/user_institutions/domain/entities/institution.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/request_state.dart';
import '../../../institution_items/domain/entities/institution_item.dart';
import '../../domain/usecases/get_client_institution_item.dart';

part 'client_institutions_state.dart';

@injectable
class ClientInstitutionsCubit extends Cubit<ClientInstitutionsState> {
  ClientInstitutionsCubit(this._getClientInstitutionItems)
      : super(const ClientInstitutionsState());
  final GetClientInstitutionItems _getClientInstitutionItems;
  Future<void> getItems(Institution institution) async {
    emit(state.copyWith(itemsState: RequestState.loading));
    final either = await _getClientInstitutionItems(
        params: GetClientInstitutionItemsParams(institution));
    either.fold(
      (l) => emit(state.copyWith(itemsState: RequestState.error)),
      (items) =>
          emit(state.copyWith(items: items, itemsState: RequestState.loaded)),
    );
  }

  Future<void> makeOrder() async {}
  Future<void> addToCartOrder() async {}
}
