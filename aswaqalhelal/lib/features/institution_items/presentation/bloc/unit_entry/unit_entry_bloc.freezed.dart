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
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitEntryEventCopyWith<$Res> {
  factory $UnitEntryEventCopyWith(
          UnitEntryEvent value, $Res Function(UnitEntryEvent) then) =
      _$UnitEntryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnitEntryEventCopyWithImpl<$Res>
    implements $UnitEntryEventCopyWith<$Res> {
  _$UnitEntryEventCopyWithImpl(this._value, this._then);

  final UnitEntryEvent _value;
  // ignore: unused_field
  final $Res Function(UnitEntryEvent) _then;
}

/// @nodoc
abstract class _$$UnitNameChangedCopyWith<$Res> {
  factory _$$UnitNameChangedCopyWith(
          _$UnitNameChanged value, $Res Function(_$UnitNameChanged) then) =
      __$$UnitNameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$$UnitNameChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$UnitNameChangedCopyWith<$Res> {
  __$$UnitNameChangedCopyWithImpl(
      _$UnitNameChanged _value, $Res Function(_$UnitNameChanged) _then)
      : super(_value, (v) => _then(v as _$UnitNameChanged));

  @override
  _$UnitNameChanged get _value => super._value as _$UnitNameChanged;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$UnitNameChanged(
      name: name == freezed
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
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$UnitNameChangedCopyWith<_$UnitNameChanged> get copyWith =>
      __$$UnitNameChangedCopyWithImpl<_$UnitNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return unitNameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return unitNameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
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
  }) {
    return unitNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
}

/// @nodoc
class __$$UnitAddedCopyWithImpl<$Res> extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$UnitAddedCopyWith<$Res> {
  __$$UnitAddedCopyWithImpl(
      _$UnitAdded _value, $Res Function(_$UnitAdded) _then)
      : super(_value, (v) => _then(v as _$UnitAdded));

  @override
  _$UnitAdded get _value => super._value as _$UnitAdded;
}

/// @nodoc

class _$UnitAdded implements UnitAdded {
  const _$UnitAdded();

  @override
  String toString() {
    return 'UnitEntryEvent.unitAdded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnitAdded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return unitAdded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return unitAdded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    required TResult orElse(),
  }) {
    if (unitAdded != null) {
      return unitAdded();
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
  }) {
    return unitAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
    required TResult orElse(),
  }) {
    if (unitAdded != null) {
      return unitAdded(this);
    }
    return orElse();
  }
}

abstract class UnitAdded implements UnitEntryEvent {
  const factory UnitAdded() = _$UnitAdded;
}

/// @nodoc
abstract class _$$UnitSelectedCopyWith<$Res> {
  factory _$$UnitSelectedCopyWith(
          _$UnitSelected value, $Res Function(_$UnitSelected) then) =
      __$$UnitSelectedCopyWithImpl<$Res>;
  $Res call({Unit unit});
}

/// @nodoc
class __$$UnitSelectedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$UnitSelectedCopyWith<$Res> {
  __$$UnitSelectedCopyWithImpl(
      _$UnitSelected _value, $Res Function(_$UnitSelected) _then)
      : super(_value, (v) => _then(v as _$UnitSelected));

  @override
  _$UnitSelected get _value => super._value as _$UnitSelected;

