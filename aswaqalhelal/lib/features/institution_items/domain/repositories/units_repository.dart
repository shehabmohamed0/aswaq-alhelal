import 'package:aswaqalhelal/features/institution_items/data/models/unit_model.dart';
import 'package:root_package/root_package.dart' hide Unit;

import '../entities/unit.dart';

abstract class UnitsRepository {
  Future<Either<Failure, List<Unit>>> getUnitSuggestions(
      GetUnitSuggestionsParams params);
  Future<Either<Failure, Unit>> addUnitToReference(
      AddUnitToReferenceParams params);
}

class GetUnitSuggestionsParams {
  final String searchText;

  GetUnitSuggestionsParams(this.searchText);
}

class AddUnitToReferenceParams {
  final String name;
  final int quantity;
  final double price;

  AddUnitToReferenceParams({
    required this.name,
    required this.quantity,
    required this.price,
  });

  UnitModel toModel(String referenceId) => UnitModel(
      referenceId: referenceId,
      name: name,
      quantity: quantity.toDouble(),
      price: price);
}
