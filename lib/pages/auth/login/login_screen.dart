import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/profile_bloc.dart';
import '../../../widgets/text_fields/form.dart';
import 'bloc/login_bloc.dart';
import 'login_body.dart';

class LoginScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'login';

  const LoginScreen();

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final _) => LoginBloc(profileBloc: ProfileBloc.of(context)),
      child: Scaffold(
        body: LoginBlocSelector(
          selector: (final state) => state.loginApi.isApiInProgress,
          builder:
              (final disableForm) =>
                  AppForm(disable: disableForm, child: const LoginBody()),
        ),
      ),
    );
  }
}
