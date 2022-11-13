import 'package:bloc/bloc.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../institution_items/domain/entities/institution_item.dart';
import '../../../domain/usecases/get_items.dart';

part 'items_state.dart';
part 'items_cubit.freezed.dart';

@injectable
class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit(this._getItems) : super(const ItemsState.initial());
  final GetItems _getItems;

  Future<void> getItems() async {
    emit(const ItemsState.loading());
    final either = await _getItems(params: NoArgsParams());

    either.fold((failure) {
      failure as ServerFailure;
      emit(ItemsState.error(message: failure.message));
    }, (items) {
      emit(ItemsState.loaded(items: items));
    });
  }
}
