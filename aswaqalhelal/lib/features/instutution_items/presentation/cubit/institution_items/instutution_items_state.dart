part of 'instutution_items_cubit.dart';

abstract class InstitutionItemsState extends Equatable {
  const InstitutionItemsState();

  @override
  List<Object> get props => [];
}

class InstitutionItemsInitial extends InstitutionItemsState {}

class InstitutionItemsLoading extends InstitutionItemsState {}

class InstitutionsItemsInitial extends InstitutionItemsState {}

class InstitutionsItemsLoading extends InstitutionItemsState {}

class InstitutionItemsEmpty extends InstitutionItemsState {}

class InstitutionItemsLoaded extends InstitutionItemsState {
  final List<InstitutionItem> items;

  const InstitutionItemsLoaded({
    required this.items,
  });

  InstitutionItemsLoaded copyWith({
    List<InstitutionItem>? items,
  }) {
    return InstitutionItemsLoaded(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}

class InstitutionsItemsError extends InstitutionItemsState {}
