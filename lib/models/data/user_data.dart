import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'user_data.g.dart';

abstract class UserData implements Built<UserData, UserDataBuilder> {
  factory UserData([final void Function(UserDataBuilder) updates]) = _$UserData;

  UserData._();

  static Serializer<UserData> get serializer => _$userDataSerializer;

  static UserData fromDynamic(final dynamic json) {
    return serializers.deserializeWith(UserData.serializer, json)!;
  }

  static BuiltList<UserData> fromDynamics(final dynamic json) {
    final list = json as List<dynamic>;
    return BuiltList(list.map(fromDynamic));
  }

  dynamic toDynamic() {
    return serializers.serializeWith(UserData.serializer, this);
  }
}
