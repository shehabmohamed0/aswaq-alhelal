// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_entry_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnitEntryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitEntryEventCopyWith<$Res> {
  factory $UnitEntryEventCopyWith(
          UnitEntryEvent value, $Res Function(UnitEntryEvent) then) =
      _$UnitEntryEventCopyWithImpl<$Res, UnitEntryEvent>;
}

/// @nodoc
class _$UnitEntryEventCopyWithImpl<$Res, $Val extends UnitEntryEvent>
    implements $UnitEntryEventCopyWith<$Res> {
  _$UnitEntryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnitNameChangedCopyWith<$Res> {
  factory _$$UnitNameChangedCopyWith(
          _$UnitNameChanged value, $Res Function(_$UnitNameChanged) then) =
      __$$UnitNameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UnitNameChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$UnitNameChanged>
    implements _$$UnitNameChangedCopyWith<$Res> {
  __$$UnitNameChangedCopyWithImpl(
      _$UnitNameChanged _value, $Res Function(_$UnitNameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UnitNameChanged(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnitNameChanged implements UnitNameChanged {
  const _$UnitNameChanged({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'UnitEntryEvent.unitNameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitNameChanged &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitNameChangedCopyWith<_$UnitNameChanged> get copyWith =>
      __$$UnitNameChangedCopyWithImpl<_$UnitNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return unitNameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return unitNameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitNameChanged != null) {
      return unitNameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return unitNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return unitNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitNameChanged != null) {
      return unitNameChanged(this);
    }
    return orElse();
  }
}

abstract class UnitNameChanged implements UnitEntryEvent {
  const factory UnitNameChanged({required final String name}) =
      _$UnitNameChanged;

  String get name;
  @JsonKey(ignore: true)
  _$$UnitNameChangedCopyWith<_$UnitNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnitAddedCopyWith<$Res> {
  factory _$$UnitAddedCopyWith(
          _$UnitAdded value, $Res Function(_$UnitAdded) then) =
      __$$UnitAddedCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UnitAddedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$UnitAdded>
    implements _$$UnitAddedCopyWith<$Res> {
  __$$UnitAddedCopyWithImpl(
      _$UnitAdded _value, $Res Function(_$UnitAdded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UnitAdded(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnitAdded implements UnitAdded {
  const _$UnitAdded(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'UnitEntryEvent.unitAdded(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitAdded &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitAddedCopyWith<_$UnitAdded> get copyWith =>
      __$$UnitAddedCopyWithImpl<_$UnitAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return unitAdded(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return unitAdded?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitAdded != null) {
      return unitAdded(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return unitAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return unitAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitAdded != null) {
      return unitAdded(this);
    }
    return orElse();
  }
}

abstract class UnitAdded implements UnitEntryEvent {
  const factory UnitAdded(final String name) = _$UnitAdded;

  String get name;
  @JsonKey(ignore: true)
  _$$UnitAddedCopyWith<_$UnitAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnitSelectedCopyWith<$Res> {
  factory _$$UnitSelectedCopyWith(
          _$UnitSelected value, $Res Function(_$UnitSelected) then) =
      __$$UnitSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({Unit unit});
}

/// @nodoc
class __$$UnitSelectedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$UnitSelected>
    implements _$$UnitSelectedCopyWith<$Res> {
  __$$UnitSelectedCopyWithImpl(
      _$UnitSelected _value, $Res Function(_$UnitSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
  }) {
    return _then(_$UnitSelected(
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
    ));
  }
}

/// @nodoc

class _$UnitSelected implements UnitSelected {
  const _$UnitSelected({required this.unit});

  @override
  final Unit unit;

  @override
  String toString() {
    return 'UnitEntryEvent.unitSelected(unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitSelected &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitSelectedCopyWith<_$UnitSelected> get copyWith =>
      __$$UnitSelectedCopyWithImpl<_$UnitSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return unitSelected(unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return unitSelected?.call(unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitSelected != null) {
      return unitSelected(unit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return unitSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return unitSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitSelected != null) {
      return unitSelected(this);
    }
    return orElse();
  }
}

abstract class UnitSelected implements UnitEntryEvent {
  const factory UnitSelected({required final Unit unit}) = _$UnitSelected;

  Unit get unit;
  @JsonKey(ignore: true)
  _$$UnitSelectedCopyWith<_$UnitSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnitUnselectedCopyWith<$Res> {
  factory _$$UnitUnselectedCopyWith(
          _$UnitUnselected value, $Res Function(_$UnitUnselected) then) =
      __$$UnitUnselectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnitUnselectedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$UnitUnselected>
    implements _$$UnitUnselectedCopyWith<$Res> {
  __$$UnitUnselectedCopyWithImpl(
      _$UnitUnselected _value, $Res Function(_$UnitUnselected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnitUnselected implements UnitUnselected {
  const _$UnitUnselected();

  @override
  String toString() {
    return 'UnitEntryEvent.unitUnselected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnitUnselected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return unitUnselected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return unitUnselected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitUnselected != null) {
      return unitUnselected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return unitUnselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return unitUnselected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitUnselected != null) {
      return unitUnselected(this);
    }
    return orElse();
  }
}

abstract class UnitUnselected implements UnitEntryEvent {
  const factory UnitUnselected() = _$UnitUnselected;
}

/// @nodoc
abstract class _$$FromUnitChangedCopyWith<$Res> {
  factory _$$FromUnitChangedCopyWith(
          _$FromUnitChanged value, $Res Function(_$FromUnitChanged) then) =
      __$$FromUnitChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({Unit unit, double? quantity});
}

/// @nodoc
class __$$FromUnitChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$FromUnitChanged>
    implements _$$FromUnitChangedCopyWith<$Res> {
  __$$FromUnitChangedCopyWithImpl(
      _$FromUnitChanged _value, $Res Function(_$FromUnitChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
    Object? quantity = freezed,
  }) {
    return _then(_$FromUnitChanged(
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$FromUnitChanged implements FromUnitChanged {
  const _$FromUnitChanged({required this.unit, this.quantity});

  @override
  final Unit unit;
  @override
  final double? quantity;

  @override
  String toString() {
    return 'UnitEntryEvent.fromUnitChanged(unit: $unit, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromUnitChanged &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FromUnitChangedCopyWith<_$FromUnitChanged> get copyWith =>
      __$$FromUnitChangedCopyWithImpl<_$FromUnitChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return fromUnitChanged(unit, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return fromUnitChanged?.call(unit, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (fromUnitChanged != null) {
      return fromUnitChanged(unit, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return fromUnitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return fromUnitChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (fromUnitChanged != null) {
      return fromUnitChanged(this);
    }
    return orElse();
  }
}

abstract class FromUnitChanged implements UnitEntryEvent {
  const factory FromUnitChanged(
      {required final Unit unit, final double? quantity}) = _$FromUnitChanged;

  Unit get unit;
  double? get quantity;
  @JsonKey(ignore: true)
  _$$FromUnitChangedCopyWith<_$FromUnitChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuantityChangedCopyWith<$Res> {
  factory _$$QuantityChangedCopyWith(
          _$QuantityChanged value, $Res Function(_$QuantityChanged) then) =
      __$$QuantityChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String quantity});
}

/// @nodoc
class __$$QuantityChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$QuantityChanged>
    implements _$$QuantityChangedCopyWith<$Res> {
  __$$QuantityChangedCopyWithImpl(
      _$QuantityChanged _value, $Res Function(_$QuantityChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_$QuantityChanged(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuantityChanged implements QuantityChanged {
  const _$QuantityChanged({required this.quantity});

  @override
  final String quantity;

  @override
  String toString() {
    return 'UnitEntryEvent.quantityChanged(quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuantityChanged &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuantityChangedCopyWith<_$QuantityChanged> get copyWith =>
      __$$QuantityChangedCopyWithImpl<_$QuantityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return quantityChanged(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return quantityChanged?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (quantityChanged != null) {
      return quantityChanged(quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return quantityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return quantityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (quantityChanged != null) {
      return quantityChanged(this);
    }
    return orElse();
  }
}

abstract class QuantityChanged implements UnitEntryEvent {
  const factory QuantityChanged({required final String quantity}) =
      _$QuantityChanged;

  String get quantity;
  @JsonKey(ignore: true)
  _$$QuantityChangedCopyWith<_$QuantityChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceChangedCopyWith<$Res> {
  factory _$$PriceChangedCopyWith(
          _$PriceChanged value, $Res Function(_$PriceChanged) then) =
      __$$PriceChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String price});
}

/// @nodoc
class __$$PriceChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$PriceChanged>
    implements _$$PriceChangedCopyWith<$Res> {
  __$$PriceChangedCopyWithImpl(
      _$PriceChanged _value, $Res Function(_$PriceChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_$PriceChanged(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PriceChanged implements PriceChanged {
  const _$PriceChanged({required this.price});

  @override
  final String price;

  @override
  String toString() {
    return 'UnitEntryEvent.priceChanged(price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceChanged &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceChangedCopyWith<_$PriceChanged> get copyWith =>
      __$$PriceChangedCopyWithImpl<_$PriceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return priceChanged(price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return priceChanged?.call(price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return priceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return priceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(this);
    }
    return orElse();
  }
}

abstract class PriceChanged implements UnitEntryEvent {
  const factory PriceChanged({required final String price}) = _$PriceChanged;

  String get price;
  @JsonKey(ignore: true)
  _$$PriceChangedCopyWith<_$PriceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitForEditCopyWith<$Res> {
  factory _$$InitForEditCopyWith(
          _$InitForEdit value, $Res Function(_$InitForEdit) then) =
      __$$InitForEditCopyWithImpl<$Res>;
  @useResult
  $Res call({Unit unit});
}

/// @nodoc
class __$$InitForEditCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res, _$InitForEdit>
    implements _$$InitForEditCopyWith<$Res> {
  __$$InitForEditCopyWithImpl(
      _$InitForEdit _value, $Res Function(_$InitForEdit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
  }) {
    return _then(_$InitForEdit(
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
    ));
  }
}

/// @nodoc

class _$InitForEdit implements InitForEdit {
  const _$InitForEdit({required this.unit});

  @override
  final Unit unit;

  @override
  String toString() {
    return 'UnitEntryEvent.initForEdit(unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitForEdit &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitForEditCopyWith<_$InitForEdit> get copyWith =>
      __$$InitForEditCopyWithImpl<_$InitForEdit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function(String name) unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit, double? quantity) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function(Unit unit) initForEdit,
  }) {
    return initForEdit(unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? unitNameChanged,
    TResult? Function(String name)? unitAdded,
    TResult? Function(Unit unit)? unitSelected,
    TResult? Function()? unitUnselected,
    TResult? Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult? Function(String quantity)? quantityChanged,
    TResult? Function(String price)? priceChanged,
    TResult? Function(Unit unit)? initForEdit,
  }) {
    return initForEdit?.call(unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function(String name)? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit, double? quantity)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function(Unit unit)? initForEdit,
    required TResult orElse(),
  }) {
    if (initForEdit != null) {
      return initForEdit(unit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnitNameChanged value) unitNameChanged,
    required TResult Function(UnitAdded value) unitAdded,
    required TResult Function(UnitSelected value) unitSelected,
    required TResult Function(UnitUnselected value) unitUnselected,
    required TResult Function(FromUnitChanged value) fromUnitChanged,
    required TResult Function(QuantityChanged value) quantityChanged,
    required TResult Function(PriceChanged value) priceChanged,
    required TResult Function(InitForEdit value) initForEdit,
  }) {
    return initForEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnitNameChanged value)? unitNameChanged,
    TResult? Function(UnitAdded value)? unitAdded,
    TResult? Function(UnitSelected value)? unitSelected,
    TResult? Function(UnitUnselected value)? unitUnselected,
    TResult? Function(FromUnitChanged value)? fromUnitChanged,
    TResult? Function(QuantityChanged value)? quantityChanged,
    TResult? Function(PriceChanged value)? priceChanged,
    TResult? Function(InitForEdit value)? initForEdit,
  }) {
    return initForEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
    required TResult orElse(),
  }) {
    if (initForEdit != null) {
      return initForEdit(this);
    }
    return orElse();
  }
}

abstract class InitForEdit implements UnitEntryEvent {
  const factory InitForEdit({required final Unit unit}) = _$InitForEdit;

  Unit get unit;
  @JsonKey(ignore: true)
  _$$InitForEditCopyWith<_$InitForEdit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UnitEntryState {
  Name get name => throw _privateConstructorUsedError;
  List<Unit> get unitSuggestions => throw _privateConstructorUsedError;
  AutoSuggestionState get sugggestionStatus =>
      throw _privateConstructorUsedError;
  RequiredObject<Unit> get unit => throw _privateConstructorUsedError;
  RequiredObject<Unit> get fromUnit => throw _privateConstructorUsedError;
  Number get quantity => throw _privateConstructorUsedError;
  Number get price => throw _privateConstructorUsedError;
  UnitEntryStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnitEntryStateCopyWith<UnitEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitEntryStateCopyWith<$Res> {
  factory $UnitEntryStateCopyWith(
          UnitEntryState value, $Res Function(UnitEntryState) then) =
      _$UnitEntryStateCopyWithImpl<$Res, UnitEntryState>;
  @useResult
  $Res call(
      {Name name,
      List<Unit> unitSuggestions,
      AutoSuggestionState sugggestionStatus,
      RequiredObject<Unit> unit,
      RequiredObject<Unit> fromUnit,
      Number quantity,
      Number price,
      UnitEntryStatus status,
      String errorMessage});
}

/// @nodoc
class _$UnitEntryStateCopyWithImpl<$Res, $Val extends UnitEntryState>
    implements $UnitEntryStateCopyWith<$Res> {
  _$UnitEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unitSuggestions = null,
    Object? sugggestionStatus = null,
    Object? unit = null,
    Object? fromUnit = null,
    Object? quantity = null,
    Object? price = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      unitSuggestions: null == unitSuggestions
          ? _value.unitSuggestions
          : unitSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      sugggestionStatus: null == sugggestionStatus
          ? _value.sugggestionStatus
          : sugggestionStatus // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      fromUnit: null == fromUnit
          ? _value.fromUnit
          : fromUnit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Number,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Number,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnitEntryStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnitEntryStateCopyWith<$Res>
    implements $UnitEntryStateCopyWith<$Res> {
  factory _$$_UnitEntryStateCopyWith(
          _$_UnitEntryState value, $Res Function(_$_UnitEntryState) then) =
      __$$_UnitEntryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name name,
      List<Unit> unitSuggestions,
      AutoSuggestionState sugggestionStatus,
      RequiredObject<Unit> unit,
      RequiredObject<Unit> fromUnit,
      Number quantity,
      Number price,
      UnitEntryStatus status,
      String errorMessage});
}

/// @nodoc
class __$$_UnitEntryStateCopyWithImpl<$Res>
    extends _$UnitEntryStateCopyWithImpl<$Res, _$_UnitEntryState>
    implements _$$_UnitEntryStateCopyWith<$Res> {
  __$$_UnitEntryStateCopyWithImpl(
      _$_UnitEntryState _value, $Res Function(_$_UnitEntryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? unitSuggestions = null,
    Object? sugggestionStatus = null,
    Object? unit = null,
    Object? fromUnit = null,
    Object? quantity = null,
    Object? price = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_UnitEntryState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      unitSuggestions: null == unitSuggestions
          ? _value._unitSuggestions
          : unitSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      sugggestionStatus: null == sugggestionStatus
          ? _value.sugggestionStatus
          : sugggestionStatus // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      fromUnit: null == fromUnit
          ? _value.fromUnit
          : fromUnit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Number,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Number,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnitEntryStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnitEntryState implements _UnitEntryState {
  const _$_UnitEntryState(
      {this.name = const Name.pure(),
      final List<Unit> unitSuggestions = const [],
      this.sugggestionStatus = AutoSuggestionState.emptyText,
      this.unit = const RequiredObject.pure(),
      this.fromUnit = const RequiredObject.pure(),
      this.quantity = const Number.pure(
          acceptNegative: false, acceptZero: false, isFractional: true),
      this.price = const Number.pure(acceptNegative: false, isFractional: true),
      this.status = UnitEntryStatus.initial,
      this.errorMessage = ''})
      : _unitSuggestions = unitSuggestions;

  @override
  @JsonKey()
  final Name name;
  final List<Unit> _unitSuggestions;
  @override
  @JsonKey()
  List<Unit> get unitSuggestions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unitSuggestions);
  }

  @override
  @JsonKey()
  final AutoSuggestionState sugggestionStatus;
  @override
  @JsonKey()
  final RequiredObject<Unit> unit;
  @override
  @JsonKey()
  final RequiredObject<Unit> fromUnit;
  @override
  @JsonKey()
  final Number quantity;
  @override
  @JsonKey()
  final Number price;
  @override
  @JsonKey()
  final UnitEntryStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'UnitEntryState(name: $name, unitSuggestions: $unitSuggestions, sugggestionStatus: $sugggestionStatus, unit: $unit, fromUnit: $fromUnit, quantity: $quantity, price: $price, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitEntryState &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._unitSuggestions, _unitSuggestions) &&
            (identical(other.sugggestionStatus, sugggestionStatus) ||
                other.sugggestionStatus == sugggestionStatus) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.fromUnit, fromUnit) ||
                other.fromUnit == fromUnit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_unitSuggestions),
      sugggestionStatus,
      unit,
      fromUnit,
      quantity,
      price,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnitEntryStateCopyWith<_$_UnitEntryState> get copyWith =>
      __$$_UnitEntryStateCopyWithImpl<_$_UnitEntryState>(this, _$identity);
}

abstract class _UnitEntryState implements UnitEntryState {
  const factory _UnitEntryState(
      {final Name name,
      final List<Unit> unitSuggestions,
      final AutoSuggestionState sugggestionStatus,
      final RequiredObject<Unit> unit,
      final RequiredObject<Unit> fromUnit,
      final Number quantity,
      final Number price,
      final UnitEntryStatus status,
      final String errorMessage}) = _$_UnitEntryState;

  @override
  Name get name;
  @override
  List<Unit> get unitSuggestions;
  @override
  AutoSuggestionState get sugggestionStatus;
  @override
  RequiredObject<Unit> get unit;
  @override
  RequiredObject<Unit> get fromUnit;
  @override
  Number get quantity;
  @override
  Number get price;
  @override
  UnitEntryStatus get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UnitEntryStateCopyWith<_$_UnitEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}
