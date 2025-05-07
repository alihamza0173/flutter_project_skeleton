// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiMetaData> _$apiMetaDataSerializer = new _$ApiMetaDataSerializer();

class _$ApiMetaDataSerializer implements StructuredSerializer<ApiMetaData> {
  @override
  final Iterable<Type> types = const [ApiMetaData, _$ApiMetaData];
  @override
  final String wireName = 'ApiMetaData';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiMetaData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Object)));
    }
    return result;
  }

  @override
  ApiMetaData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiMetaDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiMetaData extends ApiMetaData {
  @override
  final Object? status;
  @override
  final String message;
  @override
  final String key;

  factory _$ApiMetaData([void Function(ApiMetaDataBuilder)? updates]) =>
      (new ApiMetaDataBuilder()..update(updates))._build();

  _$ApiMetaData._({this.status, required this.message, required this.key})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, r'ApiMetaData', 'message');
    BuiltValueNullFieldError.checkNotNull(key, r'ApiMetaData', 'key');
  }

  @override
  ApiMetaData rebuild(void Function(ApiMetaDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMetaDataBuilder toBuilder() => new ApiMetaDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMetaData &&
        status == other.status &&
        message == other.message &&
        key == other.key;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ApiMetaDataBuilder implements Builder<ApiMetaData, ApiMetaDataBuilder> {
  _$ApiMetaData? _$v;

  Object? _status;
  Object? get status => _$this._status;
  set status(Object? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ApiMetaDataBuilder() {
    ApiMetaData._initialize(this);
  }

  ApiMetaDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _key = $v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMetaData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiMetaData;
  }

  @override
  void update(void Function(ApiMetaDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMetaData build() => _build();

  _$ApiMetaData _build() {
    final _$result = _$v ??
        new _$ApiMetaData._(
          status: status,
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ApiMetaData', 'message'),
          key:
              BuiltValueNullFieldError.checkNotNull(key, r'ApiMetaData', 'key'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
