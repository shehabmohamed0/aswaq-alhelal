import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';

import '../../../domain/entities/unit.dart';
import '../../DTOs/unit_entry_row.dart';

part 'units_bloc.freezed.dart';
part 'units_event.dart';
part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  UnitsBloc() : super(const UnitsState()) {
    on<UnitsEvent>((event, emit) {});
  }
}


