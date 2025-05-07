import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'data/user_data.dart';

part 'serializers.g.dart';

@SerializersFor([
  // data
  UserData,
  // enums
  // params
  // response
  //states
])
final Serializers serializers =
    (_$serializers.toBuilder()
          ..addPlugin(StandardJsonPlugin())
          ..add(Iso8601DateTimeSerializer()))
        .build();
