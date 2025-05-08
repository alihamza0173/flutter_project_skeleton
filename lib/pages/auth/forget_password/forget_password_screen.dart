import 'package:flutter/material.dart';
import '../../../blocs/profile_bloc.dart';
import '../../../models/data/user_data.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/forget-password';

  const ForgetPasswordScreen();

  @override
  Widget build(final BuildContext context) {
    final bloc = ProfileBloc.of(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => bloc.updateProfile(UserData()),
          child: const Text('Sign Up'),
        ),
      ),
    );
  }
}
