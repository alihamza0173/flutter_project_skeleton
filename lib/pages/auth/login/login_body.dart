import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/profile_bloc.dart';
import '../../../models/data/user_data.dart';
import '../../../widgets/loading_text.dart';
import '../../../widgets/text_fields/email_text_form_field.dart';
import '../../../widgets/text_fields/password_text_form_field.dart';
import '../forget_password/forget_password_screen.dart';
import 'bloc/login_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody();

  @override
  Widget build(final BuildContext context) {
    final bloc = LoginBloc.of(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailTextFormField(hintText: 'Email', onChanged: bloc.updateEmail),
          LoginBlocSelector(
            selector: (final state) => state.loginApi.error?.message,
            builder:
                (final error) => PasswordTextFormField(
                  hintText: 'Password',
                  onChanged: bloc.updatePassword,
                  errorText: error,
                ),
          ),
          LoginBlocSelector(
            selector: (final state) => state.loginApi.isApiInProgress,
            builder:
                (final isApiInProgress) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed:
                          isApiInProgress ? null : () => _onLogin(context),
                      child: LoadingText(
                        isLoading: isApiInProgress,
                        text: 'Login',
                      ),
                    ),

                    const SizedBox(height: 22),
                    Center(
                      child: OutlinedButton(
                        onPressed:
                            isApiInProgress
                                ? null
                                : () => context.pushNamed(
                                  ForgetPasswordScreen.ROUTE_NAME,
                                ),
                        child: const Text('Forgot password'),
                      ),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }

  Future<void> _onLogin(final BuildContext context) async {
    ProfileBloc.of(context).updateProfile(UserData());
    // if (!Form.of(context).validate()) {
    //   return;
    // }
    // await LoginBloc.of(context).callLoginApi();
  }
}
