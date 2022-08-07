part of 'items_cubit.dart';

@freezed
class ItemsState with _$ItemsState {
  const factory ItemsState.initial() = Initial;
  const factory ItemsState.loading() = Loading;
  const factory ItemsState.error({
    required String message,
  }) = Error;
  const factory ItemsState.loaded({
    required List<InstitutionItem> items,
  }) = Loaded;
}
