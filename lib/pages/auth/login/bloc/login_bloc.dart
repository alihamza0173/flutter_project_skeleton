import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_internal_annotation/public_internal_annotation.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';

import '../../../../blocs/profile_bloc.dart';
import '../../../../models/data/user_data.dart';
import '../../../../models/states/api_state.dart';
import '../../../../services.dart/auth_service.dart';

import '../../../../utils/cubit.dart';
import '../../../../utils/cubit_utils.dart';
import 'login_state.dart';

part 'login_bloc.bloc.g.dart';

@PublicInternal(parentStep: 1)
@BlocGen()
class LoginBloc extends BVCubit<LoginState, LoginStateBuilder>
    with _$LoginBlocMixin {
  final ProfileBloc _profileBloc;

  LoginBloc({required final ProfileBloc profileBloc})
    : _profileBloc = profileBloc,

      super(LoginState());

  factory LoginBloc.of(final BuildContext context) =>
      BlocProvider.of<LoginBloc>(context);

  Future<void> callLoginApi() {
    return CubitUtils.makeApiCall<LoginState, LoginStateBuilder, UserData>(
      cubit: this,
      apiState: () => state.loginApi,
      updateApiState: (final b, final apiState) => b.loginApi.replace(apiState),
      callApi:
          () => authService.login(email: state.email, password: state.password),
      onSuccess: () => _profileBloc.updateProfile(state.loginApi.data!),
    );
  }
}
