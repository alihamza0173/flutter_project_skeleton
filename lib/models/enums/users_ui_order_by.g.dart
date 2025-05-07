// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_ui_order_by.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UsersUiOrderBy _$nameAZ = const UsersUiOrderBy._('nameAZ');
const UsersUiOrderBy _$nameZA = const UsersUiOrderBy._('nameZA');
const UsersUiOrderBy _$recentlyRegistered =
    const UsersUiOrderBy._('recentlyRegistered');

UsersUiOrderBy _$valueOf(String name) {
  switch (name) {
    case 'nameAZ':
      return _$nameAZ;
    case 'nameZA':
      return _$nameZA;
    case 'recentlyRegistered':
      return _$recentlyRegistered;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UsersUiOrderBy> _$values =
    new BuiltSet<UsersUiOrderBy>(const <UsersUiOrderBy>[
  _$nameAZ,
  _$nameZA,
  _$recentlyRegistered,
]);

Serializer<UsersUiOrderBy> _$usersUiOrderBySerializer =
    new _$UsersUiOrderBySerializer();

class _$UsersUiOrderBySerializer
    implements PrimitiveSerializer<UsersUiOrderBy> {
  @override
  final Iterable<Type> types = const <Type>[UsersUiOrderBy];
  @override
  final String wireName = 'UsersUiOrderBy';

  @override
  Object serialize(Serializers serializers, UsersUiOrderBy object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UsersUiOrderBy deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UsersUiOrderBy.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
