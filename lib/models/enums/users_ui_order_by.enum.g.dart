// dart format width=80
// ignore_for_file: type=lint, unused_element

part of 'users_ui_order_by.dart';

// **************************************************************************
// EnumGenerator
// **************************************************************************

extension XUsersUiOrderBy on UsersUiOrderBy {
  R when<R>({
    required R Function() nameAZ,
    required R Function() nameZA,
    required R Function() recentlyRegistered,
  }) {
    switch (this) {
      case UsersUiOrderBy.nameAZ:
        return nameAZ();
      case UsersUiOrderBy.nameZA:
        return nameZA();
      case UsersUiOrderBy.recentlyRegistered:
        return recentlyRegistered();

      default:
        throw Error();
    }
  }

  R? whenOrNull<R>({
    R? Function()? nameAZ,
    R? Function()? nameZA,
    R? Function()? recentlyRegistered,
  }) {
    switch (this) {
      case UsersUiOrderBy.nameAZ:
        return nameAZ?.call();
      case UsersUiOrderBy.nameZA:
        return nameZA?.call();
      case UsersUiOrderBy.recentlyRegistered:
        return recentlyRegistered?.call();

      default:
        return null;
    }
  }

  R maybeWhen<R>({
    R Function()? nameAZ,
    R Function()? nameZA,
    R Function()? recentlyRegistered,
    required R orElse(),
  }) {
    if (this == UsersUiOrderBy.nameAZ && nameAZ != null) {
      return nameAZ();
    }
    if (this == UsersUiOrderBy.nameZA && nameZA != null) {
      return nameZA();
    }
    if (this == UsersUiOrderBy.recentlyRegistered &&
        recentlyRegistered != null) {
      return recentlyRegistered();
    }

    return orElse();
  }
}
