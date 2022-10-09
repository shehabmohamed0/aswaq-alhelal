// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'institution_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstitutionOrdersState {
  List<Order> get pendingOrders => throw _privateConstructorUsedError;
  RequestState get pendingOrdersState => throw _privateConstructorUsedError;
  List<Order> get processingOrders => throw _privateConstructorUsedError;
  RequestState get processingOrdersState => throw _privateConstructorUsedError;
  RequestState get updateState => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstitutionOrdersStateCopyWith<InstitutionOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionOrdersStateCopyWith<$Res> {
  factory $InstitutionOrdersStateCopyWith(InstitutionOrdersState value,
          $Res Function(InstitutionOrdersState) then) =
      _$InstitutionOrdersStateCopyWithImpl<$Res>;
  $Res call(
      {List<Order> pendingOrders,
      RequestState pendingOrdersState,
      List<Order> processingOrders,
      RequestState processingOrdersState,
      RequestState updateState,
      String errorMessage});
}

/// @nodoc
class _$InstitutionOrdersStateCopyWithImpl<$Res>
    implements $InstitutionOrdersStateCopyWith<$Res> {
  _$InstitutionOrdersStateCopyWithImpl(this._value, this._then);

  final InstitutionOrdersState _value;
  // ignore: unused_field
  final $Res Function(InstitutionOrdersState) _then;

  @override
  $Res call({
    Object? pendingOrders = freezed,
    Object? pendingOrdersState = freezed,
    Object? processingOrders = freezed,
    Object? processingOrdersState = freezed,
    Object? updateState = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      pendingOrders: pendingOrders == freezed
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      pendingOrdersState: pendingOrdersState == freezed
          ? _value.pendingOrdersState
          : pendingOrdersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      processingOrders: processingOrders == freezed
          ? _value.processingOrders
          : processingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      processingOrdersState: processingOrdersState == freezed
          ? _value.processingOrdersState
          : processingOrdersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      updateState: updateState == freezed
          ? _value.updateState
          : updateState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InstitutionOrdersStateCopyWith<$Res>
    implements $InstitutionOrdersStateCopyWith<$Res> {
  factory _$$_InstitutionOrdersStateCopyWith(_$_InstitutionOrdersState value,
          $Res Function(_$_InstitutionOrdersState) then) =
      __$$_InstitutionOrdersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Order> pendingOrders,
      RequestState pendingOrdersState,
      List<Order> processingOrders,
      RequestState processingOrdersState,
      RequestState updateState,
      String errorMessage});
}

/// @nodoc
class __$$_InstitutionOrdersStateCopyWithImpl<$Res>
    extends _$InstitutionOrdersStateCopyWithImpl<$Res>
    implements _$$_InstitutionOrdersStateCopyWith<$Res> {
  __$$_InstitutionOrdersStateCopyWithImpl(_$_InstitutionOrdersState _value,
      $Res Function(_$_InstitutionOrdersState) _then)
      : super(_value, (v) => _then(v as _$_InstitutionOrdersState));

  @override
  _$_InstitutionOrdersState get _value =>
      super._value as _$_InstitutionOrdersState;

  @override
  $Res call({
    Object? pendingOrders = freezed,
    Object? pendingOrdersState = freezed,
    Object? processingOrders = freezed,
    Object? processingOrdersState = freezed,
    Object? updateState = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_InstitutionOrdersState(
      pendingOrders: pendingOrders == freezed
          ? _value._pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      pendingOrdersState: pendingOrdersState == freezed
          ? _value.pendingOrdersState
          : pendingOrdersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      processingOrders: processingOrders == freezed
          ? _value._processingOrders
          : processingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      processingOrdersState: processingOrdersState == freezed
          ? _value.processingOrdersState
          : processingOrdersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      updateState: updateState == freezed
          ? _value.updateState
          : updateState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InstitutionOrdersState implements _InstitutionOrdersState {
  const _$_InstitutionOrdersState(
      {final List<Order> pendingOrders = const [],
      this.pendingOrdersState = RequestState.initial,
      final List<Order> processingOrders = const [],
      this.processingOrdersState = RequestState.initial,
      this.updateState = RequestState.initial,
      this.errorMessage = 'Error'})
      : _pendingOrders = pendingOrders,
        _processingOrders = processingOrders;

  final List<Order> _pendingOrders;
  @override
  @JsonKey()
  List<Order> get pendingOrders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingOrders);
  }

  @override
  @JsonKey()
  final RequestState pendingOrdersState;
  final List<Order> _processingOrders;
  @override
  @JsonKey()
  List<Order> get processingOrders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_processingOrders);
  }

  @override
  @JsonKey()
  final RequestState processingOrdersState;
  @override
  @JsonKey()
  final RequestState updateState;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'InstitutionOrdersState(pendingOrders: $pendingOrders, pendingOrdersState: $pendingOrdersState, processingOrders: $processingOrders, processingOrdersState: $processingOrdersState, updateState: $updateState, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstitutionOrdersState &&
            const DeepCollectionEquality()
                .equals(other._pendingOrders, _pendingOrders) &&
            const DeepCollectionEquality()
                .equals(other.pendingOrdersState, pendingOrdersState) &&
            const DeepCollectionEquality()
                .equals(other._processingOrders, _processingOrders) &&
            const DeepCollectionEquality()
                .equals(other.processingOrdersState, processingOrdersState) &&
            const DeepCollectionEquality()
                .equals(other.updateState, updateState) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pendingOrders),
      const DeepCollectionEquality().hash(pendingOrdersState),
      const DeepCollectionEquality().hash(_processingOrders),
      const DeepCollectionEquality().hash(processingOrdersState),
      const DeepCollectionEquality().hash(updateState),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_InstitutionOrdersStateCopyWith<_$_InstitutionOrdersState> get copyWith =>
      __$$_InstitutionOrdersStateCopyWithImpl<_$_InstitutionOrdersState>(
          this, _$identity);
}

abstract class _InstitutionOrdersState implements InstitutionOrdersState {
  const factory _InstitutionOrdersState(
      {final List<Order> pendingOrders,
      final RequestState pendingOrdersState,
      final List<Order> processingOrders,
      final RequestState processingOrdersState,
      final RequestState updateState,
      final String errorMessage}) = _$_InstitutionOrdersState;

  @override
  List<Order> get pendingOrders;
  @override
  RequestState get pendingOrdersState;
  @override
  List<Order> get processingOrders;
  @override
  RequestState get processingOrdersState;
  @override
  RequestState get updateState;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionOrdersStateCopyWith<_$_InstitutionOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
