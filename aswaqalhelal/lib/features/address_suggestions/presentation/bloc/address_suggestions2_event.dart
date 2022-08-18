part of 'address_suggestions2_bloc.dart';

@freezed
abstract class AddressSuggestions2Event<T, SP, AP>
    with _$AddressSuggestions2Event<T, SP, AP> {
  const factory AddressSuggestions2Event.initEdit(T refAddress) = InitEdit;
  const factory AddressSuggestions2Event.searchRefAddress(
      String searchText, SP params) = SearchRefAddress;
  const factory AddressSuggestions2Event.selectRefAddress(T params) =
      SelectRefAddress;
  const factory AddressSuggestions2Event.unSelectRefAddress(
      {@Default(true) bool enabled}) = UnSelectRefAddress;
  const factory AddressSuggestions2Event.addRefAddress(AP params) =
      AddRefAddress;
  const factory AddressSuggestions2Event.disabel() = DisableAddressSuggestions;
  const factory AddressSuggestions2Event.enabel() = EnableAddressSuggestions;
}
