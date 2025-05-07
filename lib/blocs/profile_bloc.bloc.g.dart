// dart format width=80
// ignore_for_file: type=lint, unused_element

part of 'profile_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

class ProfileBlocBuilder extends StatelessWidget {
  final BlocBuilderCondition<UserData?>? buildWhen;
  final BlocWidgetBuilder<UserData?> builder;

  const ProfileBlocBuilder({
    Key? key,
    this.buildWhen,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, UserData?>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}

class ProfileBlocSelector<T> extends StatelessWidget {
  final BlocWidgetSelector<UserData?, T> selector;
  final Widget Function(T state) builder;
  final ProfileBloc? bloc;

  const ProfileBlocSelector({
    final Key? key,
    required this.selector,
    required this.builder,
    this.bloc,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocSelector<ProfileBloc, UserData?, T>(
      selector: selector,
      builder: (_, value) => builder(value),
      bloc: bloc,
    );
  }
}

mixin _$ProfileBlocMixin on Cubit<UserData?> {
  void _listenFields() {}
}
mixin _$ProfileBlocHydratedMixin on HydratedMixin<UserData?> {
  @override
  String get storagePrefix => 'ProfileBloc';

  @override
  Map<String, dynamic>? toJson(UserData? state) {
    final json = <String, dynamic>{};

    try {
      json['profile'] = serializers.serialize(
        state,
        specifiedType: const FullType.nullable(UserData, []),
      );
    } catch (e) {
      _logger.severe('toJson->profile: $e');
    }

    return json;
  }

  @override
  UserData? fromJson(Map<String, dynamic> json) {
    try {
      return serializers.deserialize(
        json['profile'],
        specifiedType: const FullType.nullable(UserData, []),
      ) as UserData?;
    } catch (e) {
      _logger.severe('fromJson->profile: $e');
      return null;
    }
  }
}
