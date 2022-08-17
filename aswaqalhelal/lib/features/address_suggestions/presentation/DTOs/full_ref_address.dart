
import '../../domain/entities/entities.dart';

class FullRefAddress {
  final RefGovernate refGovernate;
  final RefCity refCity;
  final RefNeighborhood refNeighborhood;

  FullRefAddress({
    required this.refGovernate,
    required this.refCity,
    required this.refNeighborhood,
  });

  // FullRefAddress.fromAddress(Address address) {}
}
