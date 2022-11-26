// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'institution_clients_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstitutionClientsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionClientsEventCopyWith<$Res> {
  factory $InstitutionClientsEventCopyWith(InstitutionClientsEvent value,
          $Res Function(InstitutionClientsEvent) then) =
      _$InstitutionClientsEventCopyWithImpl<$Res, InstitutionClientsEvent>;
}

/// @nodoc
class _$InstitutionClientsEventCopyWithImpl<$Res,
        $Val extends InstitutionClientsEvent>
    implements $InstitutionClientsEventCopyWith<$Res> {
  _$InstitutionClientsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PhoneNumberChangedCopyWith<$Res> {
  factory _$$PhoneNumberChangedCopyWith(_$PhoneNumberChanged value,
          $Res Function(_$PhoneNumberChanged) then) =
      __$$PhoneNumberChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneNumberChangedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$PhoneNumberChanged>
    implements _$$PhoneNumberChangedCopyWith<$Res> {
  __$$PhoneNumberChangedCopyWithImpl(
      _$PhoneNumberChanged _value, $Res Function(_$PhoneNumberChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneNumberChanged(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberChanged implements PhoneNumberChanged {
  const _$PhoneNumberChanged({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'InstitutionClientsEvent.phoneNumberChanged(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberChanged &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberChangedCopyWith<_$PhoneNumberChanged> get copyWith =>
      __$$PhoneNumberChangedCopyWithImpl<_$PhoneNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) {
    return phoneNumberChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) {
    return phoneNumberChanged?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) {
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) {
    return phoneNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberChanged implements InstitutionClientsEvent {
  const factory PhoneNumberChanged({required final String phoneNumber}) =
      _$PhoneNumberChanged;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$PhoneNumberChangedCopyWith<_$PhoneNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameChangedCopyWith<$Res> {
  factory _$$NameChangedCopyWith(
          _$NameChanged value, $Res Function(_$NameChanged) then) =
      __$$NameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$NameChangedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$NameChanged>
    implements _$$NameChangedCopyWith<$Res> {
  __$$NameChangedCopyWithImpl(
      _$NameChanged _value, $Res Function(_$NameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$NameChanged(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameChanged implements NameChanged {
  const _$NameChanged({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'InstitutionClientsEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameChanged &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameChangedCopyWith<_$NameChanged> get copyWith =>
      __$$NameChangedCopyWithImpl<_$NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) {
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) {
    return nameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements InstitutionClientsEvent {
  const factory NameChanged({required final String name}) = _$NameChanged;

  String get name;
  @JsonKey(ignore: true)
  _$$NameChangedCopyWith<_$NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewPhoneNumberClickedCopyWith<$Res> {
  factory _$$NewPhoneNumberClickedCopyWith(_$NewPhoneNumberClicked value,
          $Res Function(_$NewPhoneNumberClicked) then) =
      __$$NewPhoneNumberClickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewPhoneNumberClickedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$NewPhoneNumberClicked>
    implements _$$NewPhoneNumberClickedCopyWith<$Res> {
  __$$NewPhoneNumberClickedCopyWithImpl(_$NewPhoneNumberClicked _value,
      $Res Function(_$NewPhoneNumberClicked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewPhoneNumberClicked implements NewPhoneNumberClicked {
  const _$NewPhoneNumberClicked();

  @override
  String toString() {
    return 'InstitutionClientsEvent.newPhoneNumberClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewPhoneNumberClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) {
    return newPhoneNumberClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) {
    return newPhoneNumberClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (newPhoneNumberClicked != null) {
      return newPhoneNumberClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) {
    return newPhoneNumberClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) {
    return newPhoneNumberClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (newPhoneNumberClicked != null) {
      return newPhoneNumberClicked(this);
    }
    return orElse();
  }
}

abstract class NewPhoneNumberClicked implements InstitutionClientsEvent {
  const factory NewPhoneNumberClicked() = _$NewPhoneNumberClicked;
}

/// @nodoc
abstract class _$$UserProfileSelectedCopyWith<$Res> {
  factory _$$UserProfileSelectedCopyWith(_$UserProfileSelected value,
          $Res Function(_$UserProfileSelected) then) =
      __$$UserProfileSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfile userProfile});
}

/// @nodoc
class __$$UserProfileSelectedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$UserProfileSelected>
    implements _$$UserProfileSelectedCopyWith<$Res> {
  __$$UserProfileSelectedCopyWithImpl(
      _$UserProfileSelected _value, $Res Function(_$UserProfileSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
  }) {
    return _then(_$UserProfileSelected(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }
}

/// @nodoc

class _$UserProfileSelected implements UserProfileSelected {
  const _$UserProfileSelected({required this.userProfile});

  @override
  final UserProfile userProfile;

  @override
  String toString() {
    return 'InstitutionClientsEvent.userSelected(userProfile: $userProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileSelected &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileSelectedCopyWith<_$UserProfileSelected> get copyWith =>
      __$$UserProfileSelectedCopyWithImpl<_$UserProfileSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) {
    return userSelected(userProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) {
    return userSelected?.call(userProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(userProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) {
    return userSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) {
    return userSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(this);
    }
    return orElse();
  }
}

abstract class UserProfileSelected implements InstitutionClientsEvent {
  const factory UserProfileSelected({required final UserProfile userProfile}) =
      _$UserProfileSelected;

  UserProfile get userProfile;
  @JsonKey(ignore: true)
  _$$UserProfileSelectedCopyWith<_$UserProfileSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveSelectionButtonClickedCopyWith<$Res> {
  factory _$$RemoveSelectionButtonClickedCopyWith(
          _$RemoveSelectionButtonClicked value,
          $Res Function(_$RemoveSelectionButtonClicked) then) =
      __$$RemoveSelectionButtonClickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveSelectionButtonClickedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res,
        _$RemoveSelectionButtonClicked>
    implements _$$RemoveSelectionButtonClickedCopyWith<$Res> {
  __$$RemoveSelectionButtonClickedCopyWithImpl(
      _$RemoveSelectionButtonClicked _value,
      $Res Function(_$RemoveSelectionButtonClicked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveSelectionButtonClicked implements RemoveSelectionButtonClicked {
  const _$RemoveSelectionButtonClicked();

  @override
  String toString() {
    return 'InstitutionClientsEvent.removeSelectionButtonClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveSelectionButtonClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) {
    return removeSelectionButtonClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) {
    return removeSelectionButtonClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (removeSelectionButtonClicked != null) {
      return removeSelectionButtonClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) {
    return removeSelectionButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) {
    return removeSelectionButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (removeSelectionButtonClicked != null) {
      return removeSelectionButtonClicked(this);
    }
    return orElse();
  }
}

abstract class RemoveSelectionButtonClicked implements InstitutionClientsEvent {
  const factory RemoveSelectionButtonClicked() = _$RemoveSelectionButtonClicked;
}

/// @nodoc
abstract class _$$AddButtonClickedCopyWith<$Res> {
  factory _$$AddButtonClickedCopyWith(
          _$AddButtonClicked value, $Res Function(_$AddButtonClicked) then) =
      __$$AddButtonClickedCopyWithImpl<$Res>;
  @useResult
  $Res call({String institutionId});
}

/// @nodoc
class __$$AddButtonClickedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$AddButtonClicked>
    implements _$$AddButtonClickedCopyWith<$Res> {
  __$$AddButtonClickedCopyWithImpl(
      _$AddButtonClicked _value, $Res Function(_$AddButtonClicked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? institutionId = null,
  }) {
    return _then(_$AddButtonClicked(
      institutionId: null == institutionId
          ? _value.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddButtonClicked implements AddButtonClicked {
  const _$AddButtonClicked({required this.institutionId});

  @override
  final String institutionId;

  @override
  String toString() {
    return 'InstitutionClientsEvent.addButtonClicked(institutionId: $institutionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddButtonClicked &&
            (identical(other.institutionId, institutionId) ||
                other.institutionId == institutionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, institutionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddButtonClickedCopyWith<_$AddButtonClicked> get copyWith =>
      __$$AddButtonClickedCopyWithImpl<_$AddButtonClicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function(String name) nameChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
    required TResult Function(String institutionId) addButtonClicked,
  }) {
    return addButtonClicked(institutionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
    TResult? Function(String institutionId)? addButtonClicked,
  }) {
    return addButtonClicked?.call(institutionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function(String name)? nameChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    TResult Function(String institutionId)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (addButtonClicked != null) {
      return addButtonClicked(institutionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
    required TResult Function(AddButtonClicked value) addButtonClicked,
  }) {
    return addButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NameChanged value)? nameChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult? Function(AddButtonClicked value)? addButtonClicked,
  }) {
    return addButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    TResult Function(AddButtonClicked value)? addButtonClicked,
    required TResult orElse(),
  }) {
    if (addButtonClicked != null) {
      return addButtonClicked(this);
    }
    return orElse();
  }
}

abstract class AddButtonClicked implements InstitutionClientsEvent {
  const factory AddButtonClicked({required final String institutionId}) =
      _$AddButtonClicked;

  String get institutionId;
  @JsonKey(ignore: true)
  _$$AddButtonClickedCopyWith<_$AddButtonClicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InstitutionClientsState {
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  Option<UserProfile> get userProfile => throw _privateConstructorUsedError;
  bool get addingNonExistentProfile => throw _privateConstructorUsedError;
  Iterable<UserProfile> get userSuggestions =>
      throw _privateConstructorUsedError;
  AutoSuggestionState get suggestionState => throw _privateConstructorUsedError;
  InstitutionClientsStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  InstitutionClient? get addedClient => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstitutionClientsStateCopyWith<InstitutionClientsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionClientsStateCopyWith<$Res> {
  factory $InstitutionClientsStateCopyWith(InstitutionClientsState value,
          $Res Function(InstitutionClientsState) then) =
      _$InstitutionClientsStateCopyWithImpl<$Res, InstitutionClientsState>;
  @useResult
  $Res call(
      {PhoneNumber phoneNumber,
      Name name,
      Option<UserProfile> userProfile,
      bool addingNonExistentProfile,
      Iterable<UserProfile> userSuggestions,
      AutoSuggestionState suggestionState,
      InstitutionClientsStatus status,
      String errorMessage,
      InstitutionClient? addedClient});
}

/// @nodoc
class _$InstitutionClientsStateCopyWithImpl<$Res,
        $Val extends InstitutionClientsState>
    implements $InstitutionClientsStateCopyWith<$Res> {
  _$InstitutionClientsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? name = null,
    Object? userProfile = null,
    Object? addingNonExistentProfile = null,
    Object? userSuggestions = null,
    Object? suggestionState = null,
    Object? status = null,
    Object? errorMessage = null,
    Object? addedClient = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as Option<UserProfile>,
      addingNonExistentProfile: null == addingNonExistentProfile
          ? _value.addingNonExistentProfile
          : addingNonExistentProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      userSuggestions: null == userSuggestions
          ? _value.userSuggestions
          : userSuggestions // ignore: cast_nullable_to_non_nullable
              as Iterable<UserProfile>,
      suggestionState: null == suggestionState
          ? _value.suggestionState
          : suggestionState // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstitutionClientsStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addedClient: freezed == addedClient
          ? _value.addedClient
          : addedClient // ignore: cast_nullable_to_non_nullable
              as InstitutionClient?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstitutionClientsStateCopyWith<$Res>
    implements $InstitutionClientsStateCopyWith<$Res> {
  factory _$$_InstitutionClientsStateCopyWith(_$_InstitutionClientsState value,
          $Res Function(_$_InstitutionClientsState) then) =
      __$$_InstitutionClientsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PhoneNumber phoneNumber,
      Name name,
      Option<UserProfile> userProfile,
      bool addingNonExistentProfile,
      Iterable<UserProfile> userSuggestions,
      AutoSuggestionState suggestionState,
      InstitutionClientsStatus status,
      String errorMessage,
      InstitutionClient? addedClient});
}

/// @nodoc
class __$$_InstitutionClientsStateCopyWithImpl<$Res>
    extends _$InstitutionClientsStateCopyWithImpl<$Res,
        _$_InstitutionClientsState>
    implements _$$_InstitutionClientsStateCopyWith<$Res> {
  __$$_InstitutionClientsStateCopyWithImpl(_$_InstitutionClientsState _value,
      $Res Function(_$_InstitutionClientsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? name = null,
    Object? userProfile = null,
    Object? addingNonExistentProfile = null,
    Object? userSuggestions = null,
    Object? suggestionState = null,
    Object? status = null,
    Object? errorMessage = null,
    Object? addedClient = freezed,
  }) {
    return _then(_$_InstitutionClientsState(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as Option<UserProfile>,
      addingNonExistentProfile: null == addingNonExistentProfile
          ? _value.addingNonExistentProfile
          : addingNonExistentProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      userSuggestions: null == userSuggestions
          ? _value.userSuggestions
          : userSuggestions // ignore: cast_nullable_to_non_nullable
              as Iterable<UserProfile>,
      suggestionState: null == suggestionState
          ? _value.suggestionState
          : suggestionState // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstitutionClientsStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      addedClient: freezed == addedClient
          ? _value.addedClient
          : addedClient // ignore: cast_nullable_to_non_nullable
              as InstitutionClient?,
    ));
  }
}

/// @nodoc

class _$_InstitutionClientsState implements _InstitutionClientsState {
  const _$_InstitutionClientsState(
      {this.phoneNumber = const PhoneNumber.pure(),
      this.name = const Name.pure(),
      this.userProfile = const None<UserProfile>(),
      this.addingNonExistentProfile = false,
      this.userSuggestions = const Iterable.empty(),
      this.suggestionState = AutoSuggestionState.emptyText,
      this.status = InstitutionClientsStatus.initial,
      this.errorMessage = '',
      this.addedClient});

  @override
  @JsonKey()
  final PhoneNumber phoneNumber;
  @override
  @JsonKey()
  final Name name;
  @override
  @JsonKey()
  final Option<UserProfile> userProfile;
  @override
  @JsonKey()
  final bool addingNonExistentProfile;
  @override
  @JsonKey()
  final Iterable<UserProfile> userSuggestions;
  @override
  @JsonKey()
  final AutoSuggestionState suggestionState;
  @override
  @JsonKey()
  final InstitutionClientsStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final InstitutionClient? addedClient;

  @override
  String toString() {
    return 'InstitutionClientsState(phoneNumber: $phoneNumber, name: $name, userProfile: $userProfile, addingNonExistentProfile: $addingNonExistentProfile, userSuggestions: $userSuggestions, suggestionState: $suggestionState, status: $status, errorMessage: $errorMessage, addedClient: $addedClient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstitutionClientsState &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(
                    other.addingNonExistentProfile, addingNonExistentProfile) ||
                other.addingNonExistentProfile == addingNonExistentProfile) &&
            const DeepCollectionEquality()
                .equals(other.userSuggestions, userSuggestions) &&
            (identical(other.suggestionState, suggestionState) ||
                other.suggestionState == suggestionState) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.addedClient, addedClient) ||
                other.addedClient == addedClient));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneNumber,
      name,
      userProfile,
      addingNonExistentProfile,
      const DeepCollectionEquality().hash(userSuggestions),
      suggestionState,
      status,
      errorMessage,
      addedClient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstitutionClientsStateCopyWith<_$_InstitutionClientsState>
      get copyWith =>
          __$$_InstitutionClientsStateCopyWithImpl<_$_InstitutionClientsState>(
              this, _$identity);
}

abstract class _InstitutionClientsState implements InstitutionClientsState {
  const factory _InstitutionClientsState(
      {final PhoneNumber phoneNumber,
      final Name name,
      final Option<UserProfile> userProfile,
      final bool addingNonExistentProfile,
      final Iterable<UserProfile> userSuggestions,
      final AutoSuggestionState suggestionState,
      final InstitutionClientsStatus status,
      final String errorMessage,
      final InstitutionClient? addedClient}) = _$_InstitutionClientsState;

  @override
  PhoneNumber get phoneNumber;
  @override
  Name get name;
  @override
  Option<UserProfile> get userProfile;
  @override
  bool get addingNonExistentProfile;
  @override
  Iterable<UserProfile> get userSuggestions;
  @override
  AutoSuggestionState get suggestionState;
  @override
  InstitutionClientsStatus get status;
  @override
  String get errorMessage;
  @override
  InstitutionClient? get addedClient;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionClientsStateCopyWith<_$_InstitutionClientsState>
      get copyWith => throw _privateConstructorUsedError;
}
