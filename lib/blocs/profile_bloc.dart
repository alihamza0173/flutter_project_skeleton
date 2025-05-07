import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';

import '../models/data/user_data.dart';
import '../models/serializers.dart';

part 'profile_bloc.bloc.g.dart';

final _logger = Logger('profile_bloc.dart');

@BlocGen(hydrateState: true, hydrateStateKey: 'profile')
class ProfileBloc extends HydratedCubit<UserData?>
    with ChangeNotifier, _$ProfileBlocMixin, _$ProfileBlocHydratedMixin {
  ProfileBloc() : super(null);

  factory ProfileBloc.of(final BuildContext context) =>
      BlocProvider.of<ProfileBloc>(context);

  void updateProfile(final UserData profile) {
    emit(profile);
  }

  void logout() {
    emit(null);
  }

  @override
  void emit(final UserData? state) {
    super.emit(state);
    notifyListeners();
  }
}
