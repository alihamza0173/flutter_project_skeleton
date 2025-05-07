// ignore_for_file: type=lint, unused_element

part of 'login_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

@PublicInternal(parentStep: 1)
class LoginBlocBuilder extends StatelessWidget {
  final BlocBuilderCondition<LoginState>? buildWhen;
  final BlocWidgetBuilder<LoginState> builder;

  const LoginBlocBuilder({
    Key? key,
    this.buildWhen,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}

@PublicInternal(parentStep: 1)
class LoginBlocSelector<T> extends StatelessWidget {
  final BlocWidgetSelector<LoginState, T> selector;
  final Widget Function(T state) builder;
  final LoginBloc? bloc;

  const LoginBlocSelector({
    final Key? key,
    required this.selector,
    required this.builder,
    this.bloc,
  }) : super(key: key);

  static LoginBlocSelector<String> email({
    final Key? key,
    required Widget Function(String email) builder,
    final LoginBloc? bloc,
  }) {
    return LoginBlocSelector(
      key: key,
      selector: (state) => state.email,
      builder: (value) => builder(value),
      bloc: bloc,
    );
  }

  static LoginBlocSelector<String> password({
    final Key? key,
    required Widget Function(String password) builder,
    final LoginBloc? bloc,
  }) {
    return LoginBlocSelector(
      key: key,
      selector: (state) => state.password,
      builder: (value) => builder(value),
      bloc: bloc,
    );
  }

  static LoginBlocSelector<ApiState<UserData>> loginApi({
    final Key? key,
    required Widget Function(ApiState<UserData> loginApi) builder,
    final LoginBloc? bloc,
  }) {
    return LoginBlocSelector(
      key: key,
      selector: (state) => state.loginApi,
      builder: (value) => builder(value),
      bloc: bloc,
    );
  }

  static LoginBlocSelector<bool> isFormValid({
    final Key? key,
    required Widget Function(bool isFormValid) builder,
    final LoginBloc? bloc,
  }) {
    return LoginBlocSelector(
      key: key,
      selector: (state) => state.isFormValid,
      builder: (value) => builder(value),
      bloc: bloc,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, T>(
      selector: selector,
      builder: (_, value) => builder(value),
      bloc: bloc,
    );
  }
}

mixin _$LoginBlocMixin on Cubit<LoginState> {
  void _listenFields() {}
  @mustCallSuper
  void updateEmail(final String email) {
    emit(this.state.rebuild((final b) => b.email = email));
  }

  @mustCallSuper
  void updatePassword(final String password) {
    emit(this.state.rebuild((final b) => b.password = password));
  }
}
