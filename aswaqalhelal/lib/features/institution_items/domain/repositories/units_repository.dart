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
  final double quantity;
  final double price;
  final double p0;
  final double? p1;
  final double? p2;
  final double? p3;
  final double? p4;
  final Unit? baseUnit;
  AddUnitToReferenceParams(
      {required this.name,
      required this.quantity,
      required this.price,
      required this.p0,
      this.p1,
      this.p2,
      this.p3,
      this.p4,
      this.baseUnit});

  UnitModel toModel(String referenceId) => UnitModel(
        referenceId: referenceId,
        name: name,
        quantity: quantity.toDouble(),
        price: price,
        p0: p0,
        p1: p1,
        p2: p2,
        p3: p3,
        p4: p4,
        baseUnitModel:
            baseUnit == null ? null : UnitModel.fromDomain(baseUnit!),
      );
}
