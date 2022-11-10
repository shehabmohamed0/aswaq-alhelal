import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'institution_clients_event.dart';
part 'institution_clients_state.dart';

class InstitutionClientsBloc extends Bloc<InstitutionClientsEvent, InstitutionClientsState> {
  InstitutionClientsBloc() : super(InstitutionClientsInitial()) {
    on<InstitutionClientsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
