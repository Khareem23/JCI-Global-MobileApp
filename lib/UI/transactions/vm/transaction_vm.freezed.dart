// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RateParamTearOff {
  const _$RateParamTearOff();

  _RateParam call(
      {required String sendCurrency,
      required String receiveCurrency,
      required num amountToSend}) {
    return _RateParam(
      sendCurrency: sendCurrency,
      receiveCurrency: receiveCurrency,
      amountToSend: amountToSend,
    );
  }
}

/// @nodoc
const $RateParam = _$RateParamTearOff();

/// @nodoc
mixin _$RateParam {
  String get sendCurrency => throw _privateConstructorUsedError;
  String get receiveCurrency => throw _privateConstructorUsedError;
  num get amountToSend => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RateParamCopyWith<RateParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateParamCopyWith<$Res> {
  factory $RateParamCopyWith(RateParam value, $Res Function(RateParam) then) =
      _$RateParamCopyWithImpl<$Res>;
  $Res call({String sendCurrency, String receiveCurrency, num amountToSend});
}

/// @nodoc
class _$RateParamCopyWithImpl<$Res> implements $RateParamCopyWith<$Res> {
  _$RateParamCopyWithImpl(this._value, this._then);

  final RateParam _value;
  // ignore: unused_field
  final $Res Function(RateParam) _then;

  @override
  $Res call({
    Object? sendCurrency = freezed,
    Object? receiveCurrency = freezed,
    Object? amountToSend = freezed,
  }) {
    return _then(_value.copyWith(
      sendCurrency: sendCurrency == freezed
          ? _value.sendCurrency
          : sendCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      receiveCurrency: receiveCurrency == freezed
          ? _value.receiveCurrency
          : receiveCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$RateParamCopyWith<$Res> implements $RateParamCopyWith<$Res> {
  factory _$RateParamCopyWith(
          _RateParam value, $Res Function(_RateParam) then) =
      __$RateParamCopyWithImpl<$Res>;
  @override
  $Res call({String sendCurrency, String receiveCurrency, num amountToSend});
}

/// @nodoc
class __$RateParamCopyWithImpl<$Res> extends _$RateParamCopyWithImpl<$Res>
    implements _$RateParamCopyWith<$Res> {
  __$RateParamCopyWithImpl(_RateParam _value, $Res Function(_RateParam) _then)
      : super(_value, (v) => _then(v as _RateParam));

  @override
  _RateParam get _value => super._value as _RateParam;

  @override
  $Res call({
    Object? sendCurrency = freezed,
    Object? receiveCurrency = freezed,
    Object? amountToSend = freezed,
  }) {
    return _then(_RateParam(
      sendCurrency: sendCurrency == freezed
          ? _value.sendCurrency
          : sendCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      receiveCurrency: receiveCurrency == freezed
          ? _value.receiveCurrency
          : receiveCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      amountToSend: amountToSend == freezed
          ? _value.amountToSend
          : amountToSend // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$_RateParam implements _RateParam {
  _$_RateParam(
      {required this.sendCurrency,
      required this.receiveCurrency,
      required this.amountToSend});

  @override
  final String sendCurrency;
  @override
  final String receiveCurrency;
  @override
  final num amountToSend;

  @override
  String toString() {
    return 'RateParam(sendCurrency: $sendCurrency, receiveCurrency: $receiveCurrency, amountToSend: $amountToSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RateParam &&
            (identical(other.sendCurrency, sendCurrency) ||
                const DeepCollectionEquality()
                    .equals(other.sendCurrency, sendCurrency)) &&
            (identical(other.receiveCurrency, receiveCurrency) ||
                const DeepCollectionEquality()
                    .equals(other.receiveCurrency, receiveCurrency)) &&
            (identical(other.amountToSend, amountToSend) ||
                const DeepCollectionEquality()
                    .equals(other.amountToSend, amountToSend)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sendCurrency) ^
      const DeepCollectionEquality().hash(receiveCurrency) ^
      const DeepCollectionEquality().hash(amountToSend);

  @JsonKey(ignore: true)
  @override
  _$RateParamCopyWith<_RateParam> get copyWith =>
      __$RateParamCopyWithImpl<_RateParam>(this, _$identity);
}

abstract class _RateParam implements RateParam {
  factory _RateParam(
      {required String sendCurrency,
      required String receiveCurrency,
      required num amountToSend}) = _$_RateParam;

  @override
  String get sendCurrency => throw _privateConstructorUsedError;
  @override
  String get receiveCurrency => throw _privateConstructorUsedError;
  @override
  num get amountToSend => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RateParamCopyWith<_RateParam> get copyWith =>
      throw _privateConstructorUsedError;
}
