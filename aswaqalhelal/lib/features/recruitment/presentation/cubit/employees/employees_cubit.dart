import 'package:aswaqalhelal/features/recruitment/domain/repositories/recruitment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/request_state.dart';
import '../../../domain/entities/employee.dart';
import '../../../domain/usecases/get_employees.dart';
import '../../../domain/usecases/remove_employee.dart';

part 'employees_state.dart';

@injectable
class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesCubit(
    this._getEmployees,
    this._removeEmployee,
  ) : super(const EmployeesState());

  final GetEmployees _getEmployees;
  final RemoveEmployee _removeEmployee;

  Future<void> getEmployees(String institutionId) async {
    emit(state.copyWith(employeesState: RequestState.loading));

    final either = await _getEmployees(
        params: GetEmployeesParams(institutionId: institutionId));

    either.fold(
        (failure) => emit(state.copyWith(employeesState: RequestState.error)),
        (employees) => emit(state.copyWith(
            employees: employees, employeesState: RequestState.loaded)));
  }
}
