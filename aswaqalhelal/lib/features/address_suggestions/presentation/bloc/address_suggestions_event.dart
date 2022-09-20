part of 'address_suggestions_bloc.dart';

@freezed
abstract class AddressSuggestionsEvent<T, SP, AP>
    with _$AddressSuggestionsEvent<T, SP, AP> {
  const factory AddressSuggestionsEvent.initEdit(T refAddress) = InitEdit;
  const factory AddressSuggestionsEvent.searchRefAddress(
      String searchText, SP params) = SearchRefAddress;
  const factory AddressSuggestionsEvent.selectRefAddress(T params) =
      SelectRefAddress;
  const factory AddressSuggestionsEvent.unSelectRefAddress(
      {@Default(true) bool enabled}) = UnSelectRefAddress;
  const factory AddressSuggestionsEvent.addRefAddress(AP params) =
      AddRefAddress;
  const factory AddressSuggestionsEvent.disabel() = DisableAddressSuggestions;
  const factory AddressSuggestionsEvent.enabel() = EnableAddressSuggestions;
}
