import 'profile_bloc.dart';

class _SingletonBloc {
  ProfileBloc? _profileBloc;

  ProfileBloc get profileBloc => _profileBloc ??= ProfileBloc();
}

final singletonBloc = _SingletonBloc();
