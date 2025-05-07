import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../../translations/app_localizations.dart';

import 'package:wc_dart_framework/wc_dart_framework.dart';

part 'users_ui_order_by.enum.g.dart';
part 'users_ui_order_by.g.dart';

@EnumGen()
class UsersUiOrderBy extends EnumClass {
  static Serializer<UsersUiOrderBy> get serializer =>
      _$usersUiOrderBySerializer;

  static BuiltSet<UsersUiOrderBy> get values => _$values;

  static UsersUiOrderBy valueOf(final String name) => _$valueOf(name);

  static const UsersUiOrderBy nameAZ = _$nameAZ;
  static const UsersUiOrderBy nameZA = _$nameZA;
  static const UsersUiOrderBy recentlyRegistered = _$recentlyRegistered;

  String translate(final AppLocalizations appLocalizations) {
    return when(
      nameAZ: () => appLocalizations.connectionInformation_connectionFailed,
      nameZA: () => appLocalizations.connectionInformation_connectionFailed,
      recentlyRegistered:
          () => appLocalizations.connectionInformation_connectionFailed,
    );
  }

  const UsersUiOrderBy._(super.name);
}
