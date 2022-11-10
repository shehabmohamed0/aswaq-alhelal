part of 'institutions_cubit.dart';

@freezed
abstract class InstitutionsState with _$InstitutionsState {
 const factory  InstitutionsState.initial() = Initial;
 const factory InstitutionsState.loading() = Loading;
 const factory InstitutionsState.loaded({
  required List<InstitutionProfile> institutions
 }) = Loaded;
 const factory InstitutionsState.error() = Error;
}