  @override
  $Res call({
    Object? unit = freezed,
  }) {
    return _then(_$UnitSelected(
      unit: unit == freezed
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
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  _$$UnitSelectedCopyWith<_$UnitSelected> get copyWith =>
      __$$UnitSelectedCopyWithImpl<_$UnitSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return unitSelected(unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return unitSelected?.call(unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
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
  }) {
    return unitSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
    extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$UnitUnselectedCopyWith<$Res> {
  __$$UnitUnselectedCopyWithImpl(
      _$UnitUnselected _value, $Res Function(_$UnitUnselected) _then)
      : super(_value, (v) => _then(v as _$UnitUnselected));

  @override
  _$UnitUnselected get _value => super._value as _$UnitUnselected;
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
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return unitUnselected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return unitUnselected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
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
  }) {
    return unitUnselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
  $Res call({Unit unit});
}

/// @nodoc
class __$$FromUnitChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$FromUnitChangedCopyWith<$Res> {
  __$$FromUnitChangedCopyWithImpl(
      _$FromUnitChanged _value, $Res Function(_$FromUnitChanged) _then)
      : super(_value, (v) => _then(v as _$FromUnitChanged));

  @override
  _$FromUnitChanged get _value => super._value as _$FromUnitChanged;

  @override
  $Res call({
    Object? unit = freezed,
  }) {
    return _then(_$FromUnitChanged(
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
    ));
  }
}

/// @nodoc

class _$FromUnitChanged implements FromUnitChanged {
  const _$FromUnitChanged({required this.unit});

  @override
  final Unit unit;

  @override
  String toString() {
    return 'UnitEntryEvent.fromUnitChanged(unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromUnitChanged &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  _$$FromUnitChangedCopyWith<_$FromUnitChanged> get copyWith =>
      __$$FromUnitChangedCopyWithImpl<_$FromUnitChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return fromUnitChanged(unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return fromUnitChanged?.call(unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    required TResult orElse(),
  }) {
    if (fromUnitChanged != null) {
      return fromUnitChanged(unit);
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
  }) {
    return fromUnitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
    required TResult orElse(),
  }) {
    if (fromUnitChanged != null) {
      return fromUnitChanged(this);
    }
    return orElse();
  }
}

abstract class FromUnitChanged implements UnitEntryEvent {
  const factory FromUnitChanged({required final Unit unit}) = _$FromUnitChanged;

  Unit get unit;
  @JsonKey(ignore: true)
  _$$FromUnitChangedCopyWith<_$FromUnitChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuantityChangedCopyWith<$Res> {
  factory _$$QuantityChangedCopyWith(
          _$QuantityChanged value, $Res Function(_$QuantityChanged) then) =
      __$$QuantityChangedCopyWithImpl<$Res>;
  $Res call({String quantity});
}

/// @nodoc
class __$$QuantityChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$QuantityChangedCopyWith<$Res> {
  __$$QuantityChangedCopyWithImpl(
      _$QuantityChanged _value, $Res Function(_$QuantityChanged) _then)
      : super(_value, (v) => _then(v as _$QuantityChanged));

  @override
  _$QuantityChanged get _value => super._value as _$QuantityChanged;

  @override
  $Res call({
    Object? quantity = freezed,
  }) {
    return _then(_$QuantityChanged(
      quantity: quantity == freezed
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
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$QuantityChangedCopyWith<_$QuantityChanged> get copyWith =>
      __$$QuantityChangedCopyWithImpl<_$QuantityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return quantityChanged(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return quantityChanged?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
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
  }) {
    return quantityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
  $Res call({String price});
}

/// @nodoc
class __$$PriceChangedCopyWithImpl<$Res>
    extends _$UnitEntryEventCopyWithImpl<$Res>
    implements _$$PriceChangedCopyWith<$Res> {
  __$$PriceChangedCopyWithImpl(
      _$PriceChanged _value, $Res Function(_$PriceChanged) _then)
      : super(_value, (v) => _then(v as _$PriceChanged));

  @override
  _$PriceChanged get _value => super._value as _$PriceChanged;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_$PriceChanged(
      price: price == freezed
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
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$PriceChangedCopyWith<_$PriceChanged> get copyWith =>
      __$$PriceChangedCopyWithImpl<_$PriceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) unitNameChanged,
    required TResult Function() unitAdded,
    required TResult Function(Unit unit) unitSelected,
    required TResult Function() unitUnselected,
    required TResult Function(Unit unit) fromUnitChanged,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
  }) {
    return priceChanged(price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
  }) {
    return priceChanged?.call(price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? unitNameChanged,
    TResult Function()? unitAdded,
    TResult Function(Unit unit)? unitSelected,
    TResult Function()? unitUnselected,
    TResult Function(Unit unit)? fromUnitChanged,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
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
  }) {
    return priceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
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
      _$UnitEntryStateCopyWithImpl<$Res>;
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
class _$UnitEntryStateCopyWithImpl<$Res>
    implements $UnitEntryStateCopyWith<$Res> {
  _$UnitEntryStateCopyWithImpl(this._value, this._then);

  final UnitEntryState _value;
  // ignore: unused_field
  final $Res Function(UnitEntryState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? unitSuggestions = freezed,
    Object? sugggestionStatus = freezed,
    Object? unit = freezed,
    Object? fromUnit = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      unitSuggestions: unitSuggestions == freezed
          ? _value.unitSuggestions
          : unitSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      sugggestionStatus: sugggestionStatus == freezed
          ? _value.sugggestionStatus
          : sugggestionStatus // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      fromUnit: fromUnit == freezed
          ? _value.fromUnit
          : fromUnit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Number,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Number,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnitEntryStatus,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UnitEntryStateCopyWith<$Res>
    implements $UnitEntryStateCopyWith<$Res> {
  factory _$$_UnitEntryStateCopyWith(
          _$_UnitEntryState value, $Res Function(_$_UnitEntryState) then) =
      __$$_UnitEntryStateCopyWithImpl<$Res>;
  @override
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
    extends _$UnitEntryStateCopyWithImpl<$Res>
    implements _$$_UnitEntryStateCopyWith<$Res> {
  __$$_UnitEntryStateCopyWithImpl(
      _$_UnitEntryState _value, $Res Function(_$_UnitEntryState) _then)
      : super(_value, (v) => _then(v as _$_UnitEntryState));

  @override
  _$_UnitEntryState get _value => super._value as _$_UnitEntryState;

  @override
  $Res call({
    Object? name = freezed,
    Object? unitSuggestions = freezed,
    Object? sugggestionStatus = freezed,
    Object? unit = freezed,
    Object? fromUnit = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_UnitEntryState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      unitSuggestions: unitSuggestions == freezed
          ? _value._unitSuggestions
          : unitSuggestions // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      sugggestionStatus: sugggestionStatus == freezed
          ? _value.sugggestionStatus
          : sugggestionStatus // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      fromUnit: fromUnit == freezed
          ? _value.fromUnit
          : fromUnit // ignore: cast_nullable_to_non_nullable
              as RequiredObject<Unit>,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Number,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Number,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnitEntryStatus,
      errorMessage: errorMessage == freezed
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
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._unitSuggestions, _unitSuggestions) &&
            const DeepCollectionEquality()
                .equals(other.sugggestionStatus, sugggestionStatus) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.fromUnit, fromUnit) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_unitSuggestions),
      const DeepCollectionEquality().hash(sugggestionStatus),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(fromUnit),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
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
