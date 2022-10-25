// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'units_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnitsEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

  @JsonKey(ignore: true)
  $UnitsEventCopyWith<UnitsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitsEventCopyWith<$Res> {
  factory $UnitsEventCopyWith(
          UnitsEvent value, $Res Function(UnitsEvent) then) =
      _$UnitsEventCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class _$UnitsEventCopyWithImpl<$Res> implements $UnitsEventCopyWith<$Res> {
  _$UnitsEventCopyWithImpl(this._value, this._then);

  final UnitsEvent _value;
  // ignore: unused_field
  final $Res Function(UnitsEvent) _then;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$UnitNameChangedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$UnitNameChangedCopyWith(
          _$UnitNameChanged value, $Res Function(_$UnitNameChanged) then) =
      __$$UnitNameChangedCopyWithImpl<$Res>;
  @override
  $Res call({String name, int index});
}

/// @nodoc
class __$$UnitNameChangedCopyWithImpl<$Res>
    extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$UnitNameChangedCopyWith<$Res> {
  __$$UnitNameChangedCopyWithImpl(
      _$UnitNameChanged _value, $Res Function(_$UnitNameChanged) _then)
      : super(_value, (v) => _then(v as _$UnitNameChanged));

  @override
  _$UnitNameChanged get _value => super._value as _$UnitNameChanged;

  @override
  $Res call({
    Object? name = freezed,
    Object? index = freezed,
  }) {
    return _then(_$UnitNameChanged(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnitNameChanged implements UnitNameChanged {
  const _$UnitNameChanged({required this.name, required this.index});

  @override
  final String name;
  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.unitNameChanged(name: $name, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitNameChanged &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$UnitNameChangedCopyWith<_$UnitNameChanged> get copyWith =>
      __$$UnitNameChangedCopyWithImpl<_$UnitNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return unitNameChanged(name, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return unitNameChanged?.call(name, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitNameChanged != null) {
      return unitNameChanged(name, index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class UnitNameChanged implements UnitsEvent {
  const factory UnitNameChanged(
      {required final String name,
      required final int index}) = _$UnitNameChanged;

  String get name;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$UnitNameChangedCopyWith<_$UnitNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnitAddedCopyWith<$Res> implements $UnitsEventCopyWith<$Res> {
  factory _$$UnitAddedCopyWith(
          _$UnitAdded value, $Res Function(_$UnitAdded) then) =
      __$$UnitAddedCopyWithImpl<$Res>;
  @override
  $Res call({String name, int index});
}

/// @nodoc
class __$$UnitAddedCopyWithImpl<$Res> extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$UnitAddedCopyWith<$Res> {
  __$$UnitAddedCopyWithImpl(
      _$UnitAdded _value, $Res Function(_$UnitAdded) _then)
      : super(_value, (v) => _then(v as _$UnitAdded));

  @override
  _$UnitAdded get _value => super._value as _$UnitAdded;

  @override
  $Res call({
    Object? name = freezed,
    Object? index = freezed,
  }) {
    return _then(_$UnitAdded(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnitAdded implements UnitAdded {
  const _$UnitAdded(this.name, this.index);

  @override
  final String name;
  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.unitAdded(name: $name, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitAdded &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$UnitAddedCopyWith<_$UnitAdded> get copyWith =>
      __$$UnitAddedCopyWithImpl<_$UnitAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return unitAdded(name, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return unitAdded?.call(name, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitAdded != null) {
      return unitAdded(name, index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class UnitAdded implements UnitsEvent {
  const factory UnitAdded(final String name, final int index) = _$UnitAdded;

  String get name;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$UnitAddedCopyWith<_$UnitAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnitSelectedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$UnitSelectedCopyWith(
          _$UnitSelected value, $Res Function(_$UnitSelected) then) =
      __$$UnitSelectedCopyWithImpl<$Res>;
  @override
  $Res call({Unit unit, int index});
}

/// @nodoc
class __$$UnitSelectedCopyWithImpl<$Res> extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$UnitSelectedCopyWith<$Res> {
  __$$UnitSelectedCopyWithImpl(
      _$UnitSelected _value, $Res Function(_$UnitSelected) _then)
      : super(_value, (v) => _then(v as _$UnitSelected));

  @override
  _$UnitSelected get _value => super._value as _$UnitSelected;

  @override
  $Res call({
    Object? unit = freezed,
    Object? index = freezed,
  }) {
    return _then(_$UnitSelected(
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnitSelected implements UnitSelected {
  const _$UnitSelected({required this.unit, required this.index});

  @override
  final Unit unit;
  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.unitSelected(unit: $unit, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitSelected &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$UnitSelectedCopyWith<_$UnitSelected> get copyWith =>
      __$$UnitSelectedCopyWithImpl<_$UnitSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return unitSelected(unit, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return unitSelected?.call(unit, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitSelected != null) {
      return unitSelected(unit, index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class UnitSelected implements UnitsEvent {
  const factory UnitSelected(
      {required final Unit unit, required final int index}) = _$UnitSelected;

  Unit get unit;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$UnitSelectedCopyWith<_$UnitSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnitUnselectedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$UnitUnselectedCopyWith(
          _$UnitUnselected value, $Res Function(_$UnitUnselected) then) =
      __$$UnitUnselectedCopyWithImpl<$Res>;
  @override
  $Res call({int index});
}

/// @nodoc
class __$$UnitUnselectedCopyWithImpl<$Res>
    extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$UnitUnselectedCopyWith<$Res> {
  __$$UnitUnselectedCopyWithImpl(
      _$UnitUnselected _value, $Res Function(_$UnitUnselected) _then)
      : super(_value, (v) => _then(v as _$UnitUnselected));

  @override
  _$UnitUnselected get _value => super._value as _$UnitUnselected;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$UnitUnselected(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnitUnselected implements UnitUnselected {
  const _$UnitUnselected({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.unitUnselected(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitUnselected &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$UnitUnselectedCopyWith<_$UnitUnselected> get copyWith =>
      __$$UnitUnselectedCopyWithImpl<_$UnitUnselected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return unitUnselected(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return unitUnselected?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (unitUnselected != null) {
      return unitUnselected(index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class UnitUnselected implements UnitsEvent {
  const factory UnitUnselected({required final int index}) = _$UnitUnselected;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$UnitUnselectedCopyWith<_$UnitUnselected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FromUnitChangedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$FromUnitChangedCopyWith(
          _$FromUnitChanged value, $Res Function(_$FromUnitChanged) then) =
      __$$FromUnitChangedCopyWithImpl<$Res>;
  @override
  $Res call({Unit unit, int index, double? quantity});
}

/// @nodoc
class __$$FromUnitChangedCopyWithImpl<$Res>
    extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$FromUnitChangedCopyWith<$Res> {
  __$$FromUnitChangedCopyWithImpl(
      _$FromUnitChanged _value, $Res Function(_$FromUnitChanged) _then)
      : super(_value, (v) => _then(v as _$FromUnitChanged));

  @override
  _$FromUnitChanged get _value => super._value as _$FromUnitChanged;

  @override
  $Res call({
    Object? unit = freezed,
    Object? index = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$FromUnitChanged(
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$FromUnitChanged implements FromUnitChanged {
  const _$FromUnitChanged(
      {required this.unit, required this.index, this.quantity});

  @override
  final Unit unit;
  @override
  final int index;
  @override
  final double? quantity;

  @override
  String toString() {
    return 'UnitsEvent.fromUnitChanged(unit: $unit, index: $index, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromUnitChanged &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$FromUnitChangedCopyWith<_$FromUnitChanged> get copyWith =>
      __$$FromUnitChangedCopyWithImpl<_$FromUnitChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return fromUnitChanged(unit, index, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return fromUnitChanged?.call(unit, index, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (fromUnitChanged != null) {
      return fromUnitChanged(unit, index, quantity);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class FromUnitChanged implements UnitsEvent {
  const factory FromUnitChanged(
      {required final Unit unit,
      required final int index,
      final double? quantity}) = _$FromUnitChanged;

  Unit get unit;
  @override
  int get index;
  double? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$FromUnitChangedCopyWith<_$FromUnitChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuantityChangedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$QuantityChangedCopyWith(
          _$QuantityChanged value, $Res Function(_$QuantityChanged) then) =
      __$$QuantityChangedCopyWithImpl<$Res>;
  @override
  $Res call({String quantity, int index});
}

/// @nodoc
class __$$QuantityChangedCopyWithImpl<$Res>
    extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$QuantityChangedCopyWith<$Res> {
  __$$QuantityChangedCopyWithImpl(
      _$QuantityChanged _value, $Res Function(_$QuantityChanged) _then)
      : super(_value, (v) => _then(v as _$QuantityChanged));

  @override
  _$QuantityChanged get _value => super._value as _$QuantityChanged;

  @override
  $Res call({
    Object? quantity = freezed,
    Object? index = freezed,
  }) {
    return _then(_$QuantityChanged(
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QuantityChanged implements QuantityChanged {
  const _$QuantityChanged({required this.quantity, required this.index});

  @override
  final String quantity;
  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.quantityChanged(quantity: $quantity, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuantityChanged &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$QuantityChangedCopyWith<_$QuantityChanged> get copyWith =>
      __$$QuantityChangedCopyWithImpl<_$QuantityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return quantityChanged(quantity, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return quantityChanged?.call(quantity, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (quantityChanged != null) {
      return quantityChanged(quantity, index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class QuantityChanged implements UnitsEvent {
  const factory QuantityChanged(
      {required final String quantity,
      required final int index}) = _$QuantityChanged;

  String get quantity;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$QuantityChangedCopyWith<_$QuantityChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceChangedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$PriceChangedCopyWith(
          _$PriceChanged value, $Res Function(_$PriceChanged) then) =
      __$$PriceChangedCopyWithImpl<$Res>;
  @override
  $Res call({String price, int index});
}

/// @nodoc
class __$$PriceChangedCopyWithImpl<$Res> extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$PriceChangedCopyWith<$Res> {
  __$$PriceChangedCopyWithImpl(
      _$PriceChanged _value, $Res Function(_$PriceChanged) _then)
      : super(_value, (v) => _then(v as _$PriceChanged));

  @override
  _$PriceChanged get _value => super._value as _$PriceChanged;

  @override
  $Res call({
    Object? price = freezed,
    Object? index = freezed,
  }) {
    return _then(_$PriceChanged(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PriceChanged implements PriceChanged {
  const _$PriceChanged({required this.price, required this.index});

  @override
  final String price;
  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.priceChanged(price: $price, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceChanged &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$PriceChangedCopyWith<_$PriceChanged> get copyWith =>
      __$$PriceChangedCopyWithImpl<_$PriceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return priceChanged(price, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return priceChanged?.call(price, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(price, index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class PriceChanged implements UnitsEvent {
  const factory PriceChanged(
      {required final String price, required final int index}) = _$PriceChanged;

  String get price;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$PriceChangedCopyWith<_$PriceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitForEditCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$$InitForEditCopyWith(
          _$InitForEdit value, $Res Function(_$InitForEdit) then) =
      __$$InitForEditCopyWithImpl<$Res>;
  @override
  $Res call({Unit unit, int index});
}

/// @nodoc
class __$$InitForEditCopyWithImpl<$Res> extends _$UnitsEventCopyWithImpl<$Res>
    implements _$$InitForEditCopyWith<$Res> {
  __$$InitForEditCopyWithImpl(
      _$InitForEdit _value, $Res Function(_$InitForEdit) _then)
      : super(_value, (v) => _then(v as _$InitForEdit));

  @override
  _$InitForEdit get _value => super._value as _$InitForEdit;

  @override
  $Res call({
    Object? unit = freezed,
    Object? index = freezed,
  }) {
    return _then(_$InitForEdit(
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitForEdit implements InitForEdit {
  const _$InitForEdit({required this.unit, required this.index});

  @override
  final Unit unit;
  @override
  final int index;

  @override
  String toString() {
    return 'UnitsEvent.initForEdit(unit: $unit, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitForEdit &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$InitForEditCopyWith<_$InitForEdit> get copyWith =>
      __$$InitForEditCopyWithImpl<_$InitForEdit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int index) unitNameChanged,
    required TResult Function(String name, int index) unitAdded,
    required TResult Function(Unit unit, int index) unitSelected,
    required TResult Function(int index) unitUnselected,
    required TResult Function(Unit unit, int index, double? quantity)
        fromUnitChanged,
    required TResult Function(String quantity, int index) quantityChanged,
    required TResult Function(String price, int index) priceChanged,
    required TResult Function(Unit unit, int index) initForEdit,
  }) {
    return initForEdit(unit, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
  }) {
    return initForEdit?.call(unit, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int index)? unitNameChanged,
    TResult Function(String name, int index)? unitAdded,
    TResult Function(Unit unit, int index)? unitSelected,
    TResult Function(int index)? unitUnselected,
    TResult Function(Unit unit, int index, double? quantity)? fromUnitChanged,
    TResult Function(String quantity, int index)? quantityChanged,
    TResult Function(String price, int index)? priceChanged,
    TResult Function(Unit unit, int index)? initForEdit,
    required TResult orElse(),
  }) {
    if (initForEdit != null) {
      return initForEdit(unit, index);
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
    TResult Function(UnitNameChanged value)? unitNameChanged,
    TResult Function(UnitAdded value)? unitAdded,
    TResult Function(UnitSelected value)? unitSelected,
    TResult Function(UnitUnselected value)? unitUnselected,
    TResult Function(FromUnitChanged value)? fromUnitChanged,
    TResult Function(QuantityChanged value)? quantityChanged,
    TResult Function(PriceChanged value)? priceChanged,
    TResult Function(InitForEdit value)? initForEdit,
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

abstract class InitForEdit implements UnitsEvent {
  const factory InitForEdit(
      {required final Unit unit, required final int index}) = _$InitForEdit;

  Unit get unit;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$InitForEditCopyWith<_$InitForEdit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UnitsState {
  List<UnitEntryRow> get units => throw _privateConstructorUsedError;
  UnitsStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnitsStateCopyWith<UnitsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitsStateCopyWith<$Res> {
  factory $UnitsStateCopyWith(
          UnitsState value, $Res Function(UnitsState) then) =
      _$UnitsStateCopyWithImpl<$Res>;
  $Res call({List<UnitEntryRow> units, UnitsStatus status});
}

/// @nodoc
class _$UnitsStateCopyWithImpl<$Res> implements $UnitsStateCopyWith<$Res> {
  _$UnitsStateCopyWithImpl(this._value, this._then);

  final UnitsState _value;
  // ignore: unused_field
  final $Res Function(UnitsState) _then;

  @override
  $Res call({
    Object? units = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<UnitEntryRow>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnitsStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_UnitsStateCopyWith<$Res>
    implements $UnitsStateCopyWith<$Res> {
  factory _$$_UnitsStateCopyWith(
          _$_UnitsState value, $Res Function(_$_UnitsState) then) =
      __$$_UnitsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<UnitEntryRow> units, UnitsStatus status});
}

/// @nodoc
class __$$_UnitsStateCopyWithImpl<$Res> extends _$UnitsStateCopyWithImpl<$Res>
    implements _$$_UnitsStateCopyWith<$Res> {
  __$$_UnitsStateCopyWithImpl(
      _$_UnitsState _value, $Res Function(_$_UnitsState) _then)
      : super(_value, (v) => _then(v as _$_UnitsState));

  @override
  _$_UnitsState get _value => super._value as _$_UnitsState;

  @override
  $Res call({
    Object? units = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_UnitsState(
      units: units == freezed
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<UnitEntryRow>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UnitsStatus,
    ));
  }
}

/// @nodoc

class _$_UnitsState implements _UnitsState {
  const _$_UnitsState(
      {final List<UnitEntryRow> units = const [],
      this.status = UnitsStatus.initial})
      : _units = units;

  final List<UnitEntryRow> _units;
  @override
  @JsonKey()
  List<UnitEntryRow> get units {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  @override
  @JsonKey()
  final UnitsStatus status;

  @override
  String toString() {
    return 'UnitsState(units: $units, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitsState &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_units),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_UnitsStateCopyWith<_$_UnitsState> get copyWith =>
      __$$_UnitsStateCopyWithImpl<_$_UnitsState>(this, _$identity);
}

abstract class _UnitsState implements UnitsState {
  const factory _UnitsState(
      {final List<UnitEntryRow> units,
      final UnitsStatus status}) = _$_UnitsState;

  @override
  List<UnitEntryRow> get units;
  @override
  UnitsStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_UnitsStateCopyWith<_$_UnitsState> get copyWith =>
      throw _privateConstructorUsedError;
}
