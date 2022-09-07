part of 'employees_cubit.dart';

class EmployeesState extends Equatable {
  final List<Employee> employees;
  final RequestState employeesState;

  const EmployeesState({
    this.employees = const [],
    this.employeesState = RequestState.idle,
  });

  EmployeesState copyWith({
    List<Employee>? employees,
    RequestState? employeesState,
  }) {
    return EmployeesState(
      employees: employees ?? this.employees,
      employeesState: employeesState ?? this.employeesState,
    );
  }

  @override
  List<Object?> get props => [employees, employeesState];
}
